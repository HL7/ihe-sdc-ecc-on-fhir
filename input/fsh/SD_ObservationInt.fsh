Profile: ObservationSDCeCCint
Parent: Observation
Id: ihe-sdc-ecc-Observation-integer
Title: "IHE SDC/eCC on FHIR Observation"
Description: "A Observation Profile meant to capture integer Question and Answer Sets from an IHE SDC Form. Any answer that has an integer datatype in IHE SDC should be represented using this profile which requires the Observation.valueInteger"
* identifier 1..* MS 
* bodySite MS 
* hasMember MS 
* derivedFrom MS 
* component MS 
* valueInteger 1..1 MS
* component MS 