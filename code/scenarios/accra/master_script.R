rm (list = ls())
# Load packages
library(tidyverse)
library(haven)
library(plotly)
library(ReIns)

bs <- list()

dist <- list()

dur <- list()

mmets <- list()

pm_conc <- list()

RR_AP_calculations <- list()

pa_certainty <- T

RR_PA_calculations <- list()

RR_PA_AP_calculations <- list()

deaths_yll_injuries <- list()

deaths_by_mode <- list()

deaths <- list()

deaths_red <- list()

ylls <- list()

ylls_red <- list()

RSEED <- c(1:100)

MEAN_BUS_WALK_TIME <- 5

what_if_scenarios <- 2

PA_MULT <- c(1, 2)

for (INDEX in 1:what_if_scenarios){
  
  # Generate all scenarios
  source("code/scenarios/accra/scenarios.R")
  
  #MEAN_BUS_WALK_TIME <- MEAN_BUS_WALK_TIME + 2
  
  # Generate distance and duration matrices
  source("code/scenarios/accra/dist_dur_tbls.R")
  
  # Calculate total PA MMET
  source("code/PA/accra/total_mmet.R")
  
  # Calculate PM calculations
  source("code/pollution/accra/scenario_pm_calculations.R")
  
  # # Calculate RR 2.5
  source("code/health/accra/gen_ap_rr.R")
  
  # Calculate RR PA
  source("code/health/accra/gen_pa_rr.R")

  # Combine RR for PA and AP for common diseases
  source("code/health/accra/combined_rr_pa_pa.R")
  
  # # Calculate disease burden for injuries
  source("code/injuries/accra/accra_injuries.R")
  # 
  # # Calculate disease burden for AP, PA and Injuries
  source("code/health/accra/health_burden.R")
  
}

rm(list = setdiff(ls(), c("INDEX", "RSEED", "PA_MULT", "bs", "dist", "dur", "mmets", "pm_conc", 
                          "RR_AP_calculations", "RR_PA_calculations",
                          "RR_PA_AP_calculations", "deaths_by_mode",
                          "deaths_yll_injuries", "MEAN_BUS_WALK_TIME",
                          "deaths", "deaths_red", "ylls", "ylls_red",
                          "pa_certainty"))) 

# # COPY THE SAME OBJECTS FROM 1:5, TO 6:10
# 
# for (INDEX in 2:6){
#   bs[[INDEX]] <- bs[[INDEX - 1]]
#   dist[[INDEX]] <- dist[[INDEX - 1]]
#   dur[[INDEX]] <- dur[[INDEX - 1]]
#   mmets[[INDEX]] <- mmets[[INDEX - 1]]
#   pm_conc[[INDEX]] <- pm_conc[[INDEX - 1]]
#   RR_AP_calculations[[INDEX]] <- RR_AP_calculations[[INDEX - 1]]
#   RR_PA_calculations[[INDEX]] <- RR_PA_calculations[[INDEX - 1]]
#   RR_PA_AP_calculations[[INDEX]] <- RR_PA_AP_calculations[[INDEX - 1]]
#   
# }
# 
# for (INDEX in 2:6){
#   
#   # INDEX <- 6
#   # Calculate RR PA
#   source("code/health/accra/gen_pa_rr.R")
#   
#   # Combine RR for PA and AP for common diseases
#   source("code/health/accra/combined_rr_pa_pa.R")
#   
#   # # Calculate disease burden for injuries
#   source("code/injuries/accra/accra_injuries.R")
#   # 
#   # # Calculate disease burden for AP, PA and Injuries
#   source("code/health/accra/health_burden.R")
#   
# }
# 
# 
# rm(list = setdiff(ls(), c("INDEX", "RSEED",  "bs", "dist", "dur", "mmets", "pm_conc", 
#                           "RR_AP_calculations", "RR_PA_calculations",
#                           "RR_PA_AP_calculations", "deaths_by_mode",
#                           "deaths_yll_injuries", "MEAN_BUS_WALK_TIME",
#                           "deaths", "deaths_red", "ylls", "ylls_red",
#                           "pa_certainty"))) 
