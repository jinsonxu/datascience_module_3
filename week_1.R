# Week 1 of Getting and Cleaning Data Module for Data Science Specialization
# By: Jinson Xu
# Date: 12th Oct 2014

# clear workspace
rm(list=ls())



fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(fileURL, destfile='./data/getdata%2Fdata%2Fss06hid.csv', method='curl')
dateDownloaded <- date()

d <- read.csv('./data/getdata%2Fdata%2Fss06hid.csv', sep=",", 
              stringsAsFactors = FALSE,
              na.strings=c(".", "NA", "", "?", "Not Available"), 
              strip.white=TRUE) # trim the whitespace in our values, save alot of trouble later

nrow(d[d$VAL>=1000000,])



fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'
download.file(fileURL, destfile='./data/getdata%2Fdata%2FDATA.gov_NGAP.xlsx', method='curl')
dateDownloaded <- date()
library(xlsx)
dat <- read.xlsx('./data/getdata%2Fdata%2FDATA.gov_NGAP.xlsx', 
              sheetIndex=1,header=TRUE, startRow=18,endRow=23,colIndex=7:15) 
sum(dat$Zip*dat$Ext,na.rm=T)



fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
download.file(fileURL, destfile='./data/getdata%2Fdata%2Frestaurants.xml', method='curl')
dateDownloaded <- date()
library(XML)
doc <- xmlTreeParse('./data/getdata%2Fdata%2Frestaurants.xml', useInternal=TRUE)

xmlName(xmlRoot(doc))
rootNode <- xmlRoot(doc)
length(xpathSApply(rootNode, '//zipcode[text()=21231]', xmlValue))



fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
download.file(fileURL, destfile='./data/getdata%2Fdata%2Fss06pid.csv', method='curl')
dateDownloaded <- date()
library(data.table)
DT <- fread('./data/getdata%2Fdata%2Fss06pid.csv')
            
            
DT[,mean(pwgtp15),by=SEX]


