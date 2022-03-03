Instance: SDCeCCObservationCodeLIR
InstanceOf: ObservationSDCeCC
Description: "Example Observation using codes with an additional response from SDC"
Usage: #example 
* id = "SDCeCCObservationCodeLIR"
* identifier.use = #usual 
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier.system = "http://hospital.example.org"
* identifier.value = "SDCeCCObservationCodeEx0"
* status = #final "final"
* code = CAP#2129 "Tumor size (Note A)"
* subject = Reference(bibata-amadou)
* effectiveDateTime = "2021-05-11"
* performer = Reference(pathpract1)
* valueCodeableConcept = CAP#2123 "Greatest Dimension in cm"
* component.code = CAP#2123 "Greatest Dimension in cm"
* component.valueQuantity.value = 2
* component.valueQuantity.unit = UCUM#cm