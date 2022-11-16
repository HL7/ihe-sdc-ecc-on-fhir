SDC IDs (which are formatted as CAP decimal CompositeKey (CKey) in electronic Cancer Protocols) are mapped to standardized terminologies (e.g. SNOMED CT) using a ConceptMap Resource. Data extraction and mapping can then be aided through the use of these codes.

More commonly standardized and broadly used terminology systems such as SNOMED CT can make the data more usable for any systems that may not have familiarity with the existing code system in the forms.

Each mapping of a SDC IDs to a SNOMED code is mapped in a ConceptMap resource. The ConceptMap resource could be used to insert a SNOMED Code into a FHIR Observation for the applicable term. This methodology could greatly increase the semantic interoperability between different systems. This IG has an [Example ConceptMap of CAP SDC IDs to SNOMED](ConceptMap-conceptMapCAPex.html).

Standardized codes could be mapped to the Observation by either the Sender or the Receiver. There are pros and cons to both approaches.

Any use case where the receiver may not have the ConceptMap available, it will be more effective for the Sender to add the codes to the FHIR Observation prior to sending. Doing so, will ensure that systems such as EMRs, and Clinical Decision Support (CDS) systems will have codes they are more likely able to use.

In other use cases, such as the sender submitting the data to a receiving cancer registry it may make more sense for the receiver to use the ConceptMap to map the more commonly standardized terms upon receipt of the data. This approach may decrease message size and the processing burden by the sender.

<!-- add example from ConceptMap and expand the point above
Could put the code in the sent Observation or provide the ConceptMap for the receiver to use the code
If the receiver is provided the ConceptMap it might be easier since they'll be able to add the SNOMED Codes to their exisiting data model - do pros and cons
-->