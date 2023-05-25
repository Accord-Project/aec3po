#!/usr/bin/env python3
import os
import sys
import logging
import shutil
import subprocess
import rdflib
from rdflib import Graph, URIRef, Literal, BNode
from rdflib.namespace import RDF, OWL, DCTERMS, XSD, RDFS
import pylode
import mistune

# This script checks the quality of the ontology, generates the html documentation, and ultimately builds the `public` folder that contains the documentation website of the ontology

logging.basicConfig(level=logging.DEBUG)

base = "https://w3id.org/lbd/aec3po/"
dest = "public"

os.makedirs(dest, exist_ok=True)
shutil.copytree("resources", dest, dirs_exist_ok=True)

def process_turtle_file(input_file_path:str, dest_path:str):

    # parse and check ttl syntax
    g = Graph()
    try:
        g.parse(input_file_path)
    except rdflib.plugins.parsers.notation3.BadSyntax as err:
        err_string = str(err).replace('\n', '\n  ')
        logging.error(f"File {input_file_path} {err_string}")
        sys.exit(1) # exit with error code if there is a parsing error

    if len(list(g.subjects(RDF.type, OWL.Ontology))) != 1: # check there is one ontology declaration
        logging.error("There MUST be exactly one triple: `?ontology rdf:type owl:Ontology`")
        sys.exit(1) # exit with error code if there is a parsing error

    for ontology in g.subjects(RDF.type, OWL.Ontology):
        logging.debug(f"The ontology is {ontology.n3()}")
        break;

    # find when the file was first added to the git repository, and set dct:created ? 

    git_dct_created = subprocess.check_output(["git", "log", "--diff-filter=A", "--format='%ad'", "--date=short", "--", input_file_path]).decode('ascii')[1:-2]

    for dct_created in g.objects(ontology, DCTERMS.created):
        break

    try:
        dct_created
    except NameError:
        logging.debug(f"No dct:created attribute. Adding the date when {input_file_path} was first commited: {git_dct_created}")
        g.add((ontology, DCTERMS.created, Literal(git_dct_created,datatype=XSD.date)))
    else:
        if dct_created.lstrip() != git_dct_created:
            logging.debug(f"dct:created value {dct_created.n3()} is different from the date when {input_file_path} was first commited: {git_dct_created}")


    # find when the file was last changed in the git repository, and set dct:modified.

    # find when the set dct:modified automatically ?
    git_dct_modified = subprocess.check_output(["git", "log", "-1", "--format='%ad'", "--date=short", "--", input_file_path]).decode('ascii')[1:-2]
    dct_modified = Literal(git_dct_modified,datatype=XSD.date)
    if (ontology, DCTERMS.modified, dct_modified) not in g:
        g.add((ontology, DCTERMS.modified, dct_modified))
        logging.debug(f"adding last git commit date as dct:modified value: {git_dct_modified.lstrip()}")

    # generate html documentation and rdf variants
    html = pylode.MakeDocco(input_data_file=input_file_path).document()
    with open(dest_path+ ".html", "w") as output:
        output.write(html)
    with open(dest_path+ ".ttl", "wb") as output:
        output.write(g.serialize(format='ttl', encoding='utf-8'))
    with open(dest_path+ ".rdf", "wb") as output:
        output.write(g.serialize(format='pretty-xml', encoding='utf-8'))
    with open(dest_path+ ".json-ld", "wb") as output:
        output.write(g.serialize(format='json-ld', indent=4, encoding='utf-8'))
    with open(dest_path+ ".n3", "wb") as output:
        output.write(g.serialize(format='n3', encoding='utf-8'))
    with open(dest_path+ ".nt", "wb") as output:
        output.write(g.serialize(format='nt', encoding='utf-8'))

    with open(f"{dest}/.htaccess", "a") as f:
        definedTerms = []
        for definedTerm in g.subjects(RDFS.isDefinedBy, ontology):
            localName = str(definedTerm)[len(base):]
            if localName == '':
                continue
            definedTerms.append(localName)
        if len(definedTerms) != 0:
            f.write(f"""
RewriteCond %{{REQUEST_URI}} ^/aec3po/({"|".join(definedTerms)})$
RewriteRule ^(.*)$ /aec3po/{dest_path[7:]}#$1 [R=303,NE]
            """)
            

for root, dirs, files in os.walk("src"):
   for name in files:
      if not name.endswith(".ttl") or name.startswith("_"):
           continue
      print(os.path.join(root, name))
      input_file_path = os.path.join(root, name)
      dest_path = os.path.join(dest, name)[0:-4]
      process_turtle_file(input_file_path, dest_path)
