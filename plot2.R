#This programm will generate a png-file according to Coursera Exploratory Data Analysis week1 programming assignment


# This first lines are just for setting up consolemode for debugging
#setwd("Z:\\CORSAIR\\OnlineCourse\\JohnsHopkinsUniversity_ExploratoryDataAnalysis\\week1\\Coursera_exploratory-data-analysis_weeks")
#source("plot1.R")
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="exdata_household_power_consumption.zip")
#unzip("exdata_household_power_consumption.zip")


#read the file an explore it (just for testing in consolemode!
mydf <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, na.strings = "?", dec=".")
#object.size(mydf)
#summary(mydf)
#str(mydf)

#create additional Column with datetime to make sorting/subsetting easier
# take care to use timezone (switch summertime - wintertime in europe) unless we will get NA's (23. Feb 2007 2:00 - 3:00 didnt exist in Germany)
mytmpdf <-strptime( paste(as.character(mydf$Date), as.character(mydf$Time)) ,"%d/%m/%Y %H:%M:%S", tz = "GMT")
mydf <- cbind(mydf,mytmpdf)
rm(mytmpdf) #release computer memory

#subset as we need just need data from 1 Feb 2007 till 02Feb2007
mydf <- subset(mydf,mytmpdf >= strptime("1/2/2007 00:00:00", "%d/%m/%Y %H:%M:%S") & mytmpdf <= strptime("2/2/2007 23:59:59", "%d/%m/%Y %H:%M:%S"))

#now generate a png as neededd with 480 x 480 px and do labeling as needed
#this is for Plot2
png("plot2.png", width=480, height=480)
Sys.setlocale("LC_TIME", "English") #Need to set the locale unless the days will be named differently e.G. in german
plot(mydf$mytmpdf, mydf$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()