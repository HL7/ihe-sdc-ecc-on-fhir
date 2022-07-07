<!--## Data Extraction-->

IHE Structured Data Capture (SDC) on FHIR uses a form driven workflow to capture and encode data by creating FHIR Observations or other relevant resources from the captured data. This guide will focus on 2 types of data extraction: Observation-based and Definition-based. These concepts are borrowed from, and aligned with the [HL7 FHIR SDC Implementation Guide: Form Data Extraction](https://hl7.org/fhir/uv/sdc/extraction.html) guidance.

### Observation-Based Extraction

Observations can be used to capture Question and Answer Sets from SDC. Each Observation should capture the Question ID from SDC in the code element, and the answer in the value element. There are several question types that are described below on best practices for capture. The following sections will describe how to generally map some common data elements from IHE SDC to FHIR Observations, then will describe special considerations for by specific data type.

Since IHE SDC is XML only the different elements and attributes will be identified from that specification below. Elements will be identified as starting with a capital letter, while attributes will begin with an @ (e.g. @title). Attributes belong to one or more elements, so if a specific attribute must be used it's parent element will be called out. IHE SDC elements and attributes will be described in [XPath](https://www.w3.org/TR/1999/REC-xpath-19991116/), such as `Element/Element/@attribute`. FHIR elements will be described in the standard FHIR Notation of `ResourceName.dataElement`. For example we map the IHE SDC attribute `Question/@instanceGUID` to `Observation.identifier`.

The [IHE SDC/eCC on FHIR Observation](StructureDefinition-ihe-sdc-ecc-Observation.html) profile is designed to be used with all the following data types in the subsections below.

#### Observation Identification

Observations should be identified using the IHE SDC `Question/@instanceGUID` to the `Observation.identifier`. The @instanceGUID will uniquely identify this Observation. Observations should refernece a patient, the practitioner, a date, and be attached to a DiagnosticReport to ensure provenance of the resource.

Said DiagnosticReport should conform to the The [IHE SDC/eCC on FHIR DiagnosticReport](StructureDefinition-ihe-sdc-ecc-DiagnosticReport.html) profile.

#### Parent and Child Observations

As Observations represent the Question and Answer pairs from IHE SDC, they may have parent or child questions, which must also be presented as Observations. To preserve the hierachy of Question and Answer pairs the `Observation.Parent` element should be used to capture the `Observation.identifier` of the parent question and `Observation.hasMember` should be used to capture the `Observation.identifier` of the child question. The Observation specification provides guidance on how to handle [Observation.hasMember of and Observation.derivedFrom](https://www.hl7.org/fhir/observation.html#gr-other).

An [SDC eCC Observation Parent Example](Observation-SDCeCCObservationParent.html) and [SDC eCC Observation Child Example](Observation-SDCeCCObservationChild.html) showing how these Observations can be grouped together can found in the [Artifacts](artifacts.html) page.

#### Sections

[Observations groupers](https://www.hl7.org/fhir/observation.html#obsgrouping) should be used to represent sections.

[SDC eCC Observation Section Example](Observation-SDCeCCObservationSection.html)

#### ListItems

SDC has two kinds of List items:

* Single-Select
* Multi-Select

For both of these List item types the IHE SDC `Question` should map to the `Observation.code` and the `ListItem` should map to the `Observation.valueCodeableConcept`.

The text to include in each of these Observation elements should come from one of three IHE SDC elements or attributes:

* The IHE SDC sub-element of `Property/@propname="rptTxt"`
* The IHE SDC attribute of `@title`
<!--*  The IHE SDC attribute of `@altTxt`-->

rptTxt or @title may be found as part of an IHE SDC Question or ListItem. rptTxt will not be present on every IHE SDC Question or ListItem, but should always be used in place of @title if available.

##### Report Text (rptTxt) Property

XPath: `Question/Property/@propName="reportText"/@val`

For Single and Multi-select questions the implementer must use the report text (rptText) attribute instead of the title attribute which is the default. rptText should be mapped for FHIR Observation.ValueCodeableConcept.

##### Title (@title)

XPath: `Question/@title`

If Report Text has the following value: val="{no text}" then the report title of the answer shall be used as the ValueCodeableConcept.

The XPath for No text will be: Question/Property/@propName="reportText"/@val="{no text}"
<!--
##### Alt Text (altText)

XPath: `Question/@altText`

altText should only be used if the report text property and title attribute are not present. altText should be mapped for FHIR Observation.ValueCodeableConcept.
--> 
#### Single-Select

Single Select questions in IHE SDC should be captured as `Observation.valueCodeableConcept` with the IHE SDC `ListItem @ID` for as the coding, and the `ListItem` @altText, @rptTxt, or @title as text.

#### Multi-Select

Similar to Single Select questions in SDC should be captured as `Observation.valueCodeableConcept` with the SDC ID for as the coding as separate Observations. Therefore each answer should be uniquely represented in a separate Observation and could be linked together by referencing the same DocumentReference in the `Observation.derivedFrom` element or in a FHIR DiagnosticReport.

#### Text Answers

Observations for text based questions should be captured as `Observation.valueString` for simplicity.

#### List Item Responses (LIR)

There are a number of questions in IHE SDC which have sub-question types directly attached in the parent. These are known as List Item Responses. For example a single select list may have a question like "Tumor Size" with answer options of:

* Greatest dimension in cm
* Cannot be determined (explain)

For "Greatest dimension in cm" there may be a numerical fill in box attached the question, and likewise for the "Cannot be determined (explain)" there may be a string List Item Response box attached. These are handled as special elements from other questions in the IHE SDC specification known as "\<ListItemResponseFields\>" and require the Observation to the component element to capture the additional filled information. See example: [SDCeCCObservationCodeLIR](Observation-SDCeCCObservationCodeLIR.html)

#### Displayed Items

#### Untitled Questions

#### Other Data Types

Other data types should be captured in `Observation.value[x]` as their closest IHE SDC for match, whether that be DateTime, Boolean, Integer, etc. There is a profile in this iGuide for each of these data types.  

| IHE SDC DataType            | FHIR `Observation.value[x]` type |
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