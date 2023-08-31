# AEC3PO: Architecture Engineering and Construction Compliance Checking and Permitting Ontology

## Introduction

The Architecture Engineering and Construction Compliance Checking and Permitting Ontology (AEC3PO) is a central ontology developed in the context of the EU project ACCORD. AEC3PO is a comprehensive ontology designed to represent the compliance and permitting stage in the construction domain. It aims to capture and model various aspects related to building compliance, engineering standards, and permitting processes in the architecture, engineering, and construction industry. The ontology is built using Semantic Web technologies, adhering to standards like RDF, OWL, and SKOS. It provides a formal and standardised representation of the knowledge and information related to compliance and permitting requirements in the construction domain. 


## Ontology Requirements

### As defined in the proposal

T2.2  Development of the  Building  Compliance  Ontology (BCU,VTT,  CU,  FRA,  ONTO,  SOL,  FUI,  IMT, FUNITEC, JU)[M8-M16]: Drawing on literature, expert interviews, T2.1 and WP1, develop a conceptual ontological model of building compliance requirements,  including laws,  regulations, processes,  and  documentation. This Building Compliance Ontology (BCO) is open-ended, and not tied to specific regional or legal systems.It is aligned  and  compatible  with  established  standard ontologies for  representing both generic concepts  (time, processes, files/document metadata) and the building domain specifically (building topology, construction projects). Specific laws, regulations, processes, and documentation will be implementations of this generic model. (D2.2)

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
- Gonzal: Taxonomy of different functions i.e.  volume calculation, distance calculation. (Reference, Section 5: https://www.sciencedirect.com/science/article/pii/S266616592300056X).
- Vladimir: Certificate classifications and metadata.
- Edlira: BSDD to represent FearcureOfInterest.
- Edlira: IDS link to Required Data. 
  




