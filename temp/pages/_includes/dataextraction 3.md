# Data Extraction
IHE Structured Data Capture (SDC) on FHIR uses a form driven workflow to capture and encode data by creating FHIR Observations or other relevant resources from the captured data. This guide will focus on 2 types of data extraction: Observation-based and Definition-based. These concepts are borrowed from the FHIR SDC. 

## Data Extraction

### Observation-Based Extraction 
Observations can be used to capture Question and Answer Sets from SDC. Each Observation should capture the Question ID from SDC in the code element, and the answer in the value element. There are several question types that are described below on best practices for capture.

#### Single-Select
Single Select questions in SDC should be captured as valueCodeableConcept with the SDC ID for as the coding, and the question title as text. 

#### Multi-Select
Similar to Single Select questions in SDC should be captured as valueCodeableConcept with the SDC ID for as the coding, and the question title as text, however the multiple answers should be stored in multiple Observation.component elements so that the context of the complete question and answer set can be maintained. 

#### Text Answers
Observations for text based questions should be captured as valueString for simplicity. 

#### Other Data Types
Other data types should be captured in value[x] as their closest IHE SDC for match, whether that be DateTime, Boolean, Integer, etc. 

## Definition-Based Extraction
TBD

## Data Storage Considerations
Mapping can be accomplished in order to promote robust data models that allow for advanced data analytics and shareable data models. There are a number of intersections for SDC and data models such as OHDSI. For example SDC and OHDSI both have a heavy reliance on identifiers. 