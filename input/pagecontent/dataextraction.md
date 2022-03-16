<!--## Data Extraction--> 
IHE Structured Data Capture (SDC) on FHIR uses a form driven workflow to capture and encode data by creating FHIR Observations or other relevant resources from the captured data. This guide will focus on 2 types of data extraction: Observation-based and Definition-based. These concepts are borrowed from, and aligned with the [HL7 FHIR SDC Implementation Guide: Form Data Extraction](https://hl7.org/fhir/uv/sdc/extraction.html) guidance. 

### Observation-Based Extraction 
Observations can be used to capture Question and Answer Sets from SDC. Each Observation should capture the Question ID from SDC in the code element, and the answer in the value element. There are several question types that are described below on best practices for capture. The [IHE SDC/eCC on FHIR Observation](StructureDefinition-ihe-sdc-ecc-Observation.html) profile is designed to be used with all the following data types in the subsections below.

#### Single-Select
Single Select questions in SDC should be captured as valueCodeableConcept with the SDC ID for as the coding, and the question title as text. 

#### Multi-Select
Similar to Single Select questions in SDC should be captured as valueCodeableConcept with the SDC ID for as the coding as separate Observations. Therefore each answer should be uniquely represented in a separate Observation and could be linked together by referencing the same DocumentReference in the Observation.derivedFrom element or in a FHIR DiagnosticReport. 

#### Text Answers
Observations for text based questions should be captured as valueString for simplicity. 

#### List Item Responses (LIR)
There are a number of questions in IHE SDC which have sub-question types directly attached in the parent. These are known as List Item Responses. For example a single select list may have a question like "Tumor Size" with answer options of: 
* Greatest dimension in cm
* Cannot be determined (explain)

For "Greatest dimension in cm" there may be a numerical fill in box attached the question, and likewise for the "Cannot be determined (explain)" there may be a string List Item Response box attached. These are handled as special elements from other questions in the IHE SDC specification known as "\<ListItemResponseFields\>" and require the Observation to the component element to capture the additional filled information. See example: [SDCeCCObservationCodeLIR](Observation-SDCeCCObservationCodeLIR.html)

#### Sections
Sections should be captured in Observations and used as groupers 

#### Other Data Types
Other data types should be captured in value[x] as their closest IHE SDC for match, whether that be DateTime, Boolean, Integer, etc. There is a profile in this iGuide for each of these data types.  

| IHE SDC DataType            | FHIR Observation.value type |
| --------------------------- | --------------------------- |
| boolean                     | valueBoolean                |
| date                        | valueDateTime               |
| dateTime                    | valueDateTime               |
| decimal                     | valueQuantity               |
| integer                     | valueInteger                |
| string                      | valueString                 |
| time                        | valueTime                   |

<!--
## Definition-Based Extraction
Definition-based extraction may be used to to write to specific FHIR Resources rather than a
--> 

### Structure Map 
The Structure Map may be used to cover complex types of questions which have unique needs in terms of mapping to FHIR resources. For example if a group of questions needs to be represented in a single Observation a Structure Map could specify how to add those answers to Observation.component elements. This would enable more complex and accurate mapping to FHIR resources. 

Additionally Structure Map could be used to write to different FHIR resources other than Observation, where a resource such as Condition or Procedure may be more appropriate. 

Note: Structure Map is still be explored by the IG authors for these kinds of use cases. 

### Historical Data 
It is possible that the patterns detailed in this guide could be used to extract data from historically collected IHE SDC froms. If the question types and IHE SDC IDs were maintained it could be feasible to write that data into FHIR messages following profiles outlined in this guide. 

<!-- #### Data Storage Considerations
Mapping can be accomplished in order to promote robust data models that allow for advanced data analytics and shareable data models. There are a number of intersections for SDC and data models such as OHDSI. For example SDC and OHDSI both have a heavy reliance on identifiers. --> 