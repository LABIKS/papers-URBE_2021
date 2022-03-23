## GENERAL INFORMATION

This README file was generated on [2021-10-07] by [Authors].
Last updated: [2022-02-04].

This scientific paper was developed by the Latin American Bike Knowledge Sharing [LABIKS](https://labiks.org/en/about-us/) with peers, after analyzing the original database from the annual report called "Bike Sharing Systems in Latin America". In this repository you will find the code script (R version 4.0.4) that will allow you to replicate the methodology for data analysis and the results found. 

Our intention is to increase the knowledge about this theme, and we aim to disseminate the acquired information and data to stimulate new ideas and new developments.

### **ABOUT THE PAPER**
title: "Latin American bike sharing ecosystem overview: from data collection to implementation model portraits"
authors: "[BINATTI, G.](https://orcid.org/0000-0002-0006-4923); [BATALHA, Y.](https://orcid.org/0000-0002-3393-8842) ; [DECASTRO, J.](https://orcid.org/0000-0002-4841-1576); [OLIVEIRA, M. H. S.](https://orcid.org/0000-0001-6417-7882)"
journal: [URBE Brazilian Journal of Urban Management](www.scielo.br/urbe)
ISSN: 2175-3369
deposit date: ("2021-10-07")

abstract: The growth in the number of Bike Sharing Systems (BSSs) has sparked interest in their institutional arrangements, business models and operational characteristics. When compared to experiences developed in North America, Europe, and Asia, knowledge about implementing and operating BSSs in Latin America is still limited to specific case studies. Thus, this article aims to make an exploratory analysis of the characteristics of BSSs implemented in Latin American cities. To do so, the Multiple Correspondence Analysis (MCA) was applied, using data from the systems in operation during the month of December 2019, available on an online platform called LABIKS. The application of MCA proved to be an efficient and objective methodology to compare the various experiences of implementing BSSs in Latin America. Although countries share several challenges in common, the context of the region is very diverse, which justifies the different models of management and operation found in this research. Furthermore, results show significant differences in the implementation and expansion between dock-based and dockless systems in Latin America, highlighting challenges and possibilities for promoting this resilient and sustainable mode of transportation.

keywords: Bike Sharing, Latin America, Multiple Correspondence Analysis, Transport planning, Urban mobility

#### *CONTACT INFORMATION*
name: Juliana DeCastro
email: jdecastro@pet.coppe.ufrj.br
Institution: [Transportation Engineering Program at Federal University of Rio de Janeiro](https://www.pet.coppe.ufrj.br/index.php/pt/) 
[ORCID:](https://orcid.org/0000-0002-4841-1576) 

### **METHODS FOR PROCESSING THE DATA AND FINDINGS**

Code script (R version 4.0.4) that will allow you to replicate the methodology for data analysis and the results found. for data cleaning and analysis is provided as part of the dataset. It is available at https://bit.ly/3D3ieZy for review. 
The goal here is transparency and accountability: anyone could replicate the research findings with the data and the R-script, an objective aligned with the best practices of open science

The provided code reproduces:

- All dataset (input and output) provided in the paper
- Annex Statistical Test (descriptive statistics, Chi-Square and Multiple Correspondance Analysis)
- Multiple Correspondance Analysis and Findings  

It will be uploaded to the [DATAVERSER JOURNAL REPOSITORY](https://doi.org/10.48331/scielodata.9CQMA6) once the paper has been conditionally accepted.

### **DATABASE GLOSSARY**

In the Table 2, we describe the original dataset (raw data) variables used in the study and the possible values for every system. This contains was adapted from [LABIKS/Annual Report 2019](https://github.com/LABIKS/Annual_reports.git).
     
<br>     
Table 2. Database variables developed by LABIKS

| Topics                    | Characteristics       | Description                                               |
|:-------------------------:|:---------------------:|:---------------------------------------------------------:|
| BSSs across Latin America | System                | BSS name                                                  |
|                           | Country               | BSS country location                                      |
|                           | City                  | BSS city location                                         |
|                           | Population            | City or Metropolitan Area inhabitants                     |
| System's characteristics  | Type                  | BSS typology                                              |
|                           | Dock stations         | Number of docked stations                                 |
|                           | Virtual stations      | Number of dockless stations                               |
|                           | Docks                 | Number of dock points                                     |
|                           | Bikes                 | Number of bicycles available                              |
|                           | Current Technology    | BSS equipment model in use                                |
|                           | Old Technology        | BSS equipment superseded model                            |
| System's management       | Operator              | BSS operator                                              |
|                           | Responsible Entity    | trustee and manager of an investment in BSS               |
|                           | Sponsor               | BSS sponsor type                                          |
| System's operation        | Transit Integration   | Indicates if the BSS and transit has payment integration� |
|                           | Opening Hours         | BSS working hours                                         |
|                           | Fees                  | BSS pass fares                                            |
|                           | Payment Options       | BSS payment methods                                       |
|                           | Overtime Charges      | BSS overtime additional Fee                               |
| Implementation History    | Launched              | BSS release date                                          |
|                           | Shut down             | BSS closed                                                |
|                           | Relaunch              | BSS relaunch date                                         |
|                           | Description Re-launch | Relaunch characteristics                                  |
| System's data             | Open Data             | BSS payment methods                                       |
|                           | API Data              | Data availability by API�                                 |

Source: Developed by authors (2021)



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


### **DATASET LIST**

| File Name | Type | Format | Folder | Notes| Provided | 
| :---: |:---: | :---:  |  :---:   | :---:| :---:| 
| BSS_LA_DataBase | dataset| .csv | raw data |original dataset serves as input for Table 2 | Yes
| bss_tidy | dataset | .csv  | analyzed data |serves as input for Chi-Square Test of Independence (Pearson) |Yes
| annex_a_bss_tidy_descriptive-analysis| statitstical test| .txt | Annex Statitstical Tests|Descriptive Analysis of Chi_Square input dataset|Yes
| X2_bss_tidy | dataset | .csv  | analyzed data |output for Chi-Square Test of Independence (Pearson) |Yes
| dockbased_tidy |  dataset | .csv | analyzed data |Multiple Correspondence Analysis (MCA) input dataset serves as input for Table 3|Yes
| annex_b_dockbased_tidy_descriptive-analysis-X2output| statitstical test |.txt |Annex Statitstical Tests|Descriptive Analysis of Chi_Square output dataset |Yes
| annex_C_MCA_dockbased_160122 | statitstical test |.txt | Annex Statitstical Tests| MCA Analysis and Results |Yes
| MCA_dockbased_DescriptAnalysis_input_dataset|  image | .png |  input original dataset |Descriptive Analysis of MCA dataset serves as input for Figure 2 |Yes
| Script_URBE-2021 | code | .R | Script |Methods and Findings| Yes 


Last updated: [2022-02-04].

### License

![CC-BY-NC](assets/cc-by-nc.png) The README is under a CC-BY-NC license. Usage by commercial entities is allowed, reselling it is not.
