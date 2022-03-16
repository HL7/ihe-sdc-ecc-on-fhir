Instance: SDCeCCObservationCodeLIR
InstanceOf: ObservationSDCeCC
Title: "SDC eCC Observation List Item Response Example"
Description: "Example Observation using codes with an additional response from SDC, which asked the user to specify the Greatest Dimension in cm."
Usage: #example 
* id = "SDCeCCObservationCodeLIR"
* identifier.use = #usual 
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier.system = "http://example.org/Observation"
* identifier.value = "SDCeCCObservationCodeEx0"
* status = #final "final"
* code = CAP#2129 "Tumor size (Note A)"
* subject = Reference(http://example.org/patient)
* subject.display = "Example Patient"
* effectiveDateTime = "2021-05-11"
* performer = Reference(http://example.org/practitioner)
* performer.display = "Example Practitioner"
* valueCodeableConcept = CAP#2123 "Greatest Dimension in cm"
* component.code = CAP#2123 "Greatest Dimension in cm"
* component.valueQuantity.value = 2
* component.valueQuantity.unit = UCUM#cm