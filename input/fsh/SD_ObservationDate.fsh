Profile: ObservationSDCeCCdate
Parent: Observation
Id: ihe-sdc-ecc-Observation-date
Title: "IHE SDC/eCC on FHIR Observation Date"
Description: "A Observation Profile meant to capture date Question and Answer Sets from an IHE SDC Form. Any answer that has a date datatype in IHE SDC should be represented using this profile which requires the Observation.valueDateTime"
* identifier 1..* MS 
* bodySite MS 
* hasMember MS 
* derivedFrom MS 
* component MS 
* valueDateTime 1..1 MS
* component MS 