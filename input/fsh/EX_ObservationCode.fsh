Instance: SDCeCCObservationCode
InstanceOf: ObservationSDCeCC
Description: "Example Observation using codes from SDC"
Usage: #example 
* id = "SDCeCCObservationCode"
* identifier.use = #usual 
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier.system = "http://example.org/Observation"
* identifier.value = "SDCeCCObservationCodeEx0"
* status = #final "final"
* code = CAP#56271 "Tumor invades into other adjacent organ(s)"
* subject = Reference(http://example.org/patient)
* subject.display = "Example Patient"
* effectiveDateTime = "2021-05-11"
* performer = Reference(http://example.org/practitioner)
* performer.display = "Example Practitioner"
* valueCodeableConcept = CAP#56752 "Kidney"