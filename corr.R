
corr <- function(directory, threshold = 0) {
  id = 1:332
  filename <- list.files(directory, full.names = TRUE)
  result <- vector(mode = "numeric", length = 0)
  for(i in seq(filename)) {
    mon_qual <- read.csv(filename[i])
    good <- complete.cases(mon_qual)
    mon_qual <- mon_qual[good, ]
    if(nrow(mon_qual) > threshold) {
      correlation <- cor(mon_qual[["sulfate"]], mon_qual[["nitrate"]])
      result <- append(result, correlation)
    }
  }
  result
}


