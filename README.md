## GENERAL INFORMATION

This README file was generated on [2021-10-07] by [Authors].

This project is developed by the Latin American Bike Knowledge Sharing (LABIKS) with peer, after analyzing data from all in operation systems along the region. As a result of these analysis, we develop an annual report called "Bike Sharing Systems in Latin America" and we maintain an online map called "The Latin America Bike-sharing Map", which provides information from these BSS's.

Our intention is to increase the knowledge about this theme, and we aim to disseminate the acquired information and data to stimulate new ideas and new developments.

This repository contains the original database on this page was copied from [Hindawi](https://www.hindawi.com/research.data/#statement.templates).

Last updated: [2022-02-04].

### **ABOUT THE PAPER**
title: "Latin American bike sharing ecosystem overview: from data collection to implementation model portraits"
authors: "BINATTI, G. ; BATALHA, Y. ; DECASTRO, J. ; OLIVEIRA, M. H. S."
journal: "URBE Brazilian Journal of Urban Management"
ISSN: 2175-3369
site: www.scielo.br/urbe
deposit date: ("2021-10-07")

#### *CONTACT INFORMATION*
name: Juliana DeCastro
email: jdecastro@pet.coppe.ufrj.br

### **DATABASE GLOSSARY**

In the Table 1, we describe the variables used in the study and the possible values for every system. This was necessary to data’s standardization. 
     
<br>     
Table 1. Study’s variables 

| Variables | Description | Answers values | Answer description |
| --- | --- | --- | --- |
| System | Bike Sharing System (BSS) name |		
| Country | Country where BSS is located |		
| City | City where BSS is located |		
| Population | BSS City or Metropolitan Area population 		
| Type | System type | Dock based | BSSs with stations |
| |   | Dockless | BSSs without stations |
| Dock Stations | Number of stations |		
| Virtual Stations | Number of dockless virtual stations |		
| Docks | Number of docks available |		
| Bikes | Number of bicycles available |		
| Operator | System operator |	
| Reponsible Entity | Reponsible entities |	
| Tecnology / Equipament | BSS tecnologhy |		
| Old Tecnology / Equipament | BSS Old Tecnologhy |		
| Sponsor | System sponsor |		
| Transit Integration | Indicates if the BSS has tariff transit integration with the transit system | Yes |
| | | with *** | Integrated system with a specific card |
 | | | No | No Integrated system |
| Opening Hours | System working hours |	
| Fees | System tariff plans |
| Payment Options | System available payment options | Credit Card |
| |  | Debit Card |
| Over Time Additional Fee| Overtime additional fee when it applies |Yes | 	
| | | Yes, Hour’s penalty | Systems with hours penalty for overtime |
| | | Yes, Days Penalty | Systems with days penalty for overtime |
|  | | No |	
| Launched | System release date |		
| Shut down | System termination |		
| Relaunch | System relaunch date |		
| Description Re-launch | Relaunch characteristics |		
| Open Data | System open data website |	
| API/Data | Available data format via API |		
|Website | System website |		
| Last update LatinoSBP | Last update date |		
| Source | Information’s sources |	

**Table 3 -**  Variable Selection for Multiple Correspondence Analysis


|**TOPIC**|**VARIABLE**|**CATEGORIES**|**DATA TYPE**|
| :-: | :-: | :-: | :-: |
|System Characteristics|Countries\_group|<p>Brazil, </p><p>Colombia,</p><p>` `Mexico,</p><p>` `Argentina, </p><p>Others</p>|Categorical (Factor)|
||City Pop\_Group|<p>Up to 100k, 100k-250k, </p><p>250k-500k, 500k-1000k,</p><p>` `Over 1000k</p>|Ordinal (Factor)|
||System\_Type|<p>Dockbased; </p><p></p>|Categorical (Factor)|
|` `System management|Fee|Yes, No|Binary (Factor)|
||SponsorSector\_Group|<p>Financial, Government, </p><p>Joint venture, </p><p>Health, </p><p>Other\*</p>|Categorical (Factor)|
|` `Systems operator|Operator\_Type|<p>Private;</p><p>Public</p>|Binary (Factor)|
||Transit Integration|<p>Yes,</p><p>` `No</p>|Binary (Factor)|
Source: Developed by authors (2021)


### **REPOSITORY CONTENT**

Here you will find the repository's content along the years. The report will be released every year, using data from the past year.

*For example: The report with 2019's data was release in 2020.* 

<br>
Table 2. Report 2019 - Contents

|Content| Type | Format | 
| --- | --- | --- |
| BSS_LA_DataBase |  spreadsheet | .csv | 
| Systems_per_country |  image | .png | 
| Systems_type_per_country |  image | .png | 
| Systems_per_cities_population |  image | .png | 
| BSS_LA_Timeline |  image | .png | 
| Largest_LA_Systems |  image | .png | 
| Operators_type |  image | .png | 
| Sponsors_sectors|  image | .png |  
| LatinoSBP_Report_2019_EN |  text | .pdf | 

> Code for data cleaning and analysis is provided as part of the replication package. It is available at https://dropbox.com/link/to/code/XYZ123ABC for review. It will be uploaded to the [JOURNAL REPOSITORY] once the paper has been conditionally accepted.

Dataset list
------------

> INSTRUCTIONS: In some cases, authors will provide one dataset (file) per data source, and the code to combine them. In others, in particular when data access might be restrictive, the replication package may only include derived/analysis data. Every file should be described. This can be provided as a Excel/CSV table, or in the table below.

| Data file | Source | Notes    |Provided |
|-----------|--------|----------|---------|
| `data/raw/lbd.dta` | LBD | Confidential | No |
| `data/raw/terra.dta` | IPUMS Terra | As per terms of use | Yes |
| `data/derived/regression_input.dta`| All listed | Combines multiple data sources, serves as input for Table 2, 3 and Figure 5. | Yes |



### License

![CC-BY-NC](assets/cc-by-nc.png) The README is under a CC-BY-NC license. Usage by commercial entities is allowed, reselling it is not.
