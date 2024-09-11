Alias: $m49.htm = http://unstats.un.org/unsd/methods/m49/m49.htm
Alias: $loinc = http://loinc.org
Alias: $composition-basedOn-order-or-requisition = http://hl7.org/fhir/uv/lab-report/StructureDefinition/composition-basedOn-order-or-requisition
Alias: $ServiceRequest-uv-lab = http://hl7.org/fhir/uv/lab-report/StructureDefinition/ServiceRequest-uv-lab
Alias: $information-recipient = http://hl7.org/fhir/uv/lab-report/StructureDefinition/information-recipient
Alias: $Practitioner-uv-lab = http://hl7.org/fhir/uv/lab-report/StructureDefinition/Practitioner-uv-lab
Alias: $Patient-uv-lab = http://hl7.org/fhir/uv/lab-report/StructureDefinition/Patient-uv-lab
Alias: $PractitionerRole-uv-lab = http://hl7.org/fhir/uv/lab-report/StructureDefinition/PractitionerRole-uv-lab
Alias: $composition-diagnosticReportReference = http://hl7.org/fhir/uv/lab-report/StructureDefinition/composition-diagnosticReportReference
Alias: $DiagnosticReport-uv-lab = http://hl7.org/fhir/uv/lab-report/StructureDefinition/DiagnosticReport-uv-lab
Alias: $CodeableConcept-uv-ips = http://hl7.org/fhir/uv/ips/StructureDefinition/CodeableConcept-uv-ips
Alias: $Patient-animal-uv-lab = http://hl7.org/fhir/uv/lab-report/StructureDefinition/Patient-animal-uv-lab
Alias: $Observation-resultslab-uv-lab = http://hl7.org/fhir/uv/lab-report/StructureDefinition/Observation-resultslab-uv-lab
Alias: $reportType-uv-lab = http://hl7.org/fhir/uv/lab-report/ValueSet/reportType-uv-lab
Alias: $studyType-uv-lab = http://hl7.org/fhir/uv/lab-report/ValueSet/studyType-uv-lab
Alias: $specialty-uv-lab = http://hl7.org/fhir/uv/lab-report/ValueSet/specialty-uv-lab

Profile: CompositionLabReportUv
Parent: Composition
Id: Composition-uv-lab
Title: "Composition: Laboratory Report"
Description: "Clinical document used to represent a Laboratory Report for the scope of the HL7 Uv Lab project."
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 2
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #oo
* ^url = "http://hl7.org/fhir/uv/lab-report/StructureDefinition/Composition-IHE-SDC"
* ^version = "1.0.0-ballot"
* ^status = #active
* ^publisher = "HL7 International / Orders and Observations"
* ^contact.name = "HL7 International / Orders and Observations"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/orders"
* ^jurisdiction = $m49.htm#001 "World"
* . ^short = "Laboratory Report composition"
* . ^definition = "Laboratory Report composition.\n\r\nA composition is a set of healthcare-related information that is assembled together into a single logical document that provides a single coherent statement of meaning, establishes its own context and that has clinical attestation with regard to who is making the statement. \r\nWhile a Composition defines the structure, it does not actually contain the content: rather the full content of a document is contained in a Bundle, of which the Composition is the first resource contained."
* text ^short = "Narrative text"
* extension contains
    $composition-basedOn-order-or-requisition named basedOn-order-or-requisition 0..* and
    $information-recipient named information-recipient 0..* and
    $composition-diagnosticReportReference named diagnosticReport-reference 0..1
* extension[basedOn-order-or-requisition].valueReference 0..1
* extension[basedOn-order-or-requisition].valueReference only Reference($ServiceRequest-uv-lab)
* extension[basedOn-order-or-requisition].valueReference ^sliceName = "valueReference"
* extension[information-recipient].value[x] only Reference($Practitioner-uv-lab or Device or $Patient-uv-lab or RelatedPerson or $PractitionerRole-uv-lab or Organization)
* extension[diagnosticReport-reference].value[x] 1..
* extension[diagnosticReport-reference].value[x] only Reference($DiagnosticReport-uv-lab)
* extension[diagnosticReport-reference].value[x].reference 1..
* extension[diagnosticReport-reference].value[x].reference ^comment = "Added to the FHIR R4 guide to strctly conform with the R4 rules for document bundle resources inclusion.\n  Using this extension implies to accept a circular reference Composition to/from  DiagnosticReport"
* identifier ^short = "Report identifier"
* identifier ^definition = "Identifiers assigned to this Laboratory Report by the performer or other systems. It shall be common to several report versions"
* identifier ^comment = "Composition.identifier SHALL be equal to one of the DiagnosticReport.identifier, if at least one exists"
* status ^short = "Status of the Report"
* status ^comment = "DiagnosticReport.status and Composition.status shall be aligned, based on the http://hl7.org/fhir/uv/laboratory/ConceptMap/ConceptMap-diagRptStatus2CompStatus-uv-lab mapping"
* type only $CodeableConcept-uv-ips
* type from $reportType-uv-lab (preferred)
* type ^short = "Type of (Laboratory) Report"
* type ^definition = "Specifies that it refers to a Laboratory Report"
* type ^comment = "At least one DiagnosticReport.code.coding and Composition.type.coding SHALL be equal"
* category only $CodeableConcept-uv-ips
* category ^slicing.discriminator[0].type = #pattern
* category ^slicing.discriminator[=].path = "$this"
* category ^slicing.rules = #open
* category ^short = "Report Category"
* category ^definition = "A code that classifies this laboratory report. Two basic categories has been selected in this guide: laboratory specialty and Study type. Laboratory specialty is characteristic of the laboratory that produced the test result while Study type is an arbitrary classificion of the test type."
* category ^comment = "DiagnosticReport.category and Composition.category shall be aligned"
* category contains
    studyType 0..* and
    specialty 0..*
* category[studyType] from $studyType-uv-lab (required)
* category[studyType] ^short = "The way of grouping of the test results into clinically meaningful domains (e.g. hematology study, microbiology study, etc.)"
* category[studyType] ^definition = "Laboratory services, i.e., results of tests performed, could be characterized using typology of services, commonly called study types. Study type could be seen as an attribute or grouping mechanism that assigns a common clinical sense to certain types of laboratory test results., e.g., Hemoglobin, Platelet count, etc. belongs to 'Hematology study'."
* category[studyType] ^comment = "In comparison to the laboratory specialty which is an attribute of laboratory, study type is a categorization of laboratory service. It needs to be mentioned that classification of test to study types in not standardized."
* category[specialty] from $specialty-uv-lab (required)
* category[specialty] ^short = "The clinical domain of the laboratory performing the observation (e.g. microbiology, toxicology, chemistry)"
* category[specialty] ^definition = "Laboratory specialty is an attribute of any laboratory setting representing professional qualification of the laboratory to execute certain kind of laboratory tests."
* category[specialty] ^comment = "Specialty could be used as parameter for searching/querying of laboratory test results."
* subject 1..
* subject only Reference($Patient-uv-lab or $Patient-animal-uv-lab or Group or Location or Device)
* subject ^short = "Who and/or what this report is about"
* subject ^definition = "Who or what this report is about. The report can be about a human patient, a living subject, a device (e.g. a machine), a location or even a group of subjects (such as a document about a herd of livestock, or a set of patients that share a common exposure)."
* subject ^comment = "DiagnosticReport and Composition SHALL have the same subject"
* encounter ^short = "The healthcare event which this Laboratory Report is about (when test ordered)."
* encounter ^definition = "The healthcare event (e.g. a patient and healthcare provider interaction) which this DiagnosticReport is about."
* encounter ^comment = "This will typically be the encounter the event occurred within, but some events may be initiated prior to or after the official completion of an encounter but still be tied to the context of the encounter (e.g. pre-admission laboratory tests).\n\n  DiagnosticReport and Composition SHALL have the same encounter."
* author ^short = "Who and/or what authored the Laboratory Report"
* author ^definition = "Identifies who is responsible for the information in the Laboratory Report, not necessarily who typed it in."
* author ^comment = "If a DiagnosticReport.resultsInterpreter exists this is expected to be a Composition.author; otherwise a DiagnosticReport.performer should be an author."
* title ^short = "Laboratory Report"
* title ^definition = "Official human-readable label for the composition.\r\n\r\nFor this document should be \"Laboratory Report\" or any equivalent translation"
* attester ^short = "Attests the report accuracy"
* attester.mode ^short = "The type of attestation"
* attester.time ^short = "When the report was attested by the party"
* attester.party ^short = "Who attested the report"
* attester.party ^comment = "For a Laboratory Report it is usually non expected that the attester would be a Patient or a RealtedPerson"
* event ^short = "The laboratory service(s) being documented"
* event.code ^short = "Code(s) that apply to the laboratory service(s) being documented"
* event.period ^short = "Period of time covered by the documentation"
* event.detail ^short = "The laboratory service(s) being documented"
* section 1..
* section ^slicing.discriminator[0].type = #exists
* section ^slicing.discriminator[=].path = "$this.section"
* section ^slicing.discriminator[+].type = #exists
* section ^slicing.discriminator[=].path = "$this.entry"
* section ^slicing.ordered = false
* section ^slicing.rules = #open
* section ^definition = "The \\\"body\\\" of the report is organized as a tree of up to two levels of sections: top level sections represent laboratory specialties. A top level section SHALL contain either one text block carrying all the text results produced for this specialty along with Laboratory Data Entries or a set of Laboratory Report Item Sections. In the first case the specialty section happens to also be a leaf section. In the latter case, each (second level) leaf section contained in the (top level) specialty section represents a Report Item: i.e., a battery, a specimen study (especially in microbiology), or an individual test. In addition, any leaf section SHALL contain a Laboratory Data Entries containing the observations of that section in a machine-readable format."
* section.title 1..
* section.code 1..
* section.code only $CodeableConcept-uv-ips
* section contains
    lab-no-subsections 0..* and
    lab-subsections 0..* and
    annotations 0..*
* section[lab-no-subsections] ^short = "Variant 1: Laboratory Report section with entries and no sub-sections"
* section[lab-no-subsections] ^definition = "Variant 1: With this option, all laboratory report data entries are provided in the top level sections and no sub-sections are allowed."
* section[lab-no-subsections].code from $studyType-uv-lab (preferred)
* section[lab-no-subsections].text ^short = "Text summary of the section, for human interpretation."
* section[lab-no-subsections].entry 1..
* section[lab-no-subsections].entry only Reference($Observation-resultslab-uv-lab)
* section[lab-no-subsections].section ..0
* section[lab-subsections] ^short = "Variant 2: Laboratory Report section with one to many subsections Laboratory Report Item"
* section[lab-subsections] ^definition = "Variant 2: With this option, this top level section doesn't include NEITHER a top level text NOR entry elements. Each Report Item is contained in a corresponding sub-sections which contains the Lab Report Data Entry."
* section[lab-subsections].code from $studyType-uv-lab (preferred)
* section[lab-subsections].text ..0
* section[lab-subsections].entry ..0
* section[lab-subsections].section 1..
* section[lab-subsections].section only BackboneElement
* section[lab-subsections].section.title 1..
* section[lab-subsections].section.code 1..
* section[lab-subsections].section.code only $CodeableConcept-uv-ips
* section[lab-subsections].section.code from $studyType-uv-lab (preferred)
* section[lab-subsections].section.text ^short = "Text summary of the section, for human interpretation."
* section[lab-subsections].section.entry 1..
* section[lab-subsections].section.entry only Reference($Observation-resultslab-uv-lab)
* section[lab-subsections].section.section ..0
* section[annotations] ^short = "Annotation comment"
* section[annotations] ^definition = "Narrative expression of comments accompanying the report, such as suggestions for evaluation, technical notes from the laboratory, etc.\n\nExamples:\nSuggestion: This result should be evaluated in relation to the patient's medical history and clinical condition.\nTechnical note: A list of accredited examination(s) is available at www.laboratory.com. "
* section[annotations].code = $loinc#48767-8
* section[annotations].text 1..
* section[annotations].entry ..0
* section[annotations].section ..0