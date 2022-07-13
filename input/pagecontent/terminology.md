## Terminology

These codes and titles from the CKeys are mapped to standardized terminologies (e.g. SNOMED-CT) using a ConceptMap Resource. Data extraction and mapping can then be aided through the use of these codes.

Codes can make the data more usable for anyone using a more common system such as SNOMED-CT.

Each mapping of a CAP Ckey to a SNOMED code could be mapped in a ConceptMap resource. The ConceptMap resource could be used to insert a SNOMED Code into a FHIR Observation for the applicable term.

For example a form with a value.
<!-- add example from ConceptMap and expand the point above
Could put the code in the sent Observation or provide the ConceptMap for the receiver to use the code
If the receiver is provided the ConceptMap it might be easier since they'll be able to add the SNOMED Codes to their exisiting data model
-->