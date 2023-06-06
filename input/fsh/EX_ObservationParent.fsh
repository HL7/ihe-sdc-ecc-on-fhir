Instance: SDCeCCObservationParent
InstanceOf: ObservationSDCeCC
Title: "SDC eCP Observation Parent Example"
Description: "Example Parent Observation demonstrating a child hasMember reference"
Usage: #example 
* id = "SDCeCCObservationParent"
* identifier.system = "http://example.org/Observation"
* identifier.value = "eccea3-121a-4bc3-94dc-7463cc908f2e"
* status = #final
* code = CAP#31161 "Progesterone Receptor (PgR) Status (Note A)"
* subject = Reference(http://example.org/patient)
* subject.display = "Example Patient"
* effectiveDateTime = "2021-05-11"
* performer = Reference(http://example.org/practitioner)
* performer.display = "Example Practitioner"
* valueCodeableConcept = CAP#31001 "Negative (less than 1%)"
* hasMember.identifier.system = "http://example.org/Observation"
* hasMember.identifier.value = "fikea3-188a-4ko3-00dc-8282cc908f3e"