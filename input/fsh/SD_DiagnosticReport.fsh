Profile: DiagnosticReportSDCeCC
Parent: DiagnosticReport
Id: ihe-sdc-ecc-DiagnosticReport
Title: "IHE SDC/eCP on FHIR DiagnosticReport"
Description: "A DiagnosticReport Profile meant to capture what should be represented in a report parsed from an IHE SDC Form"
* status 1..1 MS 
* category MS 
* code MS 
* subject MS 
* performer MS
* specimen MS
* result 1..* MS 
* result only Reference(ObservationSDCeCC)
* presentedForm 1..* MS
* presentedForm ^short = "SDC form, HTML render, and/or PDF"
* presentedForm ^definition = "Should include some kind of human readable presentation of the form in HTML or PDF. May also include the XML of the SDC form, however DocumentReference is a better carrier of the SDC XML"