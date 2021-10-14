Instance: SDCeCCObservationTextEx
InstanceOf: ObservationSDCeCCtext
Description: "Example Observation using text fill in from SDC"

* identifier.use = #usual 
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier.system = "http://hospital.example.org"
* identifier.value = "SDCeCCObservationCodeEx0"
* status = #final "final"
* code = CAP#76595 "Comments"
* subject = Reference(bibata-amadou)
* effectiveDateTime = "2021-05-11"
* performer = Reference(pathpract1)
* valueString = "Some comment"