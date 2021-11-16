Profile: ObservationSDCeCCLIRdate
Parent: Observation
Id: ihe-sdc-ecc-Observation-LIRdate
Title: "IHE SDC/eCC on FHIR Observation ListItemResponse Date"
Description: "This Observation Profile is mean to capture Single or Multiselect answers as a valueCodeableConcept with additional date fill in answers in an Observation.component.valueDate"
* identifier 1..* MS 
* identifier ^definition = "The identifier should match the SDC answer instance-GUID"
* code ^definition = "The code should match the question ID from the SDC form"
* hasMember MS 
* hasMember ^definition = "hasMember should be used to capture any child questions in related Observations"
* derivedFrom MS 
* derivedFrom ^definition = "derivedFrom should be used to define a parent Observation or the parent DocumentReference"
* valueCodeableConcept 1..1 MS 
* valueCodeableConcept ^definition = "The valueCodeableConcept should match the question ID from the SDC form. In this instance the question may be something like Date"
* component.valueDateTime 1..1 MS
* component.valueDateTime ^definition = "Any additional list item response datetime fields which were filled in should be captured in the component as valueDate"