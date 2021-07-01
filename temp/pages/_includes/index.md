# IHE-SDC-eCC-On-FHIR

## Introduction
IHE Structured Data Capture (SDC) on FHIR uses a form driven workflow to capture and encode data by creating FHIR Observations from the captured data. The primary use case for this implementation guide is point of care reporting for clinicians using structured forms to capture high quality data for care and reporting purposes. Structured data can enable easier auto-population of future medical documents, easily queriable data, and high quality reporting for quality measurement and evaluation, and research.

The SDC initiative was established by the ONC in 2013 to develop two implementation guides:
+   [IHE SDC Technical Framework](https://wiki.ihe.net/index.php/Structured_Data_Capture) 
+   [HL7 FHIR SDC Profile](http://hl7.org/fhir/us/sdc/)
˜
On March 30, 2017 both initiatives transitioned into community led projects focused on data capture. The ideal scenario is that data captured in any manner can exist in FHIR for maximum interoperability.  Both initiatives focus on improving data capture within healthcare. The CAP has already developed and implemented IHE SDC for their collection of [electronic Cancer Checklists (eCCs)](https://www.cap.org/laboratory-improvement/proficiency-testing/cap-ecC), and being able to extract data from these cancer checklists to create FHIR Observations will enhance interoperability.

## FHIR Version
This FHIR implementation guide is based on FHIR R4. 

## Purpose
This implementation guide specifies a pattern of use for IHE SDC with applicable FHIR resource to enable use of data captured from IHE SDC forms within FHIR. 
This guide supports: 
+	Creation of structured data in FHIR
+	Use of that data 

## Common use cases
Use cases for IHE SDC/eCC  on FHIR include: 
+	Public health reporting (e.g. Cancer Registry reporting) 
+	Quality measurement and evaluation
+	Clinical guideline concordance evaluation 
+	Auto-population of future forms

## Scope
This implementation guide establishes a pattern for how to transport IHE SDC forms using FHIR DocumentReference, and DiagnosticReport, and how to extract data from IHE SDC forms to FHIR Resources, namely Observations. 

## Audience
This implementation guide is intended for those Form designers, systems developers and integrators, and clinical informaticists. The audiences for this implementation guide should consider how IHE SDC forms and data may be used within FHIR. 

## SDC Form Structure
IHE SDC ustilizes Identifiers on all Question and Answer Sets (QAS). These IDs within the QAS better allow for mapping between IHE SDC forms, standard or local terminology, billing codes, etc. They enable implementers to better capture and utilize their structured data within databases. 

IHE SDC forms also have a robust metadata section that allows for the capture of important copyright information on the form, its disease site and other important information such as versioning. More detail on this can be found in the [IHE SDC Technical Framework Supplement](https://www.ihe.net/uploadedFiles/Documents/QRPH/IHE_QRPH_Suppl_SDC.pdf)

## Transport of the IHE SDC Forms within FHIR
A DocumentReference is the preferred way to transport an IHE SDC form as an attachment within FHIR. The Form shall be Base64 encoded and included for transport much like a CDA document or PDF might be.

## Must Support
The elements labelled Must Support in this guide should be sent if available. If they are unavailable, refer to cardinality of the element. For implementers using these resources if the data is unavailable they do not need to include the element. 