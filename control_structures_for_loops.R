for(i in 1:10) {
  print(i)
}

# These three loops have the same behaviour

x <- c("a", "b", "c", "d")

for(i in 1:4) { 
  print(x[i])
}

for(i in seq_along(x)) {
  print(x[i])
}

for(letter in x) { 
  print(letter)
}

# Nested for Loops

z <- matrix(1:6, 2, 3)

for(i in seq_len(nrow(z))) {
  for(j in seq_len(ncol(z))) {
  print(z[i, j])
  }
}


#seq_len takes an integer and creates an integer sequence out of it. In this case
#it is has two rows so it creates a seq 1, 2
