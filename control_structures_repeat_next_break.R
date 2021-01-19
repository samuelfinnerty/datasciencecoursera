# Repeat initiates an infinite loop
# Only way to exit is to call break

x0 <- 1
tol <- 1e-8

# NExt is used to skip an iteration of a loop

for(i in 1:100) {
  if(i <= 20) {
    #Skip the first 20 iterations
    next
  }
  i + 2000
  return()
}
