if(<condition>) {
  ## do something
  
} else {
  ## do something else
}

if(<condition1>) {
  ## do something
} else if(<condition2>) {
  ## do something different 
  ## can be any number of them
  
} else {
  ## so something different 
}


result <- if(x > 3) {
  y <- 10
} else {
  y <- 0
}

## in R though you can specify that y is equal to the entire construct

y <- if(x > 3) {
  10
} else {
  0
}