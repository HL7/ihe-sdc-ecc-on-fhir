Instance: SDCeCCObservationCodeEx
InstanceOf: ObservationSDCeCCdselect
Description: "Example Observation using codes from SDC"

* identifier.use = #usual 
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier.system = "http://hospital.example.org"
* identifier.value = "SDCeCCObservationCodeEx0"
* status = #final "final"
* code = CAP#56271 "Tumor invades into other adjacent organ(s)"
* subject = Reference(bibata-amadou)
* effectiveDateTime = "2021-05-11"
* performer = Reference(pathpract1)
* valueCodeableConcept = CAP#56752 "Kidney"