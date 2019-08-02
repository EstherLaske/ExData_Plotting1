## GRAPH 2: Global active power lines

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
png(file="plot2.png")

## plot the graph
plot(dateTime, power$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

## saving the graph
dev.off()
