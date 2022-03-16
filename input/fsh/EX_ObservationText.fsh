Instance: SDCeCCObservationStringEx
InstanceOf: ObservationSDCeCC
Title: "SDC eCC Observation Text Example"
Description: "Example Observation using text fill in from SDC"
Usage: #example 
* id = "SDCeCCObservationStringEx"
* identifier.use = #usual 
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier.system = "http://example.org/Observation"
* identifier.value = "SDCeCCObservationCodeEx0"
* status = #final "final"
* code = CAP#76595 "Comments"
* subject = Reference(http://example.org/patient)
* subject.display = "Example Patient"
* effectiveDateTime = "2021-05-11"
* performer = Reference(http://example.org/practitioner)
* performer.display = "Example Practitioner"
* valueString = "Some comment"