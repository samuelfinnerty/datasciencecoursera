# Subsetting objects in R

## Simple character vector called X
x <- c("a", "b", "c", "d", "a")

x[1]
x[1:4]

##logical index
x[x > "a"]
u <- x > "a"
u
x[u]

# Subsetting Lists
x <- list(foo = 1:4, bar = 0.6)
x
## both of the following give the same answer - gives a list
x[1]
x$foo
## however using the [[]] will give only the output rather than a list
x[[1]]

## you will see it here. the following gives a list including the bar name
x["bar"]

## while the following only gives the output
x[["bar"]]

# If you want to extract multiple elements of a list you must
# use the [] command. This will print the specified list items

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 2, 3)]

## Another reason why the [[ ]] is useful is where a name is..
## actually the result of a computation and thus cannot be targeted using the $

x <- list(dundalk = 1:4, anger = 0.7, mood = "shite")
name <- "dundalk"
x[[name]]


##x$name will produce a Null result as it is a computed index
x$name

##but x$dundalk will work as it does exist
x$dundalk

# Subsetting nested elements of a list
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
## now say you're interested in pulling out the third data point in "a"
## you need to pick the first list "a" - 1, then the third part "3"
x[[c(1, 3)]]

#Subsetting matrices
x <- matrix(1:6, 2, 3)
x[1, 2]

## you can also simply pick a row or a column as such
x[1,]
## or 
x[,2]

## by So by default when a single element of a matrix is retrieved, 
## is returned to vector of length one, rather than a one by one matrix.
## This behaviour can be turned off by setting drop = FALSE
x<- matrix(1:6, 2, 3)
x[1, 2]
x[1,2, drop = FALSE]
x[1,]
x[1, , drop = FALSE]

#Partial Matching
x <- list(aardvark = 1:5)
x$a
# The dollar sign looks for the column that matches the letter a

##However the double bracket expects an exact answer
x[["a"]]
##But you can change this if you want 
x[["a", exact = FALSE]]

#Removing NA values 
x <- c(1, 2, NA, 4, NA, 5)
##bad is a logical vector
bad <- is.na(x)
bad
x[!bad]
x

##What if there are multiple things and you want to take...
## the subset with no missing values
x <- c(1,2,NA,4,NA,5)
y <- c("a","b", NA, "d", NA, "f")
### so we want to create logical vector which tells you
### where both are complete
x[good]
y[good]

## let's do this again a little differently. This time there are #
## some instances where there is a value for x, but none for y, and vice versa
##what it should do is only print those values where there is a value for 
## both x and y. And look, it works
x <- c(1, 5, NA, 6, NA)
y <- c("b", NA, "c", "f", "g")
good <- complete.cases(x, y)
good
x[good]
y[good]

# Using complete.cases to remove NA values
#first of all we just want rows 1 - 6. So we specify this doing the following
airquality[1:6,]
## if we use 1:6 without the comma it will actually take columns 1:6 and print
## every row

## now let's remove the NA values
## create complet cases vector

good <- complete.cases(airquality)
good

### Now let's specify rows 1:6, only where there are complete cases
airquality[good, ][1:6,]

#again if you fail to include the comma, it will print all rows
airquality[good, ][1:6]


#Vectorised Operations
## Many operations in R are vectorised, making code more efficient
## concise, and easier to read
## e.g. say you want to specify a string of values for x, and a 
## string of values for y. do the following. 
x<- 1:4; y <- 6:9
## now say you want to add each x to each y, all you have to do is the following
x + y
## each single of x will be added to each single value of y. in parallel

## Now we can use logical operators to check which values in a vector are say
## greater than 2, or greater than or equal to 2
x > 2
x >=2



#Vectorized Matrix Operations
x<- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)

## Two ways to multiply matrices by one another
### Element-wise multiplication
x * y

### Element-wise division

x / y 

### True matrix multiplication
x %*% y



#Quiz commands 

dat <- read.csv("hw1_data.csv")

## column names

head(dat)
# or
colnames(dat)


## Number of rows
nrow(dat)

## Extract first two rows

dat[1:2, ]

## Extact last two rows

dat[152:153, ]

## Extract first two columns

dat[, 1:2]

## Extract first two rows & first 3 columns

dat[1:2, 1:3 ]

## Extract last two rows and 3 columns

dat[152:153, 4:6]

## Want to know the Ozone value in the 47th row
dat[47, "Ozone"]
# or 
dat[47, 1]

## Count missing values

length(which(is.na(dat$Ozone)))

### or 

colSums(is.na(dat))
### this will give na's for each column in dataset

### or

sapply(dat, function(Ozone) sum(is.na(Ozone)))
count

## Mean of Ozone
mean_ozone <- mean(dat$Ozone, na.rm = TRUE)


# or 

## do the following
complete <- complete.cases(dat)
dat2 <- dat[complete, ]
mean(dat2$Ozone)



## Extract subset of rows where Ozone is > 31, and temp is > 90


## Extract subset of rows where Ozone is > 31, and temp is > 90

### create logical vectors for ozone > 31, and temp > 90

dat_ozone_31 <- dat$Ozone > 31
dat_temp_90 <- dat$Temp > 90


dat_31 <- dat[dat_ozone_31, ]
dat_31_90 <- dat_31[dat_temp_90, ]

mean(dat_31_90$Solar.R, na.rm = TRUE)

dat_31_90_complete <- complete.cases(dat_31_90)
dat_complete_yup <- dat_31_90[dat_31_90_complete, ]
mean(dat_complete_yup$Solar.R)


# Mean Temp when month = 6
month_6 <- dat$Month == "6"

dat_month_6 <- dat[month_6,]

mean(dat_month_6$Temp, na.rm = TRUE)

## or the following 

temp_complete <- complete.cases(dat_month_6$Temp)
dat_month_6_temp <- dat_month_6[temp_complete,]
mean(dat_month_6_temp$Temp)

# Max value when month = 5 

month_5 <- dat$Month == "5"

dat_month_5 <- dat[month_5,]

mean(dat_month_5$Ozone, na.rm = TRUE)
max(dat_month_5$Ozone, na.rm = TRUE)
min(dat_month_5$Ozone, na.rm = TRUE)
range(dat_month_5$Ozone, na.rm = TRUE)


ozone_complete <- complete.cases(dat_month_5$Ozone)
dat_month_5_ozone <- dat_month_5[ozone_complete,]
mean(dat_month_5_ozone$Ozone)
max(dat_month_5_ozone$Ozone)
range(dat_month_5_ozone$Ozone)
