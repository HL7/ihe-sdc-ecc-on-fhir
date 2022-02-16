Profile: ObservationSDCeCCdsection
Parent: Observation
Id: ihe-sdc-ecc-Observation-section
Title: "IHE SDC/eCC on FHIR Observation Section"
Description: "This Observation Profile is meant to describe how to capture a section element from IHE SDC as an Observation Grouper for children Observations."
* identifier 1..* MS 
* identifier ^short = "the SDC Section instanceGUID"
* identifier ^definition = "The identifier should match the SDC section ID. A section should not be created as an Observation if it has no questions below it have been filled in"
// what should the identifier of the section be? InstanceGUID or CKey? 
* code ^definition = "The code should match the section ID from the SDC form. It is possible to have repeated sections"
//how to handle repeated sections 
* hasMember MS 
* hasMember ^definition = "hasMember should be used to capture any child questions/sections in related Observations"
* derivedFrom MS 
* derivedFrom ^definition = "derivedFrom should be used to define a parent Observation or the parent DocumentReference if applicable"