## ----------------------------------------------------------------------------
## Coursera - R Programming
## Programming assignment 3
## 21-03-2021 Arly Berg
## ----------------------------------------------------------------------------

## ----------------------------------------------------------------------------
## This file contains functions for plotting the rates for spicific state
## -- Load data (filename)
## -- get.data (x, index)
## ----------------------------------------------------------------------------


source("HospitalUtilities.R")

hospital.state <- function(state, rate = dataset.heart.attack, ordered = F){
  
  # load data
  hospital.data.raw <- hospital.load("outcome-of-care-measures.csv")
  hospital.data.cleaned <- get.data(hospital.data.raw, rate)
  
  rates.state <- hospital.data.cleaned[hospital.data.cleaned$State == state,]
  
  if (ordered == T){
    rates.state <- rates.state[order(rates.state[,3]),]
  } 

  return(rates.state)  
}


plot(hospital.state("TX", rate = dataset.heart.failures, ordered = T)[,3])