## GRAPH 4: Multiple graphes 


## open and read the data
powerdata <- read.csv("household_power_consumption.txt", 
                      header = TRUE,  sep = ";", 
                      dec = ".", na.strings = "?", 
                      stringsAsFactors = FALSE)

## subset to a smaller dataset with only the date of 
## interest

power <- subset(powerdata, Date== c("2/1/2007","2/2/2007"))

## using lubridate package to convert date and time
library(lubridate)
power$Date <- mdy(power$Date)

dateTime <- as.POSIXct(paste(power$Date, power$Time), 
                       format="%Y-%m-%d %H:%M:%S")


## open a PNG graphic device
png(file= "plot4.png")

## create the space for 4 graphes
par(mfrow=c(2,2), mar=c(4, 4, 3,2))

## plot the graphes, that will fill the spaces by row
## 1st plot is plot 2
plot(dateTime, power$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
## 2nd plot is Voltage and time
plot(dateTime, power$Voltage, type="l", ylab="Voltage")

## 3rd plot is plot 3
plot(dateTime, power$Sub_metering_1, ylim=c(0,30),
     type="l", xlab="", ylab="Energy sub metering")
lines(dateTime, power$Sub_metering_2, col="red")
lines(dateTime, power$Sub_metering_3, col="blue")

## annotate with legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", 
                            "Sub_metering_3"), 
       col=c("black", "red", "blue"), 
       pch="-", bty="n", pt.cex = 1, cex = 1)

## 4th graph is Global reactive power over time
plot(dateTime, power$Global_reactive_power, type="l",
     ylab="Global_reactive_power")

## saving the graph
dev.off()

