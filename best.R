## ----------------------------------------------------------------------------
## Coursera - R Programming
## Programming assignment 3
## 21-03-2021 Arly Berg
##
## contains functionality for selected the best hospital measured on mortality
## rates for a given outcome
## -- Load data (filename)
## -- get.data (x, index)
## ----------------------------------------------------------------------------

## -- source files
## ----------------------------------------------------------------------------
source("HospitalUtilities.R")

## -- definitions
## ----------------------------------------------------------------------------
outcomes <- c("heart attack", "heart failure", "pneumonia")

## ----------------------------------------------------------------------------
## best(state, outcome)
## input #1: abbreviated name for the state
## input #2: name of the outcome 
## output: a character vector - name of the hospital with the lowest mortality rate
## ----------------------------------------------------------------------------
best <- function(state, outcome) {
  ## Read outcome data
  hospital.raw <- hospital.load("outcome-of-care-measures.csv")  
  
  ## Check that state and outcome are valid
  
  ## Return hospital name in that state with lowest 30-day death
  
  ## rate
}