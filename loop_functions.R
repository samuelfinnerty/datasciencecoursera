# Apply() function

  # Create a matrix of 200 random numbers with 20 rows and 10 columns
x <- matrix(rnorm(200), 20, 10)

  # use apply() to calculate the means for each column. call it by specifying 2,
  # which will collapse all the rows but preserve the columns 
  # same as function colMeans()

apply(x, 2, mean)

  # or 1 which will collapse all the columns but preserve all the rows
  # same as rowMeans()

apply(x, 1, mean)

apply(x, 1, sum)


  # apply to calculate the quantiles of rows of a matrix
apply(x, 1, quantile, probs = c(0.25, 0.75))

  # apply to calculate the quantiles of columns of a matrix
apply(x, 2, quantile, probs = c(0.25, 0.75))

################################################################################ 

## M apply - applies a function in parallel over a set of arguments

  # first create a function that creates a rnorm object with a specified number,
  # mean & sd

noise <- function(n, mean, sd) {
  rnorm(n, mean, sd)
}

noise(5, 1, 2)

  # say you now want to create multiple vectors e.g. 5, with random variables
  # between 1 and 5, with corresponding means from 1 - 5 with means 1:5,
  # with a fixed sd = 2. use mapply()

  ### **** this is a way of vectorising a function that does not allow for 
  ### **** vector arguments

mapply(noise, 1:5, 1:5, 2)
      # this creates a list of random variables, the first with one random num
      # with a mean of 1, the second with 2 numbers with a mean of 2,
      # the third with 3numbers with a mean of 3 and so on/. 
      # *** this is the same as typing the following

list(noise(1, 2, 3), noise(2, 2, 2), 
     noise(3, 3, 2), noise(4, 4, 2),
     noise( 5, 5, 2))

      # this next example produces something similar to above but instead
      # takes nums 1 - 6, recycles the mean 1, 2, then 1, 2, with a very
      # low sd

mapply(noise, 1:6, 1:2, 0.000001)

################################################################################

# tapply() is sued to apply a function over subsets of a vector

  # vector of length 30 with 10 normals, 10 uniforms, 10 normals that have a mean 
  # of 1
x <- c(rnorm(10), runif(10), rnorm(10))


  # create a factor variable with 3 levels and each level is going to be repeated 
  # 10 times
f <- gl(3, 10)

  # Now you can tapply on x, pass it the factor variable f, and then the mean
  # function which will calculate the mean of each group of numbers 
tapply(x, f, mean)

  # if you don't simplify the result you get this, a list with 3 elements in a 
  # list
tapply(x, f, mean, simplify = FALSE)

  # You can use the t function to apply the range function too
  tapply(x, f, range)
  
################################################################################

# split() takes a vectore or other objects and splits it into groups determined
#by a factor or list of factors. 

# split produces a list taking a vector and applying levels of a factor e.g. f


split(x, f)


  # *** Common practice is to split then use lapply()

lapply(split(x, f), mean)

  # Calculate mean within each month

library(datasets)
library(tidyverse)
head(airquality)

lapply(split(airquality, airquality$Month), colMeans(x[ , c("Ozone", "Solar.R", "Wind")]))

air_qual_by_month <- airquality %>%
  split(airquality, airquality$Month) %>%
  lapply(function(x) colMeans(x[ , c("Ozone", "Solar.R", "Wind")]))

# Create a split object

s <-  split(airquality, airquality$Month)

# Use lapply with split object to pull out column means by month for ozone, 
# solar, and wind

lapply(s, function(x) colMeans(x[ , c("Ozone", "Solar.R", "Wind")]))

# you can instead use s apply which will instead produce a matrix with the 
# values 3 rows, 5 columns

sapply(s, function(x) colMeans(x[ , c("Ozone", "Solar.R", "Wind")],
                               na.rm = TRUE))

# sometimes you want to split on more than one level. e.g. both gender, and 
# ethnicity

x <- rnorm(10)

# factor with two levels, each repeated five times
f1 <- gl(2, 5)

# factors with 5 levels, each repeated 2 times 
f2 <- gl(5, 2)

# then use the interaction function to combine the two grouping factors together 
interaction(f1, f2)

# now we can split our numeric vector x on different factors
# you don't have to use the interaction function, instead you can pass x a list
# of the two grouping factors. It will automatically call the interaction 
# function
split(x, list(f1, f2))

# the above will produce a list with empty functions. You can remove these using
# the drop function
str(split(x, list(f1, f2), drop = TRUE))

################################################################################

# str() compactly displays the structure of an arbitrary R object
