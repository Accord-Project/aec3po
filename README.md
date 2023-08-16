# AEC3PO: Architecture Engineering and Construction Compliance Checking and Permitting Ontology

## Description 

The Architecture Engineering and Construction Compliance Checking and Permitting Ontology (AEC3PO) is a central ontology developed in the context of the Horizon EU project ACCORD. AEC3PO is a comprehensive ontology designed to represent the compliance and permitting stage in the construction domain. It aims to capture and model various aspects related to building compliance, engineering standards, and permitting processes in the architecture, engineering, and construction industry. The ontology is built using Semantic Web technologies, adhering to standards like RDF, OWL, and SKOS. It provides a formal and standardised representation of the knowledge and information related to compliance and permitting requirements in the construction domain. 

## Table of Contents
1. [Namespace](#namespace)
2. [Ontology Requirements](#requirements)
   1. [As Defined in ACCORD Project](#proposal)
   2. [Competency Questions](#competencyQuestions)
      1. [Compliance](#compliance)
      2. [Permitting](#permitting)
3. [Overview of AEC3PO Modules and Alignments](#overview)
   1. [AEC3PO Modules](#modules)
   2. [AEC3PO Alignments](#alignments)
4. [Examples](#examples)
## Namespace <a name="namespace"></a>
The AEC3PO ontology's namespace is `https://w3id.org/lbd/aec3po/`.
The prefixed is `aec3po:`.  


## Ontology Requirements <a name="requirements"></a>

### As Defined in ACCORD Proposal <a name="porposal"></a>

T2.2  Development of the  Building  Compliance  Ontology (BCU,VTT,  CU,  FRA,  ONTO,  SOL,  FUI,  IMT, FUNITEC, JU)[M8-M16]: Drawing on literature, expert interviews, T2.1 and WP1, develop a conceptual ontological model of building compliance requirements,  including laws,  regulations, processes,  and  documentation. This Building Compliance Ontology (BCO) is open-ended, and not tied to specific regional or legal systems.It is aligned  and  compatible  with  established  standard ontologies for  representing both generic concepts  (time, processes, files/document metadata) and the building domain specifically (building topology, construction projects). Specific laws, regulations, processes, and documentation will be implementations of this generic model. (D2.2) 
  
### Competency Questions <a name="competencyQuestions"></a>

#### Compliance <a name="compliance"></a>
1. How to define the metadata of a Document that informs/dictates compliance checking?
2. What is the coverage of a Document per Administrative Area?
3. What are the parts of a document, their unique identifiers and order?
4. How to represent cross-referencing in a document?
5. What type of information (Statement) does a Document contain?
7. What categories or types of check statements can a check statement belong to?
8. What type of check methods needs to be performed for a Statement to comply?
9. Which check statement does a check method operationalize?
10. What are the required data to perform a check?
11. Which feature of interest needs to be checked and how it is designed?
12. Which checking act needs to be made and which check method it uses?
13. How to access the outcomes of a checking act?
14. How to transform normative documents into a single well-defined rule which can be implemented into BIM / IFC based model checking software using RASE methodology?

#### Permitting <a name="permitting"></a>
 1. What are the stages of the Permitting process per Administrative Area?
 2. What evidence is required in each stage?
 3. Which standards the permitting stages are related to?
 4. What types of checks and verifications are necessary to ensure compliance with building regulations during the permitting phase?

## Overview of AEC3PO modules and alignements <a name="Overview"></a>

### AEC3PO Modules <a name="modules"></a>
The AEC3PO ontology is designed to represent various aspects of the construction domain, focusing on compliance and permitting. It is organised into five main modules, each comprising sub-modules, classes, and properties. These modules facilitate the modeling of different components and relationships within the construction domain. The figure below shows an overview of these modules and the relations among them.

![AEC3PO Overview](images/aec3po_v1.0.0_Modules.png) 
Below is an overview of each module and its sub-components:
1. **Module 1: Document**
  - Classes: _DocumentSubdivision_, _Statement_, _CheckStatement_, _DefinitionStatement_, _ChecklistStatement_, _Evidence_, _DataRequirement_, _etc_.
  - Properties: hasPart, hasRequiredData, hasEvidence, forDocument, hasPermittingStage, etc.

2. **Module 2: CheckMethod**
  -	Classes: _CheckMethod_, _BooleanCheckMethod_, _ComponentCheckMethod_, _SHACLCheckMethod_, _etc_.
  -	Properties: _hasSubCheck_, _operationalize_, _forDesign_, _etc_.

3. **Module 3: Design**
  -	Classes: _Design_, _PropertyDesign_, _ComparisonOperation_, _etc_.
  -	Properties: _hasDesign_, _hasPropertyDesign_, _hasComparisonOperator_, _etc_.
  
4. **Module 4: FeatureOfInterest**
  - Classes: _FeatureOfInterest_, _Property_, _PropertyKind_, _QuantityKind_
  -	Properties: _hasProperty_, _hasQuantityKind_, _hasPropertyKind_, _hasUnit_, _hasDesign_, _hasContext_, _etc_.
  
5. **Module 5: CheckingAct**
  - Classes: _CheckingAct_, _ProcessVerifier_, _ConformanceReport_
  - Properties: _usedMethod_, _madeBy_, _hasReport_
  
Each module encompasses classes that represent specific entities or concepts in the construction domain. For example, the **_Document_** module deals with different types of statements, evidence, and related properties. The **_CheckMethod_** module focuses on different types of check methods, such as procedural, declarative, boolean, component, and SHACL checks. 
Similarly, the **_Design_** module includes classes representing design-related concepts, while the **_FeatureOfInterest_** module deals with features like building components and spaces. The **_CheckingAct_** module represents different verifier roles, their associated methods, and the conformance report that stores the outcomes of the check. 

### AEC3PO Alignments <a name="alignments"></a>
AEC3PO contains five modules, each of them imports an external ontology, and specifies a set of alignment axioms to connect the terms of the imported ontologies with each other. The figure below illustrates the alignment of the AEC3PO ontology with various other ontologies, showcasing how different domains and concepts interconnect for a comprehensive representation of compliance and permitting in the construction industry.

In the figure, the AEC3PO ontology is positioned at the center, with arrows extending outward to connect with other related ontologies. Each ontology is represented as a distinct node, emphasising the integration of diverse knowledge domains. The alignment signifies the synergy achieved by harmonising multiple ontologies to enhance the overall understanding and modeling of compliance and permitting processes in the construction sector.

![AEC3PO Overview](images/aec3po-Alignment.png)

The figure above effectively conveys the interconnectedness of different ontologies with AEC3PO for a holistic understanding of compliance and permitting processes in the construction industry. This alignment facilitates cross-domain information sharing, enabling more accurate and comprehensive modeling of the complex construction ecosystem. The table below lists all the external ontologies, the namespaces and the suggested prefix for each ontology modules is also provided.


| Ontology          |  Namespace                        | Prefix    | Description and Usage                                                        |
|-------------------|-----------------------------------|-----------|------------------------------------------------------------------------------|
| DCMI Metadata Terms       |  [http://purl.org/dc/terms/](http://purl.org/dc/terms/)  | _dct:_  |The Dublin Core Terms (DCT) ontology is used within the "AEC3PO" ontology to provide a standardised framework for describing and managing metadata related to documents and other resources in the construction compliance and permitting context. |
|eli         |[http://data.europa.eu/eli/ontology#](http://data.europa.eu/eli/ontology#) |_eli:_ | The European Legislation Identifier (ELI) ontology is used within the "AEC3PO" ontology to provide a standardized framework for referencing and managing legal and legislative information related to documents, regulations, and other legal entities within the construction compliance and permitting context. |
| Stages      | [https://w3id.org/digitalconstruction/0.5/Stages](https://w3id.org/digitalconstruction/0.5/Stages) |_dicstg:_ | The Digital Construction Stages vocabulary is used within the "AEC3PO" ontology to define product lifecycle stage frameworks and their specific stages as individuals according to some standards like BS_EN_16310, HOAI, ISO_22263, RIBA. |
| LifeCycle | [https://w3id.org/digitalconstruction/0.5/Lifecycle#](https://w3id.org/digitalconstruction/0.5/Lifecycle#) |_dicl:_ | The Digital Construction LifeCycle vocabulary is used within the "AEC3PO" ontology to define the evolution of information through LOD levels and over the construction lifecycle. |
| FOAF | [http://xmlns.com/foaf/spec/](http://xmlns.com/foaf/spec/) |_foaf:_ | The Friend of a Friend (FOAF) ontology is used within the "AEC3PO" ontology to define agents and organisations such as the _Legal Verifier_. |
| schema.org | [https://schema.org/](https://schema.org/) |_schema:_ | The schema.org ontology is used within the "AEC3PO" ontology to define the BIM model as a 3D Model, and the different formats that an evidence might have such as _image_, _stillImage_ (for drawings), etc. |
| QUDT | [http://qudt.org/2.1/schema/qudt](http://qudt.org/2.1/schema/qudt) |_qudt:_ | The QUDT (Quantities, Units, Dimensions, and Data Types) ontology provides a standardised way to represent quantities, units of measurement, and their relationships. It is used within the "AEC3PO" ontology to define the quantities and units represented in a Statement or related to a feature of interest. |
| Unit | [http://qudt.org/vocab/unit/](http://qudt.org/vocab/unit/) |_unit:_ | The Unit Ontology (Unit) is a resource that provides a standardised way to represent units of measurement and their conversions. It is used within the "AEC3PO" ontology to provide standardised units for the properties and values. |
| ifcOWL | [https://standards.buildingsmart.org/IFC/DEV/IFC4/ADD2/OWL/](https://standards.buildingsmart.org/IFC/DEV/IFC4/ADD2/OWL/) |_ifcowl:_ | The Industry Foundation Classes (IFC) ontology in OWL (ifcOWL) is a standardised ontology for representing building and construction information. It is used to serve as a reference or a source of domain-specific knowledge that complements the information represented in "AEC3PO." | 
| Open Graph Protocol| [https://ogp.me/ns#](https://ogp.me/ns#) |_og:_ | The Open Graph Protocol (OGP) ontology provides a standardised way to describe and represent the properties of a web page or resource. It is used within the "AEC3PO" ontology to define the URLs of the bSDD contexts of properties and features of interest. | 
| Function| [https://w3id.org/function/ontology#](https://w3id.org/function/ontology#) |_fno:_ | The Function Ontology is a lightweight ontology designed to represent functions and their relationships in various domains. It is used within the "AEC3PO" ontology to represent the functional relationships between different components, systems, and elements in the built environment. The function can be related to an implementation. I.e. SPARQL, Shacl - or a microservice. |
| SKOS| [http://www.w3.org/2004/02/skos/core#](http://www.w3.org/2004/02/skos/core#) |_skos:_ | The Simple Knowledge Organization System (SKOS) ontology is commonly used to represent and manage controlled vocabularies, taxonomies, and thesauri. Within the context of the "AEC3PO" ontology, SKOS is used in various ways to enhance the representation and organisation of concepts and terms related to compliance, design, construction, and permitting processes. |
| DUL| [http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#](http://www.ontologydesignpatterns.org/ont/dul/) |_dul:_ | The DUL (DOLCE + DnS Ultralite) ontology, which is an upper-level ontology, is used in the "AEC3PO" ontology to provide a foundational framework for modeling and representing various concepts and relationships in a more coherent and structured manner, such as the _CheckMethod_, _qualities_, _CheckingAct_, etc.  |



## Examples <a name="examples"></a>

The folder [`examples`](https://github.com/Accord-Project/aec3po/tree/main/examples) contains a collection of Turtle files that demonstrate the instantiation of the AEC3PO ontology in the context of the demo countries **_Finland_**, **_Estonia_**, **_Spain_** and **_UK_**. Each Turtle file within the folder represents a specific scenario where the ontology is instantiated to model compliance checking and permitting processes for a different use case from the demo countries use cases. The purpose of these examples is to showcase how AEC3PO can be applied to real-world scenarios and adapted to specific regulatory contexts. The folder contains sub-folders with the name of the demo countries. Each sub-folder contains the turtle file and related documentation. Every example is documented in the corresponding `readme file`. 

The following table represents a summary of the use cases: 

| Demo Country      |  Use Case                  | Description                                    | Source   | Notes |
|-------------------|----------------------------|------------------------------------------------|----------|------|
|Finland           |FI2 - Accessibility         | This example represents the `ramp` check. The rules are defined in Section 2/Subsection 2 from the English tranlation of the Finnish Accessibility document. | [link](https://github.com/Accord-Project/aec3po/blob/main/examples/Finland/FI-accessibility-AEC3PO.ttl) | Dummy values used to represent the real `ramp`. |
|Finland         |FI3 - CO2 Emission | The rules are defined in the English translation of the Decree of the Ministry of the Environment on the climate assessment of buildings (Draft 30.9.2022, consultation round). | [link](https://github.com/Accord-Project/aec3po/blob/main/examples/Finland/FI3-CO2_Emission-AEC3PO.ttl) | Full real example. |   
|Estonia   |EE1 - Fire Safety | Two rules related to the `operational map` of the building have been selected from the Estonian legistlation issued on 01-03-2021. | [link](https://github.com/Accord-Project/aec3po/blob/main/examples/Estonia/Estonia_Example.ttl) | Only the statements have been implemented. | 
|Spain   |ES2 - Cultural Centre | Two rules have been selected to check the conformance of the `cantiliver` of the cultural centre with the regulations. These rules are defined in the POUM document, which is the Municipal Urban Planning Plan Regulations document, definitively approved by the Barcelona Territorial Planning Commission on 13-07-2005. | [link](https://github.com/Accord-Project/aec3po/blob/main/examples/Spain/Spanish_Example.ttl) | Full real example. | 
|UK     |UK1 - Timber Structure  | This example represents check in `compression parallel to the grain in timber structures`, as described in the latest version of Eurocode 5 (EN 1995-1-1:2004+A2:2014) | [link](https://github.com/Accord-Project/aec3po/blob/main/examples/UK/UK-Timber%20Structure.ttl) | Dummy values used to represent the real `timber`. |

## AEC3PO Dissemination

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

## TBC




