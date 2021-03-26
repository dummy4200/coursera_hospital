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
  ## Check that state and outcome are valid
  if (!state %in% state.abb){
    stop("Not a valid state")
  }
  
  if (!outcome %in% outcomes){
    stop("Not a valid outcome")
  }
  
  ## Read outcome data
  hospital.raw <- hospital.load("outcome-of-care-measures.csv")  
  index <- col.index[match(outcome,outcomes)]
  hospital.values <- get.data(hospital.raw, index)
  hospital.selected <- hospital.values[hospital.values$State == state,]
  
  ## Return hospital name in that state with lowest 30-day death
  return (hospital.selected[which.min(hospital.selected[,3]),]$Hospital.Name)
  ## rate
}

