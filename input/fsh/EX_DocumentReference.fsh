Alias:   LNC = http://loinc.org
Instance: SDC-eCC-DocRef
InstanceOf: DocumentReferenceSDCeCC
Title: "SDC eCC DocumentReference"
Description: "Example DocumentReference with eCC attached as URL"
Usage: #example 
* id = "eCCDocRef0"
* masterIdentifier.use = #usual 
* masterIdentifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* masterIdentifier.system = "http://master.hospital.example.org"
* masterIdentifier.value = "masterIdentifiereCCDocRef0"
* identifier.use = #usual 
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier.system = "http://hospital.example.org"
* identifier.value = "identifiereCCDocRef0"
* status = #current
* category = LNC#LP7839-6 "Pathology"
* content.attachment.title = "example.org/sdc-ecc/eCCDocRef0"