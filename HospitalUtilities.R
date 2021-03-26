## ----------------------------------------------------------------------------
## Coursera - R Programming
## Programming assignment 3
## 21-03-2021 Arly Berg
## ----------------------------------------------------------------------------

## ----------------------------------------------------------------------------
## This file contains various utilities for the assigment
## -- Load data (filename)
## -- get.data (x, index)
## ----------------------------------------------------------------------------


## -- Constants and global variables
## ----------------------------------------------------------------------------

directory.data <- "data.hospital"
directory.care.measures <- "outcome-of-care-measures.csv"
directory.care.hospital <- "hospital-data.csv"


## -- Basic configuration
## ----------------------------------------------------------------------------

# working directory
setwd("D:/R repositories/Coursera/Programming assignments/Hospital data")

# column selections
col.index <- c(11,17,23)
col.names <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
               "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", 
               "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")

# column index
dataset.heart.attack <- 11
dataset.heart.failures <- 17
dataset.peneumonia <- 23


## hospital.load
## input #1: thename of the .csv file to be loaded
## output: the 'raw' dataframe 
## ----------------------------------------------------------------------------
hospital.load <- function(filename){
  filepath <- paste(directory.data, filename, sep="/")
  
  values.read <- read.csv(filepath, colClasses = "character")
  return (values.read)
}

hospital.setcols <- function(index){
  
}

## get.data
## input #1: dataframe containing the initial dataset
## input #2: index of the column to use (11, 17 or 23)
## output: a dataset containing a dataset with State, Hospital name an rates without N/a
## ----------------------------------------------------------------------------
get.data <- function (x, index){
  cols = c("State", "Hospital.Name", col.names[match(index, col.index)])
  values.selected <- x[cols]
  values.selected[,3] <- as.numeric(values.selected[,3])
  values.cleaned <- complete.cases(values.selected)
  return (values.selected[values.cleaned,])  
}


