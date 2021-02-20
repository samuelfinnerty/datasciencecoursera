library(dplyr)
library(tidyverse)
library(xlsx)
library("XML")


fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = paste0(getwd(), '/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'), method = "curl")

dat <- xlsx::read.xlsx(file = "getdata%2Fdata%2FDATA.gov_NGAP.xlsx", 
                       sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)

################################################################################

fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- XML::xmlTreeParse(sub("s", "", fileURL), useInternal = TRUE)
rootNode <- XML::xmlRoot(doc)

zipcodes <- XML::xpathSApply(rootNode, "//zipcode", XML::xmlValue)
xmlZipcodeDT <- data.table::data.table(zipcode = zipcodes)
xmlZipcodeDT[zipcode == "21231", .N]

# Answer: 
# 127

################################################################################

DT <- data.table::fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")


# Multiple ways to calculate the average of pwgtp15 variable, broken down by sex


mean(DT$pwgtp15,by=DT$SEX)
DT[,mean(pwgtp15),by=SEX] ##### the fastest way
tapply(DT$pwgtp15,DT$SEX,mean)
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
sapply(split(DT$pwgtp15,DT$SEX),mean)
rowMeans(DT)[DT$SEX==1] 
rowMeans(DT)[DT$SEX==2]

# Answer (fastest):
system.time(DT[,mean(pwgtp15),by=SEX])
 
# Next in order of speed
system.time(mean(DT$pwgtp15,by=DT$SEX))

system.time(tapply(DT$pwgtp15,DT$SEX,mean))























download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
                "tidy_week_1_community_data.csv")

dat_community <- read.csv("tidy_week_1_community_data.csv")

house_million <- dat_community %>%
  filter(VAL >= 24)

str(house_million)


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",
              "tidy_week_1_gas_data.xlsx")

dat_gas <- readxl::read_xlsx("getdata_data_DATA.gov_NGAP.xlsx",
                             )

?readxl::read_xlsx

################################################################################
# Reading in an xlsx file type

if(!file.exists("data")){dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "./data/natural_gas.xlsx")
dateDownloaded <- date()



dat <- read.csv("getdata_data_DATA.gov_NGAP (1).csv",
                sep = ',')


%>%
  dat[18:23, 7:15]

dat2 <- select(dat)
  select(dat[18:23, 7:15])

?read.csv
dat4 <- dat[c(18:23, 7:15
              )]