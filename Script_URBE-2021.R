


----
  title: "Latin American bike sharing ecosystem overview: from data collection to implementation model portraits"
  authors: "BINATTI, G. ; BATALHA, Y. ; DECASTRO, J. ; OLIVEIRA, M. H. S."
  journal: "URBE Brazilian Journal of Urban Management"
  ISSN: 2175-3369
  site: www.scielo.br/urbe
  deposit date: ("2021-10-07")
  
  
  #build on: R version 4.0.4 (2021-02-15) -- "Lost Library Book"
  #Copyright (C) 2021 The R Foundation for Statistical Computing
  #Platform: x86_64-w64-mingw32/x64 (64-bit)
----
    # Step 1: Installing and Loading Packages for data analysis
    
  if(!require(tidyverse)) install.packages("tidyverse") 
  library(tidyverse)
  if(!require(tidyr)) install.packages("tidyr") 
  library(tidyr)
  if(!require(DescTools)) install.packages("DescTools", dependencies=TRUE) 
  library(DescTools)
  if(!require(FactoMineR)) install.packages("FactoMiner", dependencies=TRUE) 
  library(FactoMineR)
  if(!require(factoextra)) install.packages("factoextra", dependencies=TRUE) 
  library(factoextra)
  if(!require(Factoshiny)) install.packages("Factoshiny", dependencies=TRUE) 
  library(Factoshiny)
  
  
  
   #Step 2: Importing the database and loading rawdata
   #original database directly from github (https://github.com/LABIKS/Annual_reports.git) 
   #or by downloading the database ("BSS_LA_DataBase.csv") to the directory of your choice 
  
  
   #ATTENTION: select working directory
   ## Session > Set Working Directory > Choose Directory
  
   
   setwd("~/GitHub/papers/URBE-2021")
   library(readr)
   rawdata <- read_csv2("raw data/BSS_LA_DataBase.csv")
   View(rawdata)
   str(rawdata)
   clean_names(rawdata)
   
   rawdata[93:95,1]
  
   #Step 3: Data Munging and  Exploratory Data Analysis 
          
   bss <-  rawdata %>% 
   dplyr:: select(Name_System=System, Country, Population=Population1, System_Type=Type, Operator_Type=Operator, Sponsor_Type=Sponsor, Transit_Integration=`Transit Integration`, Fee=Fees) 
   DescTools:: PlotMiss(bss, col= colorRampPalette(c("gray10","gray90")) (1))               
          
   Name_System_rev <- bss %>%  
   pull(Name_System) %>%
   recode ("Loop Bikes"="Loop Bike") %>%
   as.vector ()  
 
   Name_System_rev <-  Name_System_rev[1:92]
             
   
   Country_rev <- bss %>%  
   pull(Country) %>%
   recode ("Brasil"="Brazil", "México"="Mexico") %>% 
   na.omit()%>%   
   as.factor() 
   ggplot2:: qplot(Country_rev)           
         
            
            
            
            Countries_Group_rev <- c("Others",  "Argentina","Brazil",   "Others",   "Brazil",   "Brazil",   "Brazil",   "Colombia", "Colombia", "Colombia", "Colombia", "Colombia", "Colombia", 
                                     "Others",  "Colombia", "Mexico",   "Mexico",   "Others",   "Colombia", "Argentina","Argentina","Brazil",   "Brazil",   "Brazil",   "Brazil",   "Brazil",   
                                     "Brazil",  "Brazil",   "Brazil",   "Brazil",   "Brazil",   "Brazil",   "Brazil",   "Others",   "Brazil",   "Colombia", "Others",   "Brazil",   "Others",   
                                     "Mexico",  "Mexico",   "Brazil",   "Argentina","Colombia", "Brazil",   "Brazil",   "Others",   "Mexico",   "Brazil",   "Mexico",   "Argentina","Brazil",   
                                     "Brazil",  "Brazil",   "Brazil",   "Colombia", "Colombia", "Colombia", "Mexico",   "Argentina","Brazil",   "Others",   "Mexico",   "Mexico",   "Mexico",   
                                     "Colombia","Others",   "Mexico",   "Brazil",   "Colombia", "Colombia", "Mexico",   "Mexico",   "Brazil",   "Brazil",   "Argentina","Brazil",   "Mexico",   
                                     "Colombia","Mexico",   "Colombia", "Brazil",   "Brazil",   "Brazil",   "Brazil",    "Brazil",  "Brazil",   "Brazil",   "Brazil",   "Brazil",   "Brazil",  
                                     "Brazil"   )  %>% 
                                      as.factor()
            
    
            System_Type_rev <- bss %>% 
            pull (System_Type) %>% 
            recode("Dock based"="Dock Based") %>%
            na.omit()%>%   
            as.factor()
            ggplot2:: qplot(System_Type_rev)
            
            #Step 3.1: creating a new variable to group population size by classes 
 
            Population_rev <- c(">500k=<1Mi inhab", ">1Mi inhab", ">100k=<250k inhab",">1Mi inhab",">1Mi inhab",">1Mi inhab",">1Mi inhab", ">50k=<100k inhab",  
                                ">100k=<250k inhab",">500k=<1Mi inhab","<=50k inhab",">100k=<250k inhab",">1Mi inhab",">500k=<1Mi inhab", ">1Mi inhab",">1Mi inhab",       
                                ">100k=<250k inhab", ">1Mi inhab",">100k=<250k inhab",">50k=<100k inhab",">100k=<250k inhab",">1Mi inhab",">1Mi inhab",">1Mi inhab",       
                                ">1Mi inhab",">1Mi inhab",">1Mi inhab",">1Mi inhab",">500k=<1Mi inhab",">250k=<500k inhab",">250k=<500k inhab",">250k=<500k inhab",
                                ">250k=<500k inhab",">1Mi inhab",      ">250k=<500k inhab",">250k=<500k inhab",">1Mi inhab",       ">1Mi inhab",       ">1Mi inhab", ">1Mi inhab",       
                                ">1Mi inhab",       ">100k=<250k inhab",">1Mi inhab",       ">1Mi inhab",       ">1Mi inhab",       ">1Mi inhab",       ">1Mi inhab", ">500k=<1Mi inhab", 
                                ">500k=<1Mi inhab", ">1Mi inhab",       ">100k=<250k inhab","<=50k inhab",     ">1Mi inhab",       ">1Mi inhab",       ">1Mi inhab", ">250k=<500k inhab",
                                ">250k=<500k inhab",">500k=<1Mi inhab", ">1Mi inhab",       ">1Mi inhab",       ">1Mi inhab",       ">1Mi inhab",       ">1Mi inhab", ">250k=<500k inhab",
                                ">250k=<500k inhab",">1Mi inhab",       ">250k=<500k inhab",">250k=<500k inhab",">100k=<250k inhab",">250k=<500k inhab",">250k=<500k inhab",">500k=<1Mi inhab", 
                                ">500k=<1Mi inhab", "<=50k inhab",      ">1Mi inhab",       ">500k=<1Mi inhab", ">500k=<1Mi inhab", ">1Mi inhab",       ">250k=<500k inhab",">500k=<1Mi inhab", 
                                ">250k=<500k inhab",">500k=<1Mi inhab", ">1Mi inhab",       ">1Mi inhab",       ">1Mi inhab",       ">1Mi inhab",       ">250k=<500k inhab",">1Mi inhab",       
                                ">100k=<250k inhab",">250k=<500k inhab",">250k=<500k inhab",">1Mi inhab") %>% 
                                as.factor()
            
            Population_rev <- factor(Population_rev, order=TRUE, 
                                      levels = c("<=50k inhab",">50k=<100k inhab",">100k=<250k inhab",">250k=<500k inhab",">500k=<1Mi inhab", ">1Mi inhab"))
            ggplot2:: qplot(Population_rev)   
            
            City_Pop_Group_rev <- c("500k-1000k","Over 1000k","100k-250k","Over 1000k","Over 1000k","Over 1000k","Over 1000k","Up to 100k","100k-250k", "500k-1000k","Up to 100k","100k-250k","Over 1000k","500k-1000k","Over 1000k","Over 1000k",
                                    "100k-250k","Over 1000k","100k-250k", "Up to 100k","100k-250k", "Over 1000k","Over 1000k","Over 1000k","Over 1000k","Over 1000k","Over 1000k","Over 1000k","500k-1000k","250k-500k","250k-500k","250k-500k", 
                                    "250k-500k","Over 1000k","250k-500k", "250k-500k","Over 1000k","Over 1000k","Over 1000k","Over 1000k","Over 1000k","100k-250k", "Over 1000k","Over 1000k","Over 1000k","Over 1000k", "Over 1000k","500k-1000k",
                                    "500k-1000k","Over 1000k","100k-250k","Up to 100k","Over 1000k","Over 1000k","Over 1000k","250k-500k","250k-500k","500k-1000k","Over 1000k","Over 1000k","Over 1000k","Over 1000k","Over 1000k","250k-500k", 
                                    "250k-500k","Over 1000k","250k-500k", "250k-500k","100k-250k","250k-500k","250k-500k","500k-1000k","500k-1000k","Up to 100k","Over 1000k","500k-1000k","500k-1000k","Over 1000k","250k-500k", "500k-1000k",
                                    "250k-500k","500k-1000k","Over 1000k","Over 1000k","Over 1000k","Over 1000k","250k-500k", "Over 1000k","100k-250k", "250k-500k","250k-500k","Over 1000k") %>% 
                                    as.factor()
            
            City_Pop_Group_rev <- factor(City_Pop_Group_rev, order=TRUE, 
                                         levels = c("Up to 100k","100k-250k","250k-500k","500k-1000k","Over 1000k"))
            ggplot2:: qplot(City_Pop_Group_rev)  
            
            #Step 3.2: transforms the original variables into a new variables  
            
            Operator_Type_rev <- c("Public", "Private","Public", "Private","Private","Private","Private","Public", "Public", "Public", "Public",
                                   "Public", "Private","Private","Private","Private","Private","Public", "Private","Public", "Public", "Private",
                                   "Private","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private",
                                   "Private","Private","Private","Public", "Private","Private","Private","Private","Public", "Public", "Private",
                                   "Private","Private","Public", "Public", "Private","Private","Private","Private","Private","Private","Private",
                                   "Private","Private","Private","Private","Public", "Private","Private","Private","Private","Private","Private",
                                   "Private","Public", "Private","Private","Public", "Private","Private","Private","Private","Public", "Private",
                                   "Private","Public", "Private","Public", "Private","Private","Private","Private","Private","Private","Private",
                                   "Private","Private","Private","Private") %>% 
                                    as.factor()
            
            SponsorSector_Group_rev <- c("Other","Financial","Government","Government","Other","Health",   
                                         "Government","Government","Government","Government","Government","Government",   
                                         "Other","Government", "Other","Government","Government","Government",    
                                         "Government", "Government", "Government", "Health", "Health", "Financial",    
                                         "Financial", "Financial", "Financial", "Financial", "Joint venture","Health",       
                                         "Financial",  "Other", "Health","Financial","Other","Government",
                                         "Government","Financial","Government", "Joint venture","Government","Other",        
                                         "Government",  "Government", "Health", "Health","Government",  "Government",   
                                         "Government",  "Joint venture","Government","Joint venture","Joint venture","Financial",    
                                         "Financial", "Government","Government","Government","Government","Government",   
                                         "Health",  "Joint venture","Joint venture","Government","Joint venture","Joint venture",
                                         "Financial","Government","Government","Other","Government","Government",   
                                         "Joint venture","Other","Financial","Government","Health","Other",        
                                         "Government","Joint venture","Government","Joint venture","Joint venture","Joint venture",
                                         "Joint venture","Joint venture","Joint venture","Joint venture","Joint venture","Joint venture",
                                         "Joint venture","Joint venture") %>% 
                                          as.factor()
            
            ggplot2:: qplot(SponsorSector_Group_rev)
            
            
            Transit_Integration_rev <-  c("Yes","Yes","Yes","No","Yes","Yes","Yes","Yes","Yes","No","Yes","Yes","No","No","Yes","No", "No","No","Yes","Yes","Yes","No","No","No", "No","No","Yes","Yes","No","Yes",
                                          "No", "No", "No", "No", "No", "Yes","Yes","No", "Yes","No", "Yes","Yes","Yes","Yes","No", "No", "No", "No", "Yes","No", "No", "No", "No", "No", "No", "Yes","Yes","Yes","Yes","Yes",
                                          "Yes","Yes","No", "No", "No", "No", "No", "No", "Yes","Yes","Yes","Yes", "Yes", "Yes","No", "Yes","No", "No", "Yes","No", "Yes","No", "No", "No", "No", "No", "No","No","No",  "No", 
                                          "No", "No") %>% 
                                          as.factor()  
            
            
             ggplot2:: qplot(Transit_Integration_rev)
            
          
            
            
            Fee_rev <- c("No",  "No",  "Yes", "Yes", "No",  "Yes", "Yes", "No",  "No",  "No",  "No",  "No",  "Yes", "Yes", "No","Yes", "Yes", "No", "No", "No", "No","Yes","Yes", "Yes",
                         "Yes","Yes","Yes", "Yes","Yes","Yes", "Yes","Yes","Yes", "Yes","Yes", "No","No", "No", "Yes", "Yes", "Yes", "No",  "No",  "No",  "Yes", "Yes", "Yes", "Yes",
                         "No",  "Yes", "Yes", "Yes", "Yes","Yes", "Yes", "No","No", "No", "Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","No","No","No","Yes",
                         "Yes","No","Yes","No", "No","Yes","No","Yes","No","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes", "Yes") %>%  
                        as.factor()
            
            ggplot2:: qplot(Fee_rev)
            
            
            #Step 3.3: adding the reviewed variables into a new dataset  
            bss_tidy_rev <- dplyr::data_frame(Name_System_rev, Country_rev, Countries_Group_rev, Population_rev, City_Pop_Group_rev, System_Type_rev, Operator_Type_rev, SponsorSector_Group_rev, Transit_Integration_rev, Fee_rev)
            
            #Step 3.4.: Descriptive Analysis of dataset
            annex_stat_a <- DescTools::Desc(bss_tidy_rev, digits=2, plotit = T)
            
            
            ## Method Of Analysis 
            
            #Step 4: Chi-Square Test of Independence (Pearson)
            ##Statistical hypotheses:
            ###Null hypothesis (H0): There is no significant difference between the observed and the expected value between pairs of analyzed variables.
            ###Alternative hypothesis (H1): There is a significant difference between the observed and the expected value between pairs of analyzed variables.
            
            
            #### printing the p-value (H0 = p-value > 0.05, H1 = p-value < 0.05)
            #### significance level (alpha = 0.05)
            #res$p.value
            
            X2_System_Type_Country <- DescTools::Desc(System_Type_rev~Country_rev, bss_tidy_rev, digits=2, plotit = T)
            X2_System_Type_Countries_Group <- DescTools::Desc(System_Type_rev~Countries_Group_rev, bss_tidy_rev, digits=2, plotit = T)
            X2_System_Type_Population <- DescTools::Desc(System_Type_rev~Population_rev, bss_tidy_rev, digits=2, plotit = T)
            X2_System_Type_City_Pop_Group <-  DescTools::Desc(System_Type_rev~City_Pop_Group_rev, bss_tidy_rev, digits=2, plotit = T)
            X2_System_Type_OpType <- DescTools::Desc(System_Type_rev~Operator_Type_rev, bss_tidy_rev, digits=2, plotit = T) 
            X2_System_Type_SponsorSector_Group <- DescTools::Desc(System_Type_rev~SponsorSector_Group_rev, bss_tidy_rev, digits=2, plotit = T) 
            X2_System_Type_Transit_Integration <- DescTools::Desc(System_Type_rev~Transit_Integration_rev, bss_tidy_rev, digits=2, plotit = T) 
            X2_System_Type_Fee <- DescTools::Desc(System_Type_rev~Fee_rev, bss_tidy_rev, digits=2, plotit = T) 
            
            X2_OpType_Countries_Group <- DescTools::Desc(Operator_Type_rev~Countries_Group_rev, bss_tidy_rev, digits=2, plotit = T)
            X2_OpType_City_Pop_Group <- DescTools::Desc(Operator_Type_rev~City_Pop_Group_rev, bss_tidy_rev, digits=2, plotit = T)
            X2_OpType_SponsorSector_Group <- DescTools::Desc(Operator_Type_rev~SponsorSector_Group_rev, bss_tidy_rev, digits=2, plotit = T)
            X2_OpType_Transit_Integration <- DescTools::Desc(Operator_Type_rev~Transit_Integration_rev, bss_tidy_rev, digits=2, plotit = T) 
            X2_OpType_Fee <- DescTools::Desc(Operator_Type_rev~Fee_rev, bss_tidy_rev, digits=2, plotit = T)
            
            X2_SponsorSector_Group_Countries_Group <- DescTools::Desc(SponsorSector_Group_rev~Countries_Group_rev, bss_tidy_rev, digits=2, plotit = T)
            X2_SponsorSector_City_Pop_Group <- DescTools::Desc(SponsorSector_Group_rev~City_Pop_Group_rev, bss_tidy_rev, digits=2, plotit = T)
            X2_SponsorSector_Transit_Integration <- DescTools::Desc(SponsorSector_Group_rev~Transit_Integration_rev, bss_tidy_rev, digits=2, plotit = T)
            X2_SponsorSector_Fee <- DescTools::Desc(SponsorSector_Group_rev~Fee_rev, bss_tidy_rev, digits=2, plotit = T)
            
            X2_Transit_Integration_Fee <- DescTools::Desc(Transit_Integration_rev~Fee_rev, bss_tidy_rev, digits=2, plotit = T)
            
           #Step 5: Chi_Square output dataset 
           dockbased_tidy_rev <- bss_tidy_rev %>% 
           select(Name_System_rev,Countries_Group_rev, City_Pop_Group_rev, System_Type_rev, Operator_Type_rev, SponsorSector_Group_rev, Transit_Integration_rev, Fee_rev) %>%  
           filter(System_Type_rev=="Dock Based")
           dockbased_tidy <-  dockbased_tidy_rev %>% select(Countries_Group_rev, City_Pop_Group_rev, Operator_Type_rev, SponsorSector_Group_rev, Transit_Integration_rev, Fee_rev)
            
            #Step 5.1.: Descriptive Analysis of Chi_Square output dataset 
            annex_stat_b <- DescTools::Desc(dockbased_tidy_rev, digits=2, plotit = T)
         
            
            #Step 6: Multiple Correspondence Analysis (MCA) input dataset
            mca_dockbased <- dockbased_tidy
            
            #Step 6.1.: Descriptive Analysis of dataset
            
            annex_stat_c <- DescTools::Desc(dockbased_tidy,digits=2, plotit = T)
            
            #Step 6.2.: MCA Analysis and Results
        
            res.mca_dockbased <- Factoshiny(mca_dockbased) 
            
            res.MCA<-MCA(mca_dockbased,graph=TRUE)
            plot.MCA(res.MCA, choix='var',col.var=c(1,2,3,4,5,6))
            plot.MCA(res.MCA,invisible= 'ind',col.var=c(1,1,1,1,1,2,2,2,2,2,3,3,4,4,4,4,4,5,5,6,6),label =c('var'))
                    
            res.MCA<-MCA(mca_dockbased,graph=TRUE)
            dimdesc(res.MCA) 
            res.MCA

         
            

   
   
  
  