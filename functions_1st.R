add2 <- function(x, y) {
  x + y
}

above10 <- function(x) {
  #use function will return a logical vector of trues and falses
  #to indicate which element of x is greater than 10
  use <- x > 10 
  #now I want to subset this vector of x with the logical use vector
  x[use]
  #now this function will return the subset of x that is greater than 10
  
}


# n in this case is free for the user to define
# however, if they do not define it then it will produce an error
above <- function(x, n) {
  use <- x > n
  x[use]
}

# You may want to allow the user to specify the number 
# as well as setting a default value if, say, 10 is a special number
# that is used often

above <- function(x, n = 10) {
  use <- x > n
  x[use]
}

# *** Now we want to look at a columnmean function for use with a matrix
# in this case we are calling the argument x, but you could call it whatever you 
# want. x is going to be a dataframe or a matrix
columnmean <- function(x) {
  #create a nc variable that calculates the number of columns in x
  nc <- ncol(x)
  #then you need to initialise a vector that will store the means for each column
  #call it means. it will be a numeric vecotr equal to the length of nc i.e.,
  #the number of columns.
  means <- numeric(nc)
  #it will be initially empty so we use a 'for' loop to go through each column
  #until all columns are complete. it creates an integer vector that starts at 1 and
  #ends at nc
  for(i in 1:nc) {
    #and get the mean of each column i.e. 'i'
    means[i] <- mean(x[, i])
  }
  #now you specify what you want returned. In this case that is the vector 
  #of means
  means
  
}

## * We want to remove the NA values. so add a couple of amendments
## add the removeNA feature to the argument of the function so
# that the user can specify if they want this on or not. We have made it TRUE by
# default
columnmean <- function(x, removeNA = TRUE) {
  nc <- ncol(x)

  means <- numeric(nc)

  for(i in 1:nc) {

    means[i] <- mean(x[, i], na.rm = removeNA)
  }

  means
  
}
