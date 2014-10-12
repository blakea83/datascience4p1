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


# Getting the vector of times
d3<-d2[,1]

# converts the subsett data from factor to numerical
g1=as.numeric(as.character(d2[,7]))
g2=as.numeric(as.character(d2[,8]))
g3=as.numeric(as.character(d2[,9]))

# Intializes the Plot
plot(d3,g1,xlab="",ylab="Energy sub metering",type="n")

# plots the time series graph for submetering_1
points(d3,g1,type="l",col="black")

# Adding in submetering_2 in red 
points(d3,g2,type="l",col="red")

# adding in submetering_3 in blue
points(d3,g3,type="l",col="blue")

# Adds in the legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

# loads the library necessary for creating the png file 
library("datasets")

# Converting the plot to PNG 
dev.copy(png,file="plot3.png")

# closing development device
dev.off()
