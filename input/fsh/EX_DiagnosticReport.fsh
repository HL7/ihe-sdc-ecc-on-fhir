Alias: LNC = http://loinc.org
Instance: eCCDiagnosticReport
InstanceOf: DiagnosticReportSDCeCC
Title: "eCC Diagnostic Report"
Description: "Example eCC Diagnostic report"
Usage: #example
* id = "eCCDiagnosticReport0"
* identifier.use = #usual 
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier.system = "http://example.org/Observation"
* identifier.value = "eCCDiagnosticReport0"
* status = #final
* category = LNC#LP7839-6 "Pathology"
* code = LNC#60568-3 "Pathology Synoptic report"
* subject = Reference(http://example.org/patient)
* subject.display = "Example Patient"
* effectiveDateTime = "2021-05-11"
* performer = Reference(http://example.org/practitioner)
* performer.display = "Example Practitioner"
* result[0] = Reference(SDCeCCObservationChild)
* result[1] = Reference(SDCeCCObservationParent)
* result[2] = Reference(SDCeCCObservationCode)
* result[3] = Reference(SDCeCCObservationCodeLIR)
/*
old references from generated example 
* result[0] = Reference(Adrenal.Bx.Res.129_3.002.011.RC1_sdcFDF1.FormInstanceVersionURI.2157)
* result[1] = Reference(Adrenal.Bx.Res.129_3.002.011.RC1_sdcFDF.f96d3fea-62b3-47e9-8443-f199c2f946f0.ver1.49275.100004300)
* result[2] = Reference(Adrenal.Bx.Res.129_3.002.011.RC1_sdcFDF1.FormInstanceVersionURI.43324)
* result[3] = Reference(Adrenal.Bx.Res.129_3.002.011.RC1_sdcFDF1.FormInstanceVersionURI.56271)
*/
* presentedForm.url = "http://test.org/pathology/eCCDiagnosticReport0"