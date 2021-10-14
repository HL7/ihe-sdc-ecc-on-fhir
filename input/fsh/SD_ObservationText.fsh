Profile: ObservationSDCeCCtext
Parent: Observation
Id: ihe-sdc-ecc-Observation-text
Title: "IHE SDC/eCC on FHIR Observation Text"
Description: "A Observation Profile meant to capture text Question and Answer Sets from an IHE SDC Form. Any answer that has a string datatype in IHE SDC should be represented using this profile which requires the Observation.valueString"
* identifier 1..* MS 
* bodySite MS 
* hasMember MS 
* derivedFrom MS 
* component MS 
* valueString 1..1 MS
* component MS 