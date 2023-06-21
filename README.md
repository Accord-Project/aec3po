# AEC3PO: Architecture Engineering and Construction Compliance Checking and Permitting Ontology

## Introduction

The Architecture Engineering and Construction Compliance Checking and Permitting Ontology (AEC3PO) is a central ontology developed in the context of the EU project ACCORD.

It uses namespace `https://w3id.org/lbd/aec3po/`, prefixed `aec3po:`.



## Ontology Requirements

### As defined in the proposal

T2.2  Development  of  the  Building  Compliance  Ontology (BCU,VTT,  CU,  FRA,  ONTO,  SOL,  FUI,  IMT, FUNITEC, JU)[M8-M16]: Drawing on literature, expert interviews, T2.1 and WP1, develop a conceptual ontological model of building compliance requirements,  including laws,  regulations, processes,  and  documentation. This Building Compliance Ontology (BCO) is open-ended, and not tied to specific regional or legal systems.It is aligned  and  compatible  with  established  standardontologies  for  representing  both  generic  concepts  (time,  processes, files/document metadata) and the building domain specifically (building topology, construction projects). Specific laws, regulations, processes, and documentation will be implementations of this generic model. (D2.2)

### Requirements from T2.3 Machine-executable Regulations 

- Represent: a Document and Document Metadata.
- Represent: Sections, Subsections, Paragraphs, Subparagraphs, Lists, list items etc….
- Represent Cross referencing (inside and outside a document).
- Represent Tables, Figures, Equations and Captions of these.
- Identify a part of the document as containing rules, definitions or informative text.
- Identify individual rules –uniquely identify them in some way.
- Identify groups of rules.
- Allow the specification of the logic to relate rules and groups of rules together.
- From tbeach 2023-05-24: one needs to be able to roundtrip from the document to the ontology, and back, preserving the structure and most of the text.
- From tbeach 2023-05-24: under DocumentSubdivision, one need diagrams, image files, ...
- From tbeach 2023-05-24: under DocumentSubdivision, one need to describe tables, ...
- Gonzal: Taxonomy of different functions i.e.  volume calculation, distance calculation. 



## Competency Questions

### Compliance
1. How to define the metadata of a Document that informs/dictates compliance checking?
2. What is the coverage of a Document per Administrative Area?
3. What are the parts of a document, their unic identifiter and order?
4. What type for information (Statement) does a Document contain?
5. What type of check needs to be performed for a Statement to comply?
6. Required data to perform a check. 

### Permitting
 1. What are the stages of the Permitting process per Administrative Area?
 2. What evidence is required in each stage?

## Pre-commits

run `pre-commit install` to set up the git hook scripts:

```
$ pre-commit install
pre-commit installed at .git/hooks/pre-commit
```

now `pre-commit` will run automatically on `git commit`!

you can also run `pre-commit` once on all files:

```
pre-commit run --all-files
```

## CI/CD pipeline

A CI/CD pipeline must be developed to validate the ontology, generate the ontology artifacts, release the ontology.

* The `public` folder is ignored by git. It is where temporary files are generated.  
* The HTML Documentation may be automatically generated using ex. pyLODE.
* The `public` folder may be published to a server.

## Examples

Folder `examples` contains examples for AEC3PO

## Alignments

Folder `external` contains useful excerpts of external ontologies and vocabularies that may be considered useful for the development or alignemnt of AEC3PO.
Terms in the AEC3PO may be aligned to 

## AEC3PO Dissemination


## TBC




