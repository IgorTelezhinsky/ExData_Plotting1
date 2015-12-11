#Plotting Assignment 1 of Exploratory Data Analysis Course.
#This script makes plot2 and saves it in plot2.png file.
#Please, provide directory with data file "household_power_consumption.txt"
#in WD variable below

WD<-"~/Projects/Coursera/DataScienceSpec/ExData/ExData_Plotting1"

plot2<-function()
{
    setwd(WD)
    classes <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
    consum <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, colClasses = classes,na.strings = "?")
    consum$Full_Time<-strptime(paste(consum[,1],consum[,2]),format = "%d/%m/%Y %H:%M:%S")
    consum[,1]<-as.Date(consum[,1],format = "%d/%m/%Y")
    png(file = "plot2.png")
    par(mar=c(4.1, 4.1, 2.1, 2.1)) #default were c(5.1, 4.1, 4.1, 2.1)
    with(subset(consum, Date == "2007-02-01" | Date == "2007-02-02"), 
         plot(Full_Time, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="l"))
    dev.off()
}