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
## rankhospital(state, outcome, num)
## input #1: abbreviated name for the state
## input #2: name of the outcome 
## input #3; the wanted rank ("best", "worst" or a index for a given rank)
## output: a character vector - name of the hospital with the lowest mortality rate
## errors: index > length(dataset) reports and error
## ----------------------------------------------------------------------------
rankhospital <- function(state, outcome, num = "best") {
  
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
  
  ## Return hospital name in that state with the given rank 30-day death rate
  rates.colname <- col.names[match(outcome,outcomes)]
  sorting.vector <- c(rates.colname, "Hospital.Name")
  # set index for outcome rate
  hospital.orderByIndex <- hospital.selected[order(
    hospital.selected[,3], 
    hospital.selected[,2]
  ),]
  
  if (num == "best")
  {
    myrow <- head(hospital.orderByIndex, 1)
    return (myrow$Hospital.Name)
  }
  
  if (num == "worst") {
    myrow <- tail(hospital.orderByIndex, 1)
    return (myrow$Hospital.Name)
  }
  
  index <- as.integer(num)
  if (! is.na(index) ) {
    numRows <- nrow(hospital.orderByIndex)
    if (index > nrow(hospital.orderByIndex)) {
        stop("index is out of range")
      }
      return(hospital.orderByIndex[num,]$Hospital.Name)<cx   
    }
    
  stop("num is neither 'best', 'worst' or numeric")
}

result <- rankhospital("TX", "heart attack")
print(result)

result <- rankhospital("TX", "heart attack", num = "worst")
print(result)

result <- rankhospital("TX", "heart attack", num = 100)
print(result)

#result <- rankhospital("TX", "heart attack", num = "gg")
#print(result)

result <- rankhospital("TX", "heart attack", num = 25000)
print(result)
