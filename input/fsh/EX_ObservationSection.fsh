Instance: SDCeCCObservationSection
InstanceOf: ObservationSDCeCC
Title: "SDC eCP Observation Section Example"
Description: "Example Section Observation demonstrating how to group Observations using the Observation Grouper"
Usage: #example 
* id = "SDCeCCObservationSection"
* identifier.system = "http://example.org/Observation"
* identifier.value = "mmk6z8-121a-4bc3-94dc-7463cc9oi88"
* status = #final
* code = CAP#17537 "CLINICAL"
* subject = Reference(http://example.org/patient)
* subject.display = "Example Patient"
* effectiveDateTime = "2021-05-11"
* performer = Reference(http://example.org/practitioner)
* performer.display = "Example Practitioner"
* hasMember[0].identifier.system = "http://example.org/Observation"
* hasMember[0].identifier.value = "eccea3-121a-4bc3-94dc-7463cc908f2e"
* hasMember[1].identifier.system = "http://example.org/Observation"
* hasMember[1].identifier.value = "fikea3-188a-4ko3-00dc-8282cc908f3e"