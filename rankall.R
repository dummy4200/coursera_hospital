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
  
  ## Read outcome data
  hospital.raw <- hospital.load("outcome-of-care-measures.csv")  
  index <- col.index[match(outcome,outcomes)]
  hospital.values <- get.data(hospital.raw, index, clean = T)
  
  ## For each state, find the hospital of the given rank
  hospital.split <- split(hospital.values, interaction(hospital.values$State))
  
  minima <- data.frame()
  resultat = data.frame()[0,3]
  
  for (st in hospital.split){
    index <- get.rank(st, num)
    
    if (index <= nrow(st)){
      st.ordered <- st[order(st[[3]]),]
      value <- st.ordered[index, ]
    }else{
      st.ordered <- st[order(st[[3]]),]
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



print(rankall("heart attack"))
print("## --------------------------------------------------------------------------")

print(rankall("heart failure"))
print("## --------------------------------------------------------------------------")


print(rankall("pneumonia"))
print("## --------------------------------------------------------------------------")




print(rankall("heart attack", "worst"))
print("## --------------------------------------------------------------------------")

print(rankall("heart failure", "worst"))
print("## --------------------------------------------------------------------------")


print(rankall("pneumonia", "worst"))
print("## --------------------------------------------------------------------------")




print(rankall("heart attack", 50))
print("## --------------------------------------------------------------------------")

print(rankall("heart failure", 50))
print("## --------------------------------------------------------------------------")

print(rankall("pneumonia", 50))
print("## --------------------------------------------------------------------------")


print(rankall("neumonia"))
print("## --------------------------------------------------------------------------")

