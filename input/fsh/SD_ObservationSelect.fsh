Profile: ObservationSDCeCCdselect
Parent: Observation
Id: ihe-sdc-ecc-Observation-select
Title: "IHE SDC/eCC on FHIR Observation Single Select"
Description: "This Observation Profile is mean to capture single select Question-Answer Pairs as a valueCodeableConcept. If the question is Multiselect multiple Observations with the same Question Code may be created"
* identifier 1..* MS 
* identifier ^definition = "The identifier should match the SDC answer instance-GUID"
* code ^definition = "The code should match the question ID from the SDC form. In a given Observation group, there might be repeating codes for multiselect questions"
* hasMember MS 
* hasMember ^definition = "hasMember should be used to capture any child questions in related Observations"
* derivedFrom MS 
* derivedFrom ^definition = "derivedFrom should be used to define a parent Observation or the parent DocumentReference"
* valueCodeableConcept 1..1 MS 
* valueCodeableConcept ^definition = "The valueCodeableConcept should match the question ID from the SDC form. Unique Observations should be created for each multi-select answer"