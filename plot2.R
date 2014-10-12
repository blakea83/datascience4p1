# This is the R file to generate plot 1 for exploratory data techniques Project 1 




# Read in the data
a<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

# takes the date out 
a1<-a[,1]

#converts the factors to character vectors
 a2<-as.character(a1)

#takes thetime out
b1<-a[,2]

#character vector
b2<-as.character(b1)

# Pasting Together the date and time columns
c1<-paste(a2,b2)

# merges the time and date columns
c2<-as.POSIXct(c1, format="%d/%m/%Y %H:%M:%S")

#replaces the date colum with the POSIXct values
a[,1]<-c2

# getting the desired date ranges in POSIXct form to allow subsetting to be used
e1<-as.POSIXct("2007-02-01", format="%Y-%m-%d")
e2<-as.POSIXct("2007-02-03", format="%Y-%m-%d")

# Getting the subset of the data between Date 2007-02-01 and 2007-02-02
d1<-subset(a,a[,1]>=e1)
d2<-subset(d1,d1[,1]<e2)

#create a vector of the lables
l<- colnames(d2)

#Take out the Global Active Power Column
f1<-d2[[3]]

#factors to character vectors
f2<-as.character(f1)

# Character Vector to numeric
f3<-as.numeric(f2)

#Histogram of Global Active Power
hist(f3, col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

# loads the library necessary for creating the png file 
library("datasets")
