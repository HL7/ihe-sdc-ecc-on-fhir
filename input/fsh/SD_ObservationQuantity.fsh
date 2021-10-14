Profile: ObservationSDCeCCquantity
Parent: Observation
Id: ihe-sdc-ecc-Observation-quantity
Title: "IHE SDC/eCC on FHIR Observation"
Description: "A Observation Profile meant to capture quantity Question and Answer Sets from an IHE SDC Form. Any answer that has a quantity datatype in IHE SDC, or any datatype requiring a UCUM unit should be represented using this profile which requires the Observation.valueQuantity"
* identifier 1..* MS 
* bodySite MS 
* hasMember MS 
* derivedFrom MS 
* component MS 
* valueQuantity 1..1 MS
* component MS 