Instance: eCCDiagnosticReport
InstanceOf: DiagnosticReportSDCeCC
Title: "eCP Diagnostic Report"
Description: "Example eCP Diagnostic report"
Usage: #example
* id = "eCCDiagnosticReport0"
* identifier.use = #usual 
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier.system = "http://example.org/Observation"
* identifier.value = "eCCDiagnosticReport0"
* status = #final
* category = LNC#LP7839-6 "Pathology"
* code = LNC#60568-3 "Pathology Synoptic report"
//This comment https://jira.hl7.org/browse/FHIR-38321 suggests that the subject and performer below are incorrectly represented, but when I try to do just [system/patient] the Published fails. Should I remove these references?
* subject = Reference(http://example.org/patient)
* subject.display = "Example Patient"
* effectiveDateTime = "2021-05-11"
* performer = Reference(http://example.org/practitioner)
* performer.display = "Example Practitioner"
* result[0] = Reference(SDCeCCObservationChild)
* result[1] = Reference(SDCeCCObservationParent)
* result[2] = Reference(SDCeCCObservationCode)
* result[3] = Reference(SDCeCCObservationCodeLIR)
* result[4] = Reference(SDCeCCObservationSection)

* presentedForm.url = "http://test.org/pathology/eCCDiagnosticReport0"