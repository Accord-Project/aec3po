# Spain Demo Case

![Spain](image.png )
In this example, we have instantiated the AEC3PO ontology with the Spain demo case. The demo represents a cultural centre (as shown in the figure above) that needs to be checked against the regulations presented in the POUM document, which is the Municipal Urban Planning Plan Regulations document, definitively approved by the Barcelona Territorial Planning Commission on 13-07-2005. Two statements from the POUM document have been selected with respect to the checks needed for this building model, as shown in the figure. These two statements represent two rules related to the base Offset and the party-wall distance of the cantilever of this building. These two statements are respectively presented in Part 2/Chapter 1/Section 2 and Part 2/Chapter 2/Section 2 from the POUM document, and the respective clauses are shown below in both original Spanish version and the English translation version. 

### Statement 1 (Clause 54.8)
* Original - Spanish: " L’alçada lliure mínima dels voladissos sobre espais públics serà de 3,20 metres per a vials de 8,00 metres o menys de i de 3,50 metres en la resta de casos. "
* Translation - English: " The minimum free height of cantilevers over public spaces will be 3.20 metres for street with a width of 8.00 metres or less and 3.50 metres in all other cases."

### Statement 2 (Clause 63.3)
* Original - Spanish: " Tots els voladissos hauran d'estar separats 1 metres com a mínim, de la línia de la mitgera. "
* Translation - English: " All cantilever must be separated by at least 1 meter from the line of the partywall. " 

The example is presented in the file _“Spanish_Example.ttl”_. Here's a breakdown of some of the RDF triples:
*	The **ex:POUM_Doc** individual is defined as a an instance of the class **aec3po:Document**. It has a coverage related to the administrative area **aec3po:Spain**. 
* The **ex:statement_54** and **ex:statement_63** are defined as instances of the class **aec3po:Statement**, with respect to the clause number in the POUM document. They are defined by their text captured with the property _asText_ and linked to the document subdivision with the property _hasPart_. 
*	The **ex:cantilever_checklist** individual is defined as a subclass of **aec3po:Statement** and has as subclasses **ex:cantiliver_numericalCheckStatement_streetBaseOffset**, **ex:cantiliver_numericalCheckStatement_otherBaseOffset**, and **ex:cantiliver_numericalCheckStatement_partywall_distance** - the numerical check statements related to every property to be checked as described in the clauses, which are the base off set and the party-wall distance. 
* The **ex:cantilever** individual is defined as an instance of the class **aec3po:FeatureOfInterest**, which represents the IFC element to be checked. It has been defined by its properties defined as **aec3po:Property**, and linked to it with the property _aec3po:hasRequiredData_.

