# Scripts folder

This folder contains scripts that are used to check the quality of the ontology, generate the html documentation, and ultimately build the `public` folder that contains the documentation website of the ontologies.

Source: https://gitlab.emse.fr/victor.charpenay1/samod-template/-/blob/master/.samod/README.md

## extract_diagrams.sh

This script extracts a png image from each tab in the `aec3po.drawio` file, and store them in the `public` folder

**known bug:** there shall be no space in the tab names

## publish.sh

### Description

`publish.sh` copies the content of the resources folder to the public folder, then processes each turtle file in the public folder. For each turtle file `example.ttl`, it:

- checks there exists an ontology declaration, 
- computes the `dct:created` and `dct:modified` based on the first and last commit dates
- generates the html documentation using pyLODE
- inject a description snippet based on file `example.description.md` or `example.description.html`
- inject an overview snippet based on file `example.overview.md` or `example.overview.html`
- generates other RDF variants (RDF/XML, n3, n-triples)
- generates the htaccess file so that each term URI redirects to the module where the term is defined.
 
### Run the script

To execute this script, you need python 3, and the requirements in `scripts/requirements.txt`.
Best is to create a virtual environment 

```
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install -r .acimov/requirements.txt
```

Don't forget to activate the virtual environment for each session.

```
source .venv/bin/activate
```

Then call the script:

```
python .acimov/publish.py
```
