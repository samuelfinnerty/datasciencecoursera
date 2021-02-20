# The str() function tells you the structure of an object

## For example say I create a factor object with 40 levels, and 10 of each level

f <- gl(40, 10)

str(f) 

# this will tell me that it is a factor object with 40 levels, and 10 of each

library(datasets)
head(airquality)
str(airquality)

m <- matrix(rnorm(100), 10, 10)
str(m)

# If i split the airquality data by month, str(s) will tell me that s is a list
# of 5 data.frames (corresponding tothe 5 months), and report how many 
# observations of how many variables there are

s <- split(airquality, airquality$Month)
str(s)

###############################################################################

# Generating Random Numbers

  # rnorm - generate random Normal variates with a given mean and sd

  # dnorm - evaluate the Normal probability density (with given m/sd) at a point
  #         or a vector of points

  # pnorm - evaluate the cumulative distribution function for a Normal 
  #         distribution

  # rpois - generate random Poisson variates with a given rate


# Four functions associated with Probability distributions

  # d - density
  
  # r - random number generation

  # p - cumulative distribution

  # q - quantile function


# Lower and upper tail evaluation

  # When using pnorm and qnorm you can specify whether you want to evaluate 
  # the upper or lower tails. e.g. for lower.tail evaluation set the value to
  # true. For upper.tail evaluation set the lower.tail = FALSE

###############################################################################

# Pseudo-random numbers

## ** Always set the random seed number when conducting a simulation

set.seed(1)
rnorm(5)

# if i set the seed to be the same before each random simulation you will get
# the same 5 numbers
# setting the seed resets the generation and it will start again from the same
# place

###############################################################################

# Generating Poisson Data
# Poisson Data are integer

# With a poisson distribution the mean is roughly equal to the rate e.g. 1

  # Generate ten random poisson variables with a rate of 1
rpois(10, 1)

  # Generate ten random poisson variables with a rate of 2
rpois(10, 2)

  # Generate ten random poisson variables with a rate of 20
rpois(10, 20)

#######

# Cumulative Poisson distribution
  # what we are asking here is, what is the probability that the poisson var is
  # less than are equal to 2, when the rate is 2

ppois(2, 2) ## Pr(x <= 2)

ppois(4, 2) ## Pr(x <= 4)


################################################################################

# Generating Random Numbers From a Linear Model

  # say you want to simulate from the following linear model

# remember, y (outcome) = y intercept from slope.x + noise

set.seed(20)

# generate x, the predictor
x <- rnorm(100)
# epsilon is the random noise
e <- rnorm(100, 0, 2)
# generate the product, y
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)

  # say x is binary. Use rbinom to create a binomial distribution

set.seed(10)
# set x to be with a probability of 0.5 for each value
# n = 1, p = 0.5
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)

# the x value is binary, but the y value is continuous

################################################################################

# Generating Random Numbers from a Generalized Linear Model

  # Where Y ~ Poisson(u)
  # log u = B0 + B1 x
  # and B0 = 0.5 and B1 = 0.3 

# say we want to simulate some outcome data that are count variables
# rather than continous variables 
# the error distribution will thus not be normal

set.seed(1)
# predictor variable x
x <- rnorm(100)
# adding the intercept and slope coefficients * x
log.mu <- 0.5 + 0.3 * x
# to get the mean of our poisson random variable we need to exponentiate
# we simulate a 100 of these poisson random variables using rpois()
# and then we give it the exponential of our log mean 
y <- rpois(100, exp(log.mu))
summary(y)
plot(x, y)
# in the plot we can see that as x increase, the y count data increases,
# there is a linear relationship but it is still count data

################################################################################

# Random Sampling

  # sample function draws randomly from a specified set of scalar objects
  # allowing you to sample from arbitrary distributions.

set.seed(1)
sample(1:10, 4)
sample(letters, 5)
# if you give it a vector of numbers but don't specify which ones
# it will produce a permutation where all numbers in that vector are produced, 
# but in a random order
sample(1:10)
sample(1:10)
# when replace = TRUE is used it will print 10 numbers but will use some more 
# than once
sample(1:10, replace = TRUE)
# when you use replace you can ask it produce a random sample
# larger than the number of numbers contained in the vector
sample(1:10, 100, replace = TRUE)
