// Bundle Resource
Instance: us-pathology-reporting-bundle-example
InstanceOf: Bundle
Title: "US Pathology Reporting Document Bundle"
* id = "us-pathology-reporting-bundle-example"
* meta.versionId = "3"
* meta.lastUpdated = "2022-04-20T20:54:09.662+00:00"
* meta.source = "#Qgh6QethwyhsYzOZ"
* meta.profile[0] = "http://hl7.org/fhir/us/cancer-reporting/StructureDefinition/us-pathology-reporting-bundle"
* type = #document
* timestamp = "2022-04-20T20:54:09.662+00:00"

// Composition Resource
Instance: us-pathology-reporting-composition-example
InstanceOf: Composition
Title: "US Pathology Report Composition"
* id = "us-pathology-report-composition-example"
* status = #final
* type = http://loinc.org#60568-3 "Pathology Synoptic Report"
* subject = Reference(Patient/JoelAlexPatient)
* date = "2022-03-22T18:05:57.689+00:00"
* author[0] = Reference(Practitioner/pathologist-example)
* title = "Pathology Report"
* section[0].title = "Patient Information"
* section[0].entry[0] = Reference(Patient/JoelAlexPatient)
* section[1].title = "Encounter Details"
* section[1].entry[0] = Reference(Encounter/uspath-specimen-collection-example)
* section[2].title = "Diagnostic Report"
* section[2].entry[0] = Reference(DiagnosticReport/pathology-diagnostic-report)
* section[3].title = "Observations"
* section[3].entry[0] = Reference(Observation/observation-tumor-site)
* section[3].entry[1] = Reference(Observation/observation-procedure-adrenalectomy)
* section[3].entry[2] = Reference(Observation/observation-specimen-laterality)
* section[3].entry[3] = Reference(Observation/observation-histologic-type)
* section[3].entry[4] = Reference(Observation/observation-histologic-grade)
* section[3].entry[5] = Reference(Observation/observation-tumor-weight)

// Patient Resource
Instance: JoelAlexPatient
InstanceOf: Patient
Title: "Patient Resource for Alex Joel"
* id = "JoelAlexPatient"
* name[0].family = "Joel"
* name[0].given[0] = "Alex"
* gender = #male
* identifier[0].system = "urn:system"
* identifier[0].value = "JoelAlexPatient"

// Encounter Resource
Instance: uspath-specimen-collection-example
InstanceOf: Encounter
Title: "Pathology Specimen Collection Encounter"
* id = "uspath-specimen-collection-example"
* status = #finished
* class.system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* class.code = #IMP
* class.display = "Inpatient Encounter"
* type[0].coding[0].system = "http://snomed.info/sct"
* type[0].coding[0].code = #726007
* type[0].coding[0].display = "Pathology consultation"
* subject = Reference(Patient/JoelAlexPatient)
* participant[0].individual = Reference(Practitioner/oncologist-example)
* participant[1].individual = Reference(Practitioner/pathologist-example)

// DiagnosticReport Resource
Instance: pathology-diagnostic-report
InstanceOf: DiagnosticReport
Title: "Pathology Diagnostic Report"
* id = "pathology-diagnostic-report"
* status = #final
* code.coding[0].system = "http://loinc.org"
* code.coding[0].code = #60568-3
* code.coding[0].display = "Pathology Synoptic report"
* subject = Reference(Patient/JoelAlexPatient)
* encounter = Reference(Encounter/uspath-specimen-collection-example)
* effectiveDateTime = "2021-01-01T21:39:30.000Z"
* performer[0] = Reference(PractitionerRole/practitionerrole-uspath-pathologist-example)
* specimen[0] = Reference(Specimen/adrenal-example)
* result[0] = Reference(Observation/observation-tumor-site)
* result[1] = Reference(Observation/observation-procedure-adrenalectomy)
* result[2] = Reference(Observation/observation-specimen-laterality)
* result[3] = Reference(Observation/observation-histologic-type)
* result[4] = Reference(Observation/observation-histologic-grade)