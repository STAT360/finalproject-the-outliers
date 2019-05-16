## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup---------------------------------------------------------------
library(FinalProject)

## ------------------------------------------------------------------------

  SurgeryData <- read_excel("../inst/extdata/Medicare_Provider_Charge_Inpatient_DRGALL_FY2014 (1).xlsx", skip = 5)


## ------------------------------------------------------------------------
  
  ### Make dataset for state vs. average cost of hospital visit  
  SurgeryData %>% 
    group_by(`Provider State`) %>%
    summarise(averageCost = mean(`Average Total Payments`)) %>% 
    arrange(desc(averageCost)) %>% 
    mutate(StateName = tolower(abbr2state(`Provider State`))) -> StateVsAvgCost

## ------------------------------------------------------------------------
  
  ### Steps to find most expensive procedure
  SurgeryData %>% 
    group_by(`DRG Definition`) %>% 
    summarise(averageCost = mean(`Average Total Payments`)) %>% 
    arrange(desc(averageCost))

## ------------------------------------------------------------------------
  ### Make dataset for State vs. number of heart transplants w/ complications (the most expensive procedure)
  SurgeryData %>% 
    group_by(`Provider State`) %>% 
    filter(`DRG Definition` == "001 - HEART TRANSPLANT OR IMPLANT OF HEART ASSIST SYSTEM W MCC") %>% 
    summarise(numberOfDischarges = sum(`Total Discharges`)) %>% 
    arrange(desc(numberOfDischarges)) %>% 
    mutate(StateName = tolower(abbr2state(`Provider State`))) -> StateVsNumHeartTransplants

## ------------------------------------------------------------------------
  ### Make dataset for State vs. total number of procedures.
  SurgeryData %>% 
    group_by(`Provider State`) %>%
    summarise(numberOfDischarges = sum(`Total Discharges`)) %>% 
    arrange(desc(numberOfDischarges)) %>% 
    mutate(StateName = tolower(abbr2state(`Provider State`))) -> StateVsNumProcedures

