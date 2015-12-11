#Plotting Assignment 1 of Exploratory Data Analysis Course.
#This script makes plot4 and saves it in plot4.png file.
#Please, provide directory with data file "household_power_consumption.txt"
#in WD variable below

WD<-"~/Projects/Coursera/DataScienceSpec/ExData/ExData_Plotting1"

plot4<-function()
{
    setwd(WD)
    classes <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
    consum <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, colClasses = classes,na.strings = "?")
    consum$Full_Time<-strptime(paste(consum[,1],consum[,2]),format = "%d/%m/%Y %H:%M:%S")
    consum[,1]<-as.Date(consum[,1],format = "%d/%m/%Y")
    png(file = "plot4.png")
    par(mfrow=c(2,2))
    with(subset(consum,Date == "2007-02-01" | Date == "2007-02-02"),
         {
             plot(Full_Time, Global_active_power, col = "black", xlab = "", ylab = "Global Active Power", type = "l")
             plot(Full_Time, Voltage,             col = "black", xlab = "", ylab = "Voltage", type = "l")
             plot(Full_Time,  Sub_metering_1,     col = "black", xlab = "", ylab = "Energy sub metering", type = "l")
             lines(Full_Time, Sub_metering_2,     col = "red")
             lines(Full_Time, Sub_metering_3,     col = "blue")
             legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = 'n')
             plot(Full_Time, Global_reactive_power, col="black", xlab = "", ylab = "Global Reactive Power", type="l")
         })
    dev.off()
}