hospital.raw <- hospital.load("outcome-of-care-measures.csv")  

hospital.aggr <- by(hospital.raw, hospital.raw$State, function(x) x[which.min(x$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure), ] )
print (hospital.aggr)
print("## --------------------------------------------------------------------------")
