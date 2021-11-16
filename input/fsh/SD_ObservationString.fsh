Profile: ObservationSDCeCCstring
Parent: Observation
Id: ihe-sdc-ecc-Observation-string
Title: "IHE SDC/eCC on FHIR Observation Text"
Description: "A Observation Profile meant to capture text Question and Answer Sets from an IHE SDC Form. Any answer that has a string datatype in IHE SDC should be represented using this profile which requires the Observation.valueString"
* identifier 1..* MS 
* identifier ^definition = "The identifier should match the SDC answer instance-GUID"
* code ^definition = "The code should match the question ID from the SDC form. In a given Observation group, there might be repeating codes for multiselect questions"
* hasMember MS 
* hasMember ^definition = "hasMember should be used to capture any child questions in related Observations"
* derivedFrom MS 
* derivedFrom ^definition = "derivedFrom should be used to define a parent Observation or the parent DocumentReference"
* valueString 1..1 MS