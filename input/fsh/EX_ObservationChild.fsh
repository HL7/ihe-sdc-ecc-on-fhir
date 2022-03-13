Instance: SDCeCCObservationChild
InstanceOf: ObservationSDCeCC
Description: "Example Child Observation demonstrating a parent derivedFrom reference"
Usage: #example
* id = "SDCeCCObservationChild"
* identifier.system = "http://example.org/Observation"
* identifier.value = "fikea3-188a-4ko3-00dc-8282cc908f3e"
* status = #final
* code = CAP#25899 
* subject = Reference(http://example.org/patient)
* subject.display = "Example Patient"
* effectiveDateTime = "2021-05-11"
* performer = Reference(http://example.org/practitioner)
* performer.display = "Example Practitioner"
* valueCodeableConcept = CAP#25900 "Internal control cells present and stain as expected"
* derivedFrom.identifier.system = "http://example.org/Observation"
* derivedFrom.identifier.value = "eccea3-121a-4bc3-94dc-7463cc908f2e"