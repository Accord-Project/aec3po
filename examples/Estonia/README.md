# Estonia Demo Case

In this example, we have instantiated the AEC3PO ontology with Estonia demo case 1. The demo is related to fire safety that needs to be checked against the _Fire safety requirements for the building_ regulations, which is an Estonian legistlation issued on 01-03-2021. Two statements from these regulations have been selected with respect to the checks needed for this use case. These two statements represent two rules related to the **operational map of the building**. These two statements are respectively presented in _section52, clauses 5 and 7_, and the respective clauses are shown below in both original Estonian version and the English translation version. 

### Statement 1 (Clause 52.5)
* Original - Estonian: _" Operatiivkaart koostatakse:
  1) enesekontrolli tuleohutusaruande esitamise kohustusega ehitise kohta;
  2) kümne- ja enamakorruselise hoone kohta;
  3) kultuuriväärtusliku hoone kohta;
  4) hoone kohta, milles hoitakse mälestisi. "_
     
* Translation - English: _"The operative card is drawn up:
  1) for the building with the obligation to submit a self-inspection fire safety report;
  2) for buildings with ten or more floors;
  3) about a building of cultural value;
  4) about the building in which monuments are kept."_

### Statement 2 (Clause 63.3)
* Original - Spanish: _" Tots els voladissos hauran d'estar separats 1 metres com a mínim, de la línia de la mitgera. "_
* Translation - English: _" All cantilever must be separated by at least 1 meter from the line of the partywall. "_ 

The example is presented in the file _“Spanish_Example.ttl”_. Here's a breakdown of some of the RDF triples:
*	The **_ex:POUM_Doc_** individual is defined as a an instance of the class **_aec3po:Document_**. It has a coverage related to the administrative area **_aec3po:Spain_**. 
* The **_ex:statement_54_** and **_ex:statement_63_** are defined as instances of the class **_aec3po:Statement_**, with respect to the clause number in the POUM document. They are defined by their text captured with the property _asText_ and linked to the document subdivision with the property _hasPart_. 
*	The **_ex:cantilever_checklist_** individual is defined as a subclass of **_aec3po:Statement_** and has as subclasses **_ex:cantiliver_numericalCheckStatement_streetBaseOffset_**, **_ex:cantiliver_numericalCheckStatement_otherBaseOffset_**, and **_ex:cantiliver_numericalCheckStatement_partywall_distance_** - the numerical check statements related to every property to be checked as described in the clauses, which are the base off set and the party-wall distance. 
* The **_ex:cantilever_** individual is defined as an instance of the class **_aec3po:FeatureOfInterest_**, which represents the IFC element to be checked. It has been defined by its properties defined as **_aec3po:Property_**, and linked to it with the property _aec3po:hasRequiredData_.


