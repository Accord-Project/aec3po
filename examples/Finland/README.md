# Finland Demo Case
This folder contains two examples of AEC3PO ontology instantiation from the Finnish demo cases. The first example is _FI1 - Finnish Accessibility_ and the second example is _FI3 - CO2 Emission_. The two examples are described as follows:

## FI1 - Finnish Accessibility (Ramp)

This example is provided in the file _"FI-accessibility-AEC3PO.ttl"_. This file provides an example of instantiating the aec3po ontology using Turtle syntax with the Finnish demo case. This example represents the ramp check. The rules are defined in _Section 2/Subsection 2_ from the English tranlation of the Finnish Accessibility document, taken from the Land Use and Building Act (132/1999), as amended by Act 958/2012. The statements of the rules are defined below in their English translation.

_"The ramp referred to in subsection 1 above shall be easily noticeable and straight with a smooth, hard and non-slippery surface, width of at least 900 millimetres and, if the ramp is not connected to a fixed structure, a protective edge of at least 50 millimetres in height. There shall be a horizontal landing with a length of at least 1,500 millimetres at the lower and upper end of the ramp. The gradient of the ramp may not exceed five per cent. However, if the elevation difference is no more than 1,000 millimetres, the ramp may not have a gradient of more than eight per cent. In that case, the elevation difference of a continuous ramp may not be more than 500 millimetres, after which there shall be a horizontal intermediate landing with a length of at least 2,000 millimetres. However, in an outdoor area the ramp may have a gradient of more than five per cent only if it can be kept in a condition comparable with that of an indoor ramp. Provisions on railings, handrails and other arrangements intended to prevent falling down and misstepping are laid down by decree issued under section 117d, subsection 2 of the Land Use and Building Act."_

The two figures below represent a part from AEC3PO instantiation that corresponds to the Document (**_aec3po:Document_**) instantiation and the Statement classficiation (**_aec3po:Statement_**), respectively.
![Images](FI1-Doc.png) 
![Images](FI1-StatementsClassification.png) 

## FI3 - CO2 Emission

This example is provided in the file _"FI3-CO2_Emission-AEC3PO.ttl"_. This file provides an example of instantiating the aec3po ontology using Turtle syntax with the Finnish demo case. This example represents the Carbon footprint emission check. The rules are defined in the English translation of the _**Decree of the Ministry of the Environment**_ on the climate assessment of buildings (_Draft 30.9.2022, consultation round_). The statements of the rules are defined in the document presented in [this link](https://vttgroup.sharepoint.com/:w:/r/sites/EU-projectpreparationDigitalpermitsandcompliancecheck/_layouts/15/Doc.aspx?sourcedoc=%7BB135D7E5-FBF8-4AA2-A12D-7F5856EE7A38%7D&file=Use%20Case%20FI3%20extract%20from%20the%20regulations.docx&action=default&mobileredirect=true&cid=495d26c0-9bbb-4fa1-a732-648047ecf92b).

The two figures below represent a part from AEC3PO instantiation that corresponds respectively to:
* two examples of the Property class **_aec3po:Property_** of the _Feature of Interest_ **_building_** (**_ifcOWL:IFCBuilding_**) ;
* the check methods **_aec3po:CheckMethod_** classficiation linked to the properties designs **_aec3po:PropertyDesign_** with the property **_aec3po:forDesign_** .

![Images](FI3-Property.png) 
![Images](FI3-forDesign.png)   
