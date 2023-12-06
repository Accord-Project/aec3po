# Units of measurement
**Description:** A unit of measurement is a definite magnitude of a quantity, defined and adopted by convention or by law, that is used as a standard for measurement of the same kind of quantity. Any other quantity of that kind can be expressed as a multiple of the unit of measurement.

## International System of Units (SI)
* Internationally known by the abbreviation **SI** (from French Système International), is the modern form of the metric system and the world's most widely used system of measurement.
* The **SI** comprises a coherent system of units of measurement starting with **7** base units, which are the second (symbol s, the unit of time), metre (m, length), kilogram (kg, mass), ampere (A, electric current), kelvin (K, thermodynamic temperature), mole (mol, amount of substance), and candela (cd, luminous intensity). The system can accommodate coherent units for an unlimited number of additional quantities.
These are called coherent derived units, which can always be represented as products of powers of the base units.
**22** coherent derived units have been provided with special names and symbols.
* The **7** base units and the **22** coherent derived units with special names and symbols may be used in combination to express other coherent derived units.
Since the sizes of coherent units will be convenient for only some applications and not for others, the **SI** provides twenty-four prefixes which, when added to the name and symbol of a coherent unit produce twenty-four additional (non-coherent) **SI** units for the same quantity; these non-coherent units are always decimal (i.e. power-of-ten) multiples and sub-multiples of the coherent unit.
The **SI** is intended to be an evolving system; units and prefixes are created and unit definitions are modified through international agreement as the technology of measurement progresses and the precision of measurements improves.


## Definition in AEC3PO
Currently, AEC3PO does not provide any indication on how to define the units of measurements in the instances.\
\
The **value** of a measure is defined through the property **aec3po:hasValue**.\
For example: 
```
ex:design_partywall_distance      aec3po:hasValue      1 .
```
\
But the **units** of measurement are not defined. It can be provided, for example, through the property **qudt:hasUnit**.\
For example: 
```
ex:design_partywall_distance      qudt:hasUnit      unit:M .
```
\
Excerpt from an example of instance that includes the two previous triples:
```
ex:design_partywall_distance      a                  aec3po:PropertyDesign ;
                                  aec3po:hasValue    1 ;
                                  qudt:hasUnit       unit:M .
```

    
## Vocabularies and ontologies
* **UCUM:** Unified Code for Units of Measure (UCUM) is a code system intended to include all units of measures being contemporarily used in international science, engineering, and business.
https://ucum.org/

## Pros and Cons
_To be completed!_

## Libraries
* **Java:**
* **Python:**

## Open issues
* Considering that the IFC is a reference BIM standard, the units of measurement can be complemented by adding the corresponding name of the unit specified in the IFC standard.
  + https://ifc43-docs.standards.buildingsmart.org/IFC/RELEASE/IFC4x3/HTML/ifcmeasureresource/content.html
  + https://standards.buildingsmart.org/IFC/RELEASE/IFC4/ADD1/HTML/schema/ifcmeasureresource/content.htm
  + https://standards.buildingsmart.org/IFC/DEV/IFC4_2/FINAL/HTML/schema/ifcmeasureresource/lexical/ifcconversionbasedunit.htm
