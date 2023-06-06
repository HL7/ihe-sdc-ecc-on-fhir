Profile: DocumentReferenceSDCeCC
Parent: DocumentReference
Id: ihe-sdc-ecc-DocumentReference
Title: "IHE SDC/eCP on FHIR DocumentReference"
Description: "A DocumentReference Profile meant to share an IHE SDC Form whether completed or blank"
* masterIdentifier 1..1 MS
* masterIdentifier ^short = "the form's SDC ID if blank, or @instanceVersionGUID if filled"
* masterIdentifier ^definition = "the form's SDC ID should be replaced by form's instanceVersionGUID if the form has been filled"
* identifier MS
* identifier ^short = "Any additional form identifying information"
* identifier ^definition = "Additional identifying information about the form such as its fullURI"
* category 1..* MS 
* subject MS 
* author MS 
* relatesTo MS
* securityLabel MS 
* content 1..1 MS 
* context MS 