## Overview of AEC3PO modules and alignements <a name="Overview"></a>

### AEC3PO Modules <a name="modules"></a> 
AEC3PO aims to model all aspects of compliance and permitting on the AEC domain, across different regulatory systems.
It is organised into modules, comprising of classes and properties. The figure below shows an overview of these modules and their relations.

![AEC3PO Overview](diagrams/aec3po_v1.0.2_Modules.png)

Below is an overview of the core modules and their components:

1. **Document**:A document, of any kind, typically related to compliance and permitting.
    - Classes: _Document_, _DocumentSubdivision_.
    - Properties: _hasPart_, _hasRequiredData_, _forDocument_, _hasPermittingStage_, _etc_.

2.  **Statement**: A statement, of any kind, found in a document.
    - Classes: _Statement_, _DefinitionStatement_, _CheckStatement_, _CheckListStatement_, _CategoryCheckStatement_, _CertificateCheckStatement_, _BooleanCheckStatement_, _NumericalCheckStatement_, _HumanEvaluatedCheckStatement_, _etc_.
    - Properties: _hasSubdivision_, _hasRequiredData_, _hasEvidence_, _hasDefinition_, _definitionOf_, _etc_.

3. **DataRequirement**: The data requirements that derive from a statement. These can describe any aspect of the building model or any type of property, physical or conceptual, associated with it.
    -	Classes: _DataRequirement_, _IDS_.
    -	Properties: _hasFormat_, _etc_.

4. **Evidence**: The evidence that an actor in the compliance and permitting process needs to provide in order to prove that the requirements derived from a Statement have been met.
    -	Classes: _Evidence_.
    -	Properties: _hasFormat_, _forDocument_, _etc_.

5. **CheckMethod**: Information that operationalizes Checks in documents.
    -	Classes: _CheckMethod_, _BooleanCheckMethod_, _ComponentCheckMethod_, _SHACLCheckMethod_, _CompositeCheckMethod_, _FuncionCheckMethod_, _etc_.
    -	Properties: _hasUnit_, _hasTarget_, _operationalizes_, _operationalizedBy_, _etc_.
  
6. **FeatureOfInterest**: An element of a site, building, or piece of infrastructure that is of interest. Typically, this will be a building component that needs to be compliant to regulations, or be documented in the permitting process. 
    - Classes: _FeatureOfInterest_, _Property_, _PropertyKind_, _QuantityKind_, _etc_.
    -	Properties: _hasProperty_, _hasQuantityKind_, _hasPropertyKind_, _hasDesign_, _hasContext_, _etc_.
  
7. **CheckingAct**: The act of checking an entity for compliance, and producing the respective report.
    - Classes: _CheckingAct_, _ProcessVerifier_, _etc_.
    - Properties: _usedMethod_, _madeBy_, _hasReport_, _checks_, _etc_.

8. **ComplianceVerificationReport**: An automatically generated report that checks if all the assigned compliance requirements (typically Checks) have been met. This will typically show the results of some `aec3po:ProcesVerifier` checking entities via some `aec3po:CheckingAct`. Entities may be validated or repudiated.
    - Classes: _ConformanceReport_, _result_, _ValidationResult_,_Severity_, _etc_.
    - Properties: _conforms_, _focus_, _resultMessage_, _resultSeverity_, _Info_, _Violation_, _Severity_,_etc._

9. **Design**: This AEC3PO module describes descriptions of some design of features of interest, in terms of structure, geometry, and function. 
    - Classes: _Design_, _PropertyDesign_.
    - Properties: _hasDesign_.

10. **Legal Verifier**: This AEC3PO module defines state and private verifiers. 
    - Classes: _LegalVerifier_, _PrivateVerifier_, _StateVerifier_.
    - Properties: _hasDesign_. 

11. **Model**: A model representing part or the entirety of a site, building, or piece of infrastructure. Typically these will be Building Information Models.
    - Classes: _Model_, _Phase_, _Element_, _Classification_, _etc_.
    - Properties: _name_, _description_, _location_, _locationCoverage_, _material_, _hasBuildingPhase_, _hasDimensions_, _hasElementPhase_, _hasClassification_, _etc._

12. **Table**:A table as representations of data in rows and columns. Tables are described by captions.
    - Classes: _Container_, _Table_, _Column_, _Row_, _Cell_.
    - Properties: _contains_, _isContainedIn_, _caption_.
 

### AEC3PO Alignments and Reuse <a name="alignments"></a>
AEC3PO contains five modules, which import an external ontology and specify alignment axioms to connect the terms. 
The figure below illustrates the alignment of AEC3PO with the imported ontologies.
AEC3PO is positioned in the centre, with the imported ontologies represented as separate nodes.


![AEC3PO Overview](diagrams/aec3po-Alignment2.png)


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

