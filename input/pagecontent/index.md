# IHE SDC/eCC on FHIR

## Introduction
[Integrating the Healthcare Enterprise (IHE) Structured Data Capture (SDC)](https://wiki.ihe.net/index.php/Structured_Data_Capture) on FHIR uses a form-driven workflow to capture and transmit encoded data by creating FHIR Observations. The primary use case for this is transmitting data captured in College of American Pathologists [electronic Cancer Checklists (eCCs)](https://www.cap.org/laboratory-improvement/proficiency-testing/cap-ecC), which are distributed as IHE SDC templates.

The SDC initiative was established by the ONC in 2013 to develop two implementation guides:
+   [IHE SDC Technical Framework](https://wiki.ihe.net/index.php/Structured_Data_Capture) 
+   [HL7 FHIR SDC Implementation Guide](http://hl7.org/fhir/us/sdc/)

On March 30, 2017 the ONC transitioned both initiatives into community led projects. Both initiatives focus on improving data capture within healthcare. The CAP selected IHE SDC for their collection of [electronic Cancer Checklists (eCCs)](https://www.cap.org/laboratory-improvement/proficiency-testing/cap-ecC). This implementation guide will enable implementers to transmit eCC data in FHIR resources. 

<!--Can we put this in the guide? shows a concrete example of what this implementation guide does

There is a parser implementation available for this guide available here: https://github.com/IHE-SDC-WG/IHE-SDC-FHIR-Parser--> 

The encoded eCC/SDC xml may be included in the message as an encoded attachment data element or alternatively linked as a URL.

## FHIR Version
This FHIR implementation guide is based on FHIR R4. 

## Purpose
This implementation guide specifies a pattern of use for IHE SDC with applicable FHIR resource to enable use of data captured from IHE SDC forms within FHIR. 
This guide supports: 
+	Creation of structured data in FHIR
+	Use of that data 

Leveraging IHE SDC and FHIR allows for data to be shared more easily and enables improved data management and analysis as well as pre-population of data in new forms. The coding of structured data automates the interpretation and utilization of the data thereby allowing for the automation of processes, and increasing efficiency and accuracy. The representation of data as a FHIR resource can remove barriers that exist between different datasets while improving interoperability and making data more useful to providers, hospitals, and cancer registries.

### The College of American Pathologists eCCs
The College of American Pathologists (CAP) Cancer Reporting Protocols offer a guideline for the collection of key data elements for reporting of malignant tumours. The protocols can be used in a number of different tumour types and procedures such as biopsies and resections. Protocols are made up of two parts: the case summary and the explanatory notes. 

The case summary section contains core data elements and optional data elements. Core data elements are the mandatory elements which must be reported whether or not they are applicable to the case. A subset of the core elements are conditional data elements which are only completed if applicable to the case. Optional data elements are fields which may be required for reporting based on practice standards at local institutions or different jurisdictions. These elements are identified with a “+”.

The explanatory notes within the cancer protocols aim to provide guidance and support the accurate completion of the case summaries.


## Common use cases
Use cases for IHE SDC/eCC  on FHIR include: 
+	Public health reporting (e.g. Cancer Registry reporting) 
+	Quality measurement and evaluation
+	Clinical guideline concordance evaluation 
+	Auto-population of future forms

### Public health reporting (e.g. Cancer Registry reporting)
In this use case the conversion of SDC forms to FHIR resources has the potential of enabling high-quality public health reporting through improved ease of data collection and transmission, and improved accuracy of data. Ultimately this can be used to better integrate with cancer registries for public health planning and reporting. The coding of data to a common standard helps to remove the discrepancies that may exist between different datasets which can allow registries to more easily compare and correlate data. This allows for public health decision-making that effectively combines different datasets, improves efficiency through automation, and limits errors through the removal of human interaction. 

### Quality measurement and evaluation
In this use case the conversion of SDC forms to FHIR resources could enable institutions to more easily collect data as it relates to pathology or radiology reporting through a common and standardized format. This would enable improved analysis of data which could then be used for quality measurement and evaluation activities at the facility or physician level. Based on the data collected institutions could introduce quality improvement initiatives or additional training opportunities for providers.

### Clinical guideline concordance evaluation
In this use case the conversion of SDC forms to FHIR resources enables the evaluation of concordance against computable representations of narrative clinical guidelines. As new guidelines are introduced, specific measures can be identified as methods of assessing concordance to the guideline. Having SDC form data available in a standardized format enables the assessment of concordance against guidelines by hospitals or governing bodies.


### Auto-population of future forms
In this use case information collected through SDC forms could be used to auto-populate future forms. Data collected as a FHIR resource can be linked to a patient record so that any future forms relating to that patient can be automatically pre-populated with existing relevant data. One example is a patient having a second biopsy, in which case all relevant data from the first biopsy can be automatically included in a report to the treating physician. This would improve efficiency, while reducing errors and ensuring that all relevant data is available to the care team.

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