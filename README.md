# AEC3PO: Architecture Engineering and Construction Compliance Checking and Permitting Ontology

## Description 

The Architecture, Engineering, Construction, Compliance Checking and Permitting Ontology (AEC3PO) is an ontology developed in the context of the Automated Compliance Checks for Construction, Renovation or Demolition Works (ACCORD) project, which is a Horizon European project that aims to digitalise permitting and compliance processes. 
AEC3PO has been developed in order to capture all aspects of building compliance and building permitting in Architecture, Engineering, and Construction (AEC). It allows the modelling of aspects such as:

- building codes, regulations, and standards
- compliance and permitting processes  and documentation
- compliance and permitting actors

The ontology requirements are essentially derived from the rule formalisation methodology that aims to semantise regulations and provide an open format for machine-readable rules. 

The ontology is built using Semantic Web technologies, adhering to standards like RDF, OWL, and SKOS. It makes use of well-known ontologies like Dublin Core Terms (DCT), Europe's Legislation Identifier (ELI), and more to create a structured and interconnected knowledge graph. This allows professionals to explore, query, and understand various aspects of the compliance and permitting processes more comprehensively.


## Table of Contents
1. [Namespace](#namespace)
2. [Ontology Requirements](#requirements)
   1. [ACCORD Requirements](#proposal)
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

### ACCORD Requirements <a name="porposal"></a>

The AEC3PO is a significant component of the Compliance and Permitting Semantic Framework developed in the ACCORD project. As part of Work Package 2 (WP2), AEC3PO plays a pivotal role in Task T2.2, building upon the foundation laid by the literature prepared in Task T2.1. Drawing inspiration from the ontologies presented in T2.1, AEC3PO establishes a structured knowledge representation that captures essential concepts, relationships, and rules related to compliance checks and permitting stages within construction projects. By aligning with the objectives of the ACCORD project, AEC3PO serves as the basis of i) rule formalization methodology (Task 2.3); ii) Domain Specific Rule Language, and iii) 
rule formalization tool (Task 2.3), facilitating seamless communication and collaboration among experts, stakeholders, and regulatory bodies in the AEC industry.
  
### Competency Questions <a name="competencyQuestions"></a>

#### Compliance <a name="compliance"></a>
1. How to define the metadata of a compliance checking related Document?
3. What are the parts of a document, their unique identifiers, and their order?
4. How to represent cross-referencing in a document?
5. What type of information (Statement) does a Document contain?
7. What categories or types of check statements can a check statement inform?
8. What type of check methods need to be performed for a Statement to comply?
9. Which check statement does a check method operationalize?
10. What are the required data to perform a check?
11. Which feature of interest needs to be checked and how it is designed?
12. Which checking act needs to be made and which check method it uses?
13. How to access the outcomes of a checking act?
14. How to transform normative documents into a single well-defined rule that can be implemented into BIM / IFC based model checking software using RASE methodology?
15. What is the coverage of a Document per Administrative Area?

#### Permitting <a name="permitting"></a>
 1. What are the stages of the Permitting process per Administrative Area?
 2. What evidence is required in each stage?
 3. Which standards the permitting stages are related to?
 4. What types of checks and verifications are necessary to ensure compliance with building regulations during the permitting phase?

## Overview of AEC3PO modules and alignements <a name="Overview"></a>

### AEC3PO Modules <a name="modules"></a> 
The AEC3PO ontology is designed to represent various aspects of the construction domain, focusing on compliance and permitting. It is organised into different modules, each comprising classes, and properties. These modules facilitate the modeling of different components and relationships within the construction domain. The figure below shows an overview of these modules and the relations among them.

![AEC3PO Overview](images/aec3po_v1.0.2_Modules.png) 

Below is an overview of each module and its sub-components:
1. **Module 1: Document**: This module describes the metadata of a building-compliance related document and its composition in terms of subdivisions (sections, tables, images) which come in a hierarchical form.
  - Classes: _Document_, _DocumentSubdivision_.
  - Properties: _hasPart_, _hasRequiredData_, _forDocument_, _hasPermittingStage_, _etc_.

2.  **Module 2: Statement**: This module describes things stated in a building compliance-related document.
  - Classes: _Statement_, _DefinitionStatement_, _CheckStatement_, _CheckListStatement_, _CategoryCheckStatement_, _CertificateCheckStatement_, _BooleanCheckStatement_, _NumericalCheckStatement_, _HumanEvaluatedCheckStatement_, _etc_.
  - Properties: _hasSubdivision_, _hasRequiredData_, _hasEvidence_, _hasDefinition_, _definitionOf_, _etc_.

3. **Module 3: DataRequirement**: This module describes all data requirements that are dictated from the statement. The format of data requirements adopted by ACCORD is IDS. 
  -	Classes: _DataRequirement_, _IDS_.
  -	Properties: _hasFormat_, _etc_.

4. **Module 4: Evidence**: This module describes all evidence that can be provided to assess the validity and relevance of the statement. The evidence comes in different format such as an expert report, a certificate etc. 
  -	Classes: _Evidence_.
  -	Properties: _hasFormat_, _forDocument_, _etc_.

5. **Module 5: CheckMethod**: This module describes pieces of information that operationalize check statements in documents.
  -	Classes: _CheckMethod_, _BooleanCheckMethod_, _ComponentCheckMethod_, _SHACLCheckMethod_, _ACCORDCheckMethod_, _FuncionCheckMethod_, etc.
  -	Properties: _hasUnit_, _hasTarget_, _operationalizes_, _operationalizedBy_, _nests_,_etc_.
  
6. **Module 6: FeatureOfInterest**: This module describes objects whose conformance against checks is verified, and those aspects of a feature of interest that are intrinsic to and cannot exist without the feature of interest, that must be checked for conformance.
  - Classes: _FeatureOfInterest_, _Property_, _PropertyKind_, _QuantityKind_
  -	Properties: _hasProperty_, _hasQuantityKind_, _hasPropertyKind_, _hasDesign_, _hasContext_, _etc_.
  
7. **CheckingAct**: This AEC3PO module describes the act of checking some entities for something and generating a conformance report.
    - Classes: _CheckingAct_, _ProcessVerifier_, _etc_.
    - Properties: _usedMethod_, _madeBy_, _hasReport_, _checks_, _etc_.

8. **ConformanceReport**: This AEC3PO module describes results of some `aec3po:ProcesVerifier` checking some entity via a `aec3po:CheckingAct`. Entities may be validated or repudiated.
    - Classes: _ConformanceReport_, _result_, _ValidationResult_,_Severity_, _etc_.
    - Properties: _conforms_, _focus_, _resultMessage_, _resultSeverity_, _Info_, _Violation_, _Severity_,_etc._

9. **Model**: This AEC3PO module describes BIM models.
    - Classes: _Model_, _Phase_, _Element_, _Classification_, _etc_.
    - Properties: _name_, _description_, _location_, _locationCoverage_, _material_, _hasBuildingPhase_, _hasDimensions_, _hasElementPhase_, _hasClassification_, _etc._

10. **Table**: This AEC3PO module describes tables as representations of data in rows and columns. Tables are described by captions.
    - Classes: _Container_, _Table_, _Column_, _Row_, _Cell_.
    - Properties: _contains_, _isContainedIn_, _caption_.
      
Each module encompasses classes that represent specific entities or concepts in the construction domain. For example, the **_Document_** module deals with different types of statements, evidence, and related properties. The **_CheckMethod_** module focuses on different types of check methods, such as procedural, declarative, boolean, component, SHACL and ACCORD checks. 
Similarly, the **_Design_** module includes classes representing design-related concepts, while the **_FeatureOfInterest_** module deals with features like building components and spaces. The **_CheckingAct_** module represents different verifier roles, their associated methods, and the **_ConformanceReport_** stores the outcomes of the check, their validation results and the corresponding messages. 

### AEC3PO Alignments <a name="alignments"></a>
AEC3PO contains five modules, each of them imports an external ontology, and specifies a set of alignment axioms to connect the terms of the imported ontologies with each other. The figure below illustrates the alignment of the AEC3PO ontology with various other ontologies, showcasing how different domains and concepts interconnect for a comprehensive representation of compliance and permitting in the AEC industry.

In the figure, the AEC3PO ontology is positioned at the center, with arrows extending outward to connect with other related ontologies. Each ontology is represented as a distinct node, emphasising the integration of diverse knowledge domains. The alignment signifies the synergy achieved by harmonising multiple ontologies to enhance the overall understanding and modeling of compliance and permitting processes in the AEC sector.

![AEC3PO Overview](images/aec3po-Alignment2.png)

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

| Demo Country      |  Use Case                  | Description                                    | Source   |
|-------------------|----------------------------|------------------------------------------------|----------|
|Finland           |FI2 - Accessibility         | This example represents the `ramp` check. The rules are defined in Section 2/Subsection 2 from the English tranlation of the Finnish Accessibility document ([More details](https://github.com/Accord-Project/aec3po/tree/main/examples/Finland)). | [link](https://github.com/Accord-Project/aec3po/blob/main/examples/Finland/FI-accessibility-AEC3PO.ttl) | 
|Finland         |FI3 - CO2 Emission | The rules are defined in the English translation of the Decree of the Ministry of the Environment on the climate assessment of buildings (Draft 30.9.2022, consultation round) ([More details](https://github.com/Accord-Project/aec3po/tree/main/examples/Finland)). | [link](https://github.com/Accord-Project/aec3po/blob/main/examples/Finland/FI3-CO2_Emission-AEC3PO.ttl) |   
|Estonia   |EE1 - Fire Safety | Two rules related to the `operational map` of the building have been selected from the Estonian legistlation issued on 01-03-2021 ([More details](https://github.com/Accord-Project/aec3po/tree/main/examples/Estonia)). | [link](https://github.com/Accord-Project/aec3po/blob/main/examples/Estonia/Estonia_Example.ttl) | 
|Spain   |ES2 - Cultural Centre | Two rules have been selected to check the conformance of the `cantiliver` of the cultural centre with the regulations. These rules are defined in the POUM document, which is the Municipal Urban Planning Plan Regulations document, definitively approved by the Barcelona Territorial Planning Commission on 13-07-2005 ([More details](https://github.com/Accord-Project/aec3po/tree/main/examples/Spain)). | [link](https://github.com/Accord-Project/aec3po/blob/main/examples/Spain/Spanish_Example.ttl) |
|UK     |UK1 - Timber Structure  | This example represents check in `compression parallel to the grain in timber structures`, as described in the latest version of Eurocode 5 (EN 1995-1-1:2004+A2:2014) ([More details](https://github.com/Accord-Project/aec3po/tree/main/examples/UK)). | [link](https://github.com/Accord-Project/aec3po/blob/main/examples/UK/UK-Timber%20Structure.ttl) | 

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

A CI/CD pipeline validates the ontology, generates the ontology artifacts, and release the ontology.

The `public` folder is automatically generated as described in `.asimov/README.md` and pushed to the server. It is therefore ignored by git.




