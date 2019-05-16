## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width=8, 
  fig.height=6
)

## ----setup---------------------------------------------------------------
library(FinalProject)

## ------------------------------------------------------------------------
avg_per_state<-createMap(StateVsAvgCost, averageCost, "Average total cost", "Average cost of hospital procedures by state", scale_format = dollar)

num_discharges_heart<-createMap(StateVsNumHeartTransplants, numberOfDischarges, "Number of heart transplants", "Number of Heart Transplants by State",'To visualize the frequency of the most expensive procedure.')

total_discharges<-createMap(StateVsNumProcedures, numberOfDischarges, "Number of procedures", "Number of Procedures by State")


avg_per_state
num_discharges_heart
total_discharges

