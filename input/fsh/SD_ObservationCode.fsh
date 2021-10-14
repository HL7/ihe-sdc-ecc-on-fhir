Profile: ObservationSDCeCCcode
Parent: Observation
Id: ihe-sdc-ecc-Observation-code
Title: "IHE SDC/eCC on FHIR Observation Code"
Description: "A Observation Profile meant to capture Question and Answer Sets from an IHE SDC Form. Questions shold be added as a code and the answer should be added as an appropriate data type. If the answer is a single select it should be added as a valueCodeableConcept. If a Question is a Multiselect then component may be used to list multiple answers"
* identifier 1..* MS 
* bodySite MS 
* hasMember MS 
* derivedFrom MS 
* component MS 
* valueCodeableConcept 1..1 MS
* component MS 