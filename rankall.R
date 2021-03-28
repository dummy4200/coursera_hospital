## ----------------------------------------------------------------------------
## Coursera - R Programming
## Programming assignment 3
## 21-03-2021 Arly Berg
##
## contains functionality for ranking hospitals in a specific state
## 
## ----------------------------------------------------------------------------

## -- source files
## ----------------------------------------------------------------------------
source("HospitalUtilities.R")

## ----------------------------------------------------------------------------
## select the index to be used final selection
## input 1: the dataset to be used
## input 2: the rank definitio to be used ("best", "worst" or numerical index)
## output : a numeric index to the row selected as valid
## ----------------------------------------------------------------------------
get.rank <- function(x, rt){
  local.index = 0
  if (rt  == "best"){
    local.index = 1
  }
  else if (rt == "worst"){
    local.index = nrow(x)
  } else{
    local.index <- as.integer(rt)
  }
  return (local.index)
}


rankall <- function(outcome, num = "best"){
  ## Check that outcome are valid
  if (!outcome %in% outcomes){
    stop("Not a valid outcome")
  }
  
  ## Read outcome data (from HospitalUitilies.R)
  ## checked for valid outcome
  hospital.raw <- hospital.load("outcome-of-care-measures.csv")  
  index <- col.index[match(outcome,outcomes)]
  hospital.values <- get.data(hospital.raw, index, clean = T)
  
  ## For each state, find the hospital of the given rank
  hospital.split <- split(hospital.values, interaction(hospital.values$State))
  
  ## Declare analytics variables
  minima <- data.frame()
  resultat = data.frame()[0,3]
  
  for (st in hospital.split){
    index <- get.rank(st, num)
    st.ordered <- st[order(st[[3]]),]
    
    if (index <= nrow(st)){
      value <- st.ordered[index, ]
    }else{
      value <- st.ordered[1, ]
      value$Hospital.Name <- NA
    }
    
    resultat <- rbind(resultat, value)
  }
  
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  resultat.selected <- resultat[c("Hospital.Name", "State")]
  return (resultat.selected)
}

## ----------------------------------------------------------------------------
## Test section
## ----------------------------------------------------------------------------

## 'best' cases

print(rankall("heart attack"))
print("## --------------------------------------------------------------------------")

print(rankall("heart failure"))
print("## --------------------------------------------------------------------------")


print(rankall("pneumonia"))
print("## --------------------------------------------------------------------------")


## 'worst' cases

print(rankall("heart attack", "worst"))
print("## --------------------------------------------------------------------------")

print(rankall("heart failure", "worst"))
print("## --------------------------------------------------------------------------")


print(rankall("pneumonia", "worst"))
print("## --------------------------------------------------------------------------")


## 'index' cases

print(rankall("heart attack", 50))
print("## --------------------------------------------------------------------------")

print(rankall("heart failure", 50))
print("## --------------------------------------------------------------------------")

print(rankall("pneumonia", 50))
print("## --------------------------------------------------------------------------")


## validity

print(rankall("neumonia"))
print("## --------------------------------------------------------------------------")

