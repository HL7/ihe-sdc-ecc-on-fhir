IHE Structured Data Capture (SDC) on FHIR uses a form driven workflow to capture and encode data by creating FHIR Observations or other relevant resources from the captured data. This guide will focus on 2 types of data extraction: Observation-based and Definition-based. These concepts are borrowed from, and aligned with the [HL7 FHIR SDC Implementation Guide: Form Data Extraction](https://hl7.org/fhir/uv/sdc/extraction.html) guidance.

### Observation-Based Extraction

Observations can be used to capture Question and Answer Sets from SDC. Each Observation should capture the Question ID from SDC in the code element, and the answer in the value element. There are several question types that are described below on best practices for capture. The following sections will describe how to generally map some common data elements from IHE SDC to FHIR Observations, then will describe special considerations for specific data types.

Questions in IHE SDC are the element which are displayed to the user for them to fill in. There are a variety of question types including ListItems, Booleans, Strings, integers, decimals, etc. This page will detail how to map all of those question types to FHIR Observations.

Since IHE SDC is XML only the different elements and attributes will be identified from that specification below. Elements will be identified as starting with a capital letter (e.g. `Question`), while attributes will begin with an @ (e.g. `@title`). Attributes belong to one or more elements, so if a specific attribute must be used its parent element will be called out. IHE SDC elements and attributes will be described in [XPath](https://www.w3.org/TR/1999/REC-xpath-19991116/), such as `Element/Element/@attribute`. W3C offers a [XPath Tutorial](https://www.w3schools.com/xml/xpath_intro.asp). FHIR elements will be described in the standard FHIR Notation of `ResourceName.dataElement`. For example, we map the IHE SDC attribute `Question/@instanceGUID` to `Observation.identifier`.

The [IHE SDC/eCP on FHIR Observation](StructureDefinition-ihe-sdc-ecc-Observation.html) profile is designed to be used with all the following data types in the subsections below.

#### Observation Identification

<<<<<<< Updated upstream
The [IHE SDC/eCC on FHIR Observation](StructureDefinition-ihe-sdc-ecc-Observation.html) profile requires Observation.identifier to be used and supported. Observations should be identified using the IHE SDC `Question/@instanceGUID` to the `Observation.identifier`. The @instanceGUID will uniquely identify this Observation. Observations should refernece a patient, the practitioner, a date, and be attached to a DiagnosticReport to ensure provenance of the resource.
=======
The [IHE SDC/eCP on FHIR Observation](StructureDefinition-ihe-sdc-ecc-Observation.html) profile requires Observation.identifier to be used and supported. Observations should be identified using the IHE SDC `Question/@instanceGUID` to the `Observation.identifier`. The @instanceGUID will uniquely identify this Observation. Observations should reference a patient, the practitioner, a date, and be attached to a DiagnosticReport to ensure provenance of the resource.
>>>>>>> Stashed changes

Said DiagnosticReport should conform to the The [IHE SDC/eCP on FHIR DiagnosticReport](StructureDefinition-ihe-sdc-ecc-DiagnosticReport.html) profile.

#### Observation.code

For all Questions in IHE SDC the @ID and rptTxt or @title should be captured in the `Observation.code` element.

The text to include in the `Observation.code` should come from one of the following IHE SDC elements or attributes:

* The IHE SDC element of `Property/@propname="rptTxt"`
* The IHE SDC attribute of `@title`
<!--*  The IHE SDC attribute of `@altTxt`-->

`rptTxt` or `@title` may be found as part of an IHE SDC Question or ListItem. rptTxt will not be present on every IHE SDC Question or ListItem, but should always be used in place of @title if available.

The `Observation.code` element should be used to represent the `@ID` and `@title` of IHE SDC Question, regardless of question type.

For guidance on how to add standard terminology to these `Observation.code` elements, see the [Terminology](terminology.html) section of this IG.

##### Report Text (rptTxt) Property

XPath: `Question/Property/@propName="reportText"/@val`

For Single and Multi-select questions the implementer must use the report text (rptText) attribute instead of the title attribute which is the default. rptText should be mapped for FHIR Observation.ValueCodeableConcept.

##### Title (@title)

XPath: `Question/@title`

If Report Text has is not present then the report `@title` of the answer shall be used as the ValueCodeableConcept.

<!--##### Alt Text (altText)

XPath: `Question/Property/@propName="altText"/@val`

altText should only be used if the report text property and `@title` attribute are not present.--> 

#### Parent and Child Observations

As Observations represent the Question and Answer pairs from IHE SDC, they may have parent or child questions, which must also be presented in Observations. To preserve the hierachy of Question and Answer pairs the `Observation.derivedFrom` element should be used to capture the `Observation.identifier` of the parent question and `Observation.hasMember` should be used to capture the `Observation.identifier` of the child question. The Observation specification provides guidance on how to use [Observation.hasMember and Observation.derivedFrom](https://www.hl7.org/fhir/observation.html#gr-other). A parent question may have multiple children within its `Observation.hasMember` field. 

<!--Will there ever be a child with multiple parents? Should be impossible-->

An [SDC eCP Observation Parent Example](Observation-SDCeCCObservationParent.html) and [SDC eCP Observation Child Example](Observation-SDCeCCObservationChild.html) showing how these Observations can be grouped together can be found in the [Artifacts](artifacts.html) page.

#### Sections

[Observations groupers](https://www.hl7.org/fhir/observation.html#obsgrouping) should be used to represent sections as a parent Observation. When representing a section in an Observation the implementer is expected to leave the `Observation.value[x]` element blank. The `Observation.code` element should represent the Section's `@ID` and `@title` in IHE SDC.

All sub-questions of the Section should be captured within the `Observation.hasMember` element.

[SDC eCP Observation Section Example](Observation-SDCeCCObservationSection.html)

#### ListItems

IHE SDC has two kinds of List items:

* Single-Select
* Multi-Select

For both of these List item types the IHE SDC `Question` should map to the `Observation.code`, as noted above, and the `ListItem` should map to the `Observation.valueCodeableConcept`.

Like Questions, all ListItem answers will have an @ID element which should be captured in the `Observation.valueCodeableConcept` element along with the rptTxt property or @title attribute.

The same guidance in the [Terminology](terminology.html) section of this IG for `Observation.code` applies to `Observation.valueCodeableConcept`.

##### Single-Select

Single Select questions in IHE SDC should be captured as `Observation.valueCodeableConcept` with the IHE SDC `ListItem @ID` for as the coding, and the `ListItem` @altText, @rptTxt, or @title as text.

##### Multi-Select

Similar to Single Select Questions in SDC should be captured as `Observation.valueCodeableConcept` with the SDC ID as the coding as separate Observations. Therefore each answer should be uniquely represented in a separate Observation and could be linked together by referencing the same DocumentReference in the `Observation.derivedFrom` element or in a FHIR DiagnosticReport.

#### List Item Responses (LIR)

There are a number of questions in IHE SDC which have sub-question types directly attached in the parent. These are known as `ListItemResponses`. For example a single select list may have a question like "Tumor Size" with answer options of:

* Greatest dimension in cm
* Cannot be determined (explain)

For "Greatest dimension in cm" there may be a numerical fill in box attached the question, and likewise for the "Cannot be determined (explain)" there may be a string List Item Response box attached. These are handled as special elements from other questions in the IHE SDC specification known as `ListItemResponseFields` and require the Observation to the component element to capture the additional filled information. See example: [SDCeCPObservationCodeLIR](Observation-SDCeCCObservationCodeLIR.html)

#### Text Answers

Observations for text based questions should be captured as `Observation.valueString` for simplicity.

#### DisplayItems

DisplayItems are text which are shown to the user filling out the form. These elements do not need to be represented within FHIR.

#### Untitled Questions

There are some questions which may not have an `@title` attribute or a rptText element present in their question element. These untitled questions are typically sub-questions to be answered in specific contexts. If an untitled question is present then the untitled question `@ID` should be included as the `Observation.code` element, with a blank display value.

<!--
Removed the following old text because using the parent question or alt text could be dangerous

Old text:
If an untitled question is present then the parent element in the IHE SDC form should be taken as the `Observation.code` in the Observation. Doing so will prevent any blank display values on the `Observation.code` element. 
-->

#### Other Data Types

Other data types should be captured in `Observation.value[x]` as their closest IHE SDC for match, whether that be DateTime, Boolean, Integer, etc.

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

Note: Structure Map is still being explored by the IG authors for these kinds of use cases.

### Historical Data

It is possible that the patterns detailed in this guide could be used to extract data from historically collected IHE SDC froms. If the question types and IHE SDC IDs were maintained it could be feasible to write that data into FHIR messages following profiles outlined in this guide.

<!-- #### Data Storage Considerations
Mapping can be accomplished in order to promote robust data models that allow for advanced data analytics and shareable data models. There are a number of intersections for SDC and data models such as OHDSI. For example SDC and OHDSI both have a heavy reliance on identifiers. -->