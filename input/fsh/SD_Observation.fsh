Profile: ObservationSDCeCC
Parent: Observation
Id: ihe-sdc-ecc-Observation
<<<<<<< Updated upstream
Title: "IHE SDC/eCC on FHIR Observation"
Description: "This Observation Profile describes how to capture Question/Answer Pairs from IHE SDC. Any additional  fill in answers in an Observation.component.value. If the question is Multiselect multiple Observations with the same Question Code should be created. A section should also be represented as a grouping Observation"
=======
Title: "IHE SDC/eCP on FHIR Observation"
Description: "This Observation Profile describes how to capture Question/Answer Pairs from IHE SDC. If the question is Multiselect multiple Observations with the same Question Code should be created. A section should also be represented as a grouping Observation. If the question has a follow up text or number entry field e.g. Other (Specify) the information from the textbox should be stored in the Observation.component.value, and the Observation.component.code should repeat the Observation.value as the sub-question."
>>>>>>> Stashed changes
* identifier 1..* MS 
* identifier ^short = "the SDC instanceGUID"
* identifier ^definition = "The identifier should match the SDC answer instanceGUID. If an answer instanceGUID is not available a Question instanceGUID shall be used"
* code ^short = "SDC section/question ID"
* code ^definition = "The code should match the question ID from the SDC form. In a given Observation group, there might be repeating codes for multiselect questions, though these Observations will have different values"
* hasMember MS 
* hasMember ^short = "child observation reference"
* hasMember ^definition = "hasMember should be used to capture any child questions in related Observations"
* derivedFrom MS
* derivedFrom ^short = "parent observation reference"
* derivedFrom ^definition = "derivedFrom should be used to capture a parent Observation or the parent DocumentReference"
* value[x] MS 
* value[x] ^short = "the value for selected answer"
* value[x] ^definition = "The value should match the from the SDC form. Unique Observations should be created for each multi-select answer"
* component MS
* component ^short = "additional entry"
* component ^definition = "Any additional list item response fields which were filled in should be captured in the component as their appropriate value type"