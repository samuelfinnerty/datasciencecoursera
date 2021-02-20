# source https://rpubs.com/skycrater/180352

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

################################################################################

best <- function(state, outcome){
  library(dplyr)
  ## Read outcome data
  outcomeData <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  bestHospital <- NULL
  rate <- NULL
  
  ## Function for heart attack
  inHeartAttack <- function(s, x){
    x <- select(x, State, Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    filtered <- x[x$State==s & x$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack != 'Not Available' ,c("Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")]
    
    ## Sort by Hospital name
    sortedData <- arrange(filtered, Hospital.Name)
    
    ## Sort by Rate
    sortedData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack <- as.numeric(sortedData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    sortedData <- arrange(sortedData, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    
    ## Return hospital name in that state with lowest 30-day death
    bestHosp <- sortedData
    
  }
  
  ## Function for heart failure
  inHeartFailure <- function(s, x){
    x <- select(x, State, Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    filtered <- x[x$State==s & x$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure != 'Not Available' ,c("Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")]
    
    ## Sort by Hospital name
    sortedData <- arrange(filtered, Hospital.Name)
    
    ## Sort by Rate
    sortedData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure <- as.numeric(sortedData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    sortedData <- arrange(sortedData, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    
    ## Return hospital name in that state with lowest 30-day death
    bestHosp <- sortedData
    
  }
  
  ## Function for pneumonia
  inPneumonia <- function(s, x){
    x <- select(x, State, Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    filtered <- x[x$State==s & x$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia != 'Not Available' ,c("Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
    
    ## Sort by Hospital name
    sortedData <- arrange(filtered, Hospital.Name)
    
    ## Sort by Rate
    sortedData$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia <- as.numeric(sortedData$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    sortedData <- arrange(sortedData, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    
    ## Return hospital name in that state with lowest 30-day death
    bestHosp <- sortedData
    
  }
  
  ## Main
  ## Check that outcome is valid
  if (outcome == "heart attack"){
    ## Check that state is valid
    if (length(outcomeData[outcomeData$State == state,c("State")])>0){
      bh <- inHeartAttack(state, outcomeData)
      bestHospital <- bh[1,c("Hospital.Name")]
      rate <- bh[1,2]
    } else{
      print(paste("Error in best(", state, ", ", outcome,") : invalid state", sep=""))
    }
  } else if (outcome == "heart failure"){
    ## Check that state is valid
    if (length(outcomeData[outcomeData$State == state,c("State")])>0){
      bh <- inHeartFailure(state, outcomeData)
      bestHospital <- bh[1,c("Hospital.Name")]
      rate <- bh[1,2]
      
    } else{
      print(paste("Error in best(", state, ", ", outcome,") : invalid state", sep=""))
    }
  } else if (outcome == "pneumonia"){
    ## Check that state is valid
    if (length(outcomeData[outcomeData$State == state,c("State")])>0){
      bh <- inPneumonia(state, outcomeData)
      bestHospital <- bh[1,c("Hospital.Name")]
      rate <- bh[1,2]
    } else{
      print(paste("Error in best(", state, ", ", outcome,") : invalid state", sep=""))
    }
  } else{
    print(paste("Error in best(", state, ", ", outcome,") : invalid outcome", sep=""))
  }
  
  bestHospital
}

################################################################################

rankhospital <- function(state, outcome, num = "best"){
  library(dplyr)
  ## Read outcome data
  outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  hospital <- NULL
  rate <- NULL
  range <- NULL
  
  ## Function for heart attack
  inHeartAttack <- function(s, x){
    x <- select(x, State, Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    filtered <- x[x$State==s & x$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack != 'Not Available' ,c("Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")]
    
    ## Sort by Hospital name
    sortedData <- arrange(filtered, Hospital.Name)
    
    ## Sort by Rate
    sortedData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack <- as.numeric(sortedData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    sortedData <- arrange(sortedData, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    
    ## Return hospital name in that state with lowest 30-day death
    bestHosp <- sortedData
    
  }
  
  ## Function for heart failure
  inHeartFailure <- function(s, x){
    x <- select(x, State, Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    filtered <- x[x$State==s & x$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure != 'Not Available' ,c("Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")]
    
    ## Sort by Hospital name
    sortedData <- arrange(filtered, Hospital.Name)
    
    ## Sort by Rate
    sortedData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure <- as.numeric(sortedData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    sortedData <- arrange(sortedData, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    
    ## Return hospital name in that state with lowest 30-day death
    bestHosp <- sortedData
    
  }
  
  ## Function for pneumonia
  inPneumonia <- function(s, x){
    x <- select(x, State, Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    filtered <- x[x$State==s & x$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia != 'Not Available' ,c("Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
    
    ## Sort by Hospital name
    sortedData <- arrange(filtered, Hospital.Name)
    
    ## Sort by Rate
    sortedData$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia <- as.numeric(sortedData$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    sortedData <- arrange(sortedData, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    
    ## Return hospital name in that state with lowest 30-day death
    bestHosp <- sortedData
    
  }
  
  ## Finalize Result
  getHospital <- function(ds, range){
    if (range == "best")
      ds[1, ]
    else if (range == "worst")
      ds[nrow(ds),]
    else if (is.numeric(range))
      ds[range,]
  }
  
  ## Main
  ## Check that outcome is valid
  if (outcome == "heart attack"){
    ## Check that state is valid
    if (length(outcomeData[outcomeData$State == state,c("State")])>0){
      bh <- inHeartAttack(state, outcomeData)
      bh <- getHospital(bh, num)
      hospital <- bh[,c("Hospital.Name")]
      rate <- bh[,2]
    } else{
      hospital <- paste("Error in best(", state, ", ", outcome,") : invalid state", sep="")
    }
  } else if (outcome == "heart failure"){
    ## Check that state is valid
    if (length(outcomeData[outcomeData$State == state,c("State")])>0){
      bh <- inHeartFailure(state, outcomeData)
      bh <- getHospital(bh, num)
      hospital <- bh[,c("Hospital.Name")]
      rate <- bh[,2]
    } else{
      hospital <- paste("Error in best(", state, ", ", outcome,") : invalid state", sep="")
    }
  } else if (outcome == "pneumonia"){
    ## Check that state is valid
    if (length(outcomeData[outcomeData$State == state,c("State")])>0){
      bh <- inPneumonia(state, outcomeData)
      bh <- getHospital(bh, num)
      hospital <- bh[,c("Hospital.Name")]
      rate <- bh[,2]
    } else{
      hospital <- paste("Error in best(", state, ", ", outcome,") : invalid state", sep="")
    }
  } else{
    hospital <- paste("Error in best(", state, ", ", outcome,") : invalid outcome", sep="")
  }
  hospital
}

################################################################################

rankall <- function(outcome, num = "best"){
  ## Re-use rankhospital.R
  ##source("rankhospital.R")
  ## Read outcome data
  states <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  states <- unique(select(states, State))
  states <- arrange(states,State)
  ctr <- 1
  end <- nrow(states)
  dataset <- data.frame("hospital"=character(0),"state"=character(0))
  
  while (ctr <= end){
    rh <- rankhospital(states[ctr,], outcome, num)
    
    if (length(rh[1]) == 0){
      rh <- "NA"
    }
    newDataSet <- data.frame("hospital" = rh[1], "state" = states[ctr,])
    dataset <- rbind(dataset, newDataSet)
    ctr <- ctr + 1
  }
  
  dataset
  
}

best("SC", "heart attack")

