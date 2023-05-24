# AEC3PO: Architecture Engineering and Construction Compliance Checking and Permitting Ontology

## Introduction

The Architecture Engineering and Construction Compliance Checking and Permitting Ontology (AEC3PO) is a central .

It uses namespace `https://w3id.org/lbd/aec3po/`, prefixed `aec3po:`.

ontology developed in the context of the EU project ACCORD 

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

## Competency Questions

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




