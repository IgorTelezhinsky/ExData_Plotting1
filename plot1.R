#Plotting Assignment 1 of Exploratory Data Analysis Course.
#This script makes plot1 and saves it in plot1.png file.
#Please, provide directory with data file "household_power_consumption.txt"
#in WD variable below

WD<-"~/Projects/Coursera/DataScienceSpec/ExData/ExData_Plotting1"

plot1<-function()
{
    setwd(WD)
    classes <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
    consum <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, colClasses = classes,na.strings = "?")
    consum$Full_Time<-strptime(paste(consum[,1],consum[,2]),format = "%d/%m/%Y %H:%M:%S")
    consum[,1]<-as.Date(consum[,1],format = "%d/%m/%Y")
    png(file = "plot1.png")
    with(subset(consum, Date == "2007-02-01" | Date == "2007-02-02"), 
         hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
    dev.off()
}