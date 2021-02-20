library("sqldf")

# Question Two - Select only data for the probability weights pwgtp1
# with ages less than 50

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
f <- file.path(getwd(), "ss06pid.csv")
download.file(url, f)
acs <- data.table::data.table(read.csv(f))

# Answer: 
query1 <- sqldf("select pwgtp1 from acs where AGEP < 50")
?sqldf

################################################################################

# Question Three - What is equivalent to the following function?
unique_AGEP <- unique(acs$AGEP) 

# answer:

sqldf("select distinct AGEP from acs")

################################################################################

# Question 4

# How many characters are in the 10th, 20th, 30th and 100th lines of HTML from 
# this page: http://biostat.jhsph.edu/~jleek/contact.html

connection <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(connection)
close(connection)
c(nchar(htmlCode[10]), nchar(htmlCode[20]), nchar(htmlCode[30]), 
  nchar(htmlCode[100]))

# Answer: 
# 45 31 7 25
  
################################################################################

# Question 5 - Read this data set into R and report the sum of the numbers in 
# the fourth of the nine columns.

# Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
lines <- readLines(url, n = 10)
w <- c(1, 9, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3)
colNames <- c("filler", "week", "filler", "sstNino12", "filler", "sstaNino12", 
              "filler", "sstNino3", "filler", "sstaNino3", "filler", "sstNino34",
              "filler", "sstaNino34", "filler", "sstNino4", "filler", "sstaNino4")
d <- read.fwf(url, w, header = FALSE, skip = 4, col.names = colNames)
d <- d[, grep("^[^filler]", names(d))]
sum(d[, 4])

# Answer: 
# 32426.7



