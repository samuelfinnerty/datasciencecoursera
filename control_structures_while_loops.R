# While loops begin by testing a condition.
# If it is true they execute the loop body.
# Once the loop body is executed, the condition is tested again, and so forth.

count <- 0

while(count < 10) {
  print(count)
  count <- count + 1
}

# Can test multiple conditions within a while loop
# Sometimes there will be more that one condition in the test.

z <- 5

while(z >= 3 && z <= 10) {
  print(z)
  # then I'm going to flip a fair coin (specified below)
  coin <- rbinom(1, 1, 0.5)
  
  if(coin == 1) { ## random walk
    z <- z + 1
  } else {
      z <- z - 1
    }
}
  
# This function essentially operates 
# as a random number generator which will run 
# until one of the two conditions is met

##### REMEMBER!!!!! Conditions are always evaluated left to right 

## Mortgage calculator
# setup
month <- 0         # count the number of months
balance <- 128000  # initial mortgage balance
payments <- 850   # monthly payments
interest <- 0.05   # 5% interest rate per year
total_paid <- 0    # track what you’ve paid the bank

# convert annual interest to a monthly multiplier
monthly_multiplier <- (1 + interest) ^ (1/12)

# keep looping until the loan is paid off...
while(balance > 0){
  
  # do the calculations for this month
  month <- month + 1# one more month
  
  balance <- balance * monthly_multiplier # add the interest 
  balance <- balance - payments # make the payments 
  total_paid <- total_paid + payments # track the total paid
  
  # print the results on screen
  cat("month", month, ": balance", round(balance), "\n")
  
}

# print the total payments at the end
cat("total payments made", total_paid, "\n")