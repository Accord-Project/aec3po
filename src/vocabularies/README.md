# Vocabularies folder

This folder contains SKOS concept schemes that may be used with the AEC3PO ontology.

## Structure

Each file in this folder is organised as follows:

- prefix declaration
- ontology declaration
- declaration of a subclass `X` of `skos:Concept`
- declaration of a subclass `XTable` of `skos:ConceptScheme`
- optional declaration of object properties `forX` and `hasX` that link to/from instances of individual concepts
- instances of `X`

Every file in this folder must satisfy the shape `_shape.ttl` (to be defined).