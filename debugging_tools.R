# Debugging Tools - Diagnosing the Problem

  # message: Generic notificatin/diagnostic message 

  # warning: indication something is wrong, but not necessarily fatal

  # error: Fatal problem has occurred. Execution is stopped. Produced by the 
  # stop function

  # Condition: Generic concept for indicating that something unexpected can 
  # occur. programmers create their own conditions. The three above are 
  # conditions.

################################################################################
# Example - Creating a print message function

printmessage <- function(x) {
  if(x > 0)
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
  invisible(x)
}


printmessage(1)

  # Printmessage(NA) will produce an error as there is no value where TRUE/FALSE
  # is required

printmessage(NA)

  # Ok so let's fix that problem 



printmessage2 <- function(x) {
  if(is.na(x))
    print("x is a missing value!")
  else if(x > 0)
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
  invisible(x)
}

printmessage2(NA)


  # now let's try the log(-1) which is a non-number
x <- log(-1)
printmessage2(x)


################################################################################

## Something's Wrong! - How do you know that something is wrong with your function? ##

  # What was your input? How did you call the function?
  # What were you expecting? Outputs, messages, other results? 
  # What did you get?
  # How does what you get differ from what you were expecting?
  # Were your expectations correct in the first place?
  # Can you reproduce the problem (exactly)?

             