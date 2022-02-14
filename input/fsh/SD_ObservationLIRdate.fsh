Profile: ObservationSDCeCCLIRdate
Parent: Observation
Id: ihe-sdc-ecc-Observation-LIRdate
Title: "IHE SDC/eCC on FHIR Observation ListItemResponse Date"
Description: "This Observation Profile is mean to capture Single or Multiselect answers as a valueCodeableConcept with additional date fill in answers in an Observation.component.valueDate"
* identifier 1..* MS
* identifier ^short = "the SDC answer instanceGUID"
* identifier ^definition = "The identifier should match the SDC answer instance-GUID"
* code ^short = "SDC question ID"
* code ^definition = "The code should match the question ID from the SDC form"
* hasMember MS
* hasMember ^short = "child question/answer reference"
* hasMember ^definition = "hasMember should be used to capture any child questions in related Observations"
* derivedFrom MS
* derivedFROM ^short = "parent question/answer reference"
* derivedFrom ^definition = "derivedFrom should be used to define a parent Observation or the parent DocumentReference"
* valueCodeableConcept 1..1 MS
* valueCodeableConcept ^short = "the ID for multiselect answer"
* valueCodeableConcept ^definition = "The valueCodeableConcept should match the answer ID from the SDC form for a multi-select that has a date List Item Response. In this instance the question may be something like Date, requiring an answer in a date format"
* component.valueDateTime 1..1 MS
* component.valueDateTime ^short = "date text entry"
* component.valueDateTime ^definition = "Any additional list item response datetime fields which were filled in should be captured in the component as valueDate"