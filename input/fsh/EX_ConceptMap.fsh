Instance: conceptMapIGex
InstanceOf: ConceptMap
Title: "Example ConceptMap resource showing mapping of SNOMED to CAP CKeys"
Usage: #example
Description: "Example ConceptMap showing how SNOMED Codes may be mapped to CAP eCCs. Note: Draft and example only not for production use, only testing purposes"
* status = #draft
* name = "EX-CAP-ConceptMap"
* title = "Example CAP Concept Map of SNOMED to CAP Ckeys"
* experimental = true
* date = "2022-04-20"
* publisher = "College of American Pathologists"
* contact.telecom.system = #email
* contact.telecom.value = "agoel@cap.org"
* description = "mapping of SNOMED to CAP CKeys"
* purpose = "mapping of SNOMED to CAP CKeys"
* copyright = "College of American Pathologists 2022"
* group.source = "http://cap.org/eCC"
* group.target = "http://snomed.info/sct"
* group.element[0].code = #31072.100004300
* group.element[=].display = "Cannot be determined (indeterminate)####"
* group.element[=].target.code = #1156316003
* group.element[=].target.display = "Cannot be determined (qualifier value)"
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #381652.381651
* group.element[=].display = "Negative"
* group.element[=].target.code = #260385009
* group.element[=].target.display = "Negative (qualifier value)"
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #381652.381650
* group.element[=].display = "Positive"
* group.element[=].target.code = #10828004
* group.element[=].target.display = "Positive (qualifier value)"
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #381652.381654
* group.element[=].display = "Equivocal (explain)"
* group.element[=].target.code = #42425007
* group.element[=].target.display = "Equivocal (qualifier value)"
* group.element[=].target.equivalence = #equivalent