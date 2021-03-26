source("HospitalUtilities.R")

hospital.data.raw <- hospital.load("outcome-of-care-measures.csv")
hospital.data.cleaned <- get.data(hospital.data.raw, dataset.heart.attack)

rates.state <- hospital.data.cleaned[hospital.data.cleaned$State == "AZ",]

rates.ordered <- order(rates.state[,3])
plot(rates.ordered)