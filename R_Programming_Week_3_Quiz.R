# Week 3 Programming Quiz
library(tidyverse)
library(datasets)
data(iris)

?iris

# get mean sepal length for virginica
sapply(split(iris$Sepal.Length, iris$Species), mean)

  # also can do it this way
library(data.table)
iris_dt <- as.data.table(iris)
iris_dt[Species == "virginica",round(mean(Sepal.Length)) ]


# to produce a vector of the first four columns with their means use the 
# following code
apply(iris[ , 1:4], 2, mean)



data("mtcars")

sapply(split(mtcars$mpg, mtcars$cyl), mean)


with(mtcars, tapply(mpg, cyl, mean))

absolute

sapply(split(mtcars$mpg, mtcars$cyl), diff)

mtcars$cyl 

sapply(split(mtcars$mpg, mtcars$cyl), mean) %>%
  abs(mtcars[cyl == 4] - mtcars[cyl == 8])
 

mtcars_dt <- as.data.table(mtcars)
mtcars_dt <- mtcars_dt[,  .(mean_cols = mean(hp)), by = cyl]
round(abs(mtcars_dt[cyl == 4, mean_cols] - mtcars_dt[cyl == 8, mean_cols]))