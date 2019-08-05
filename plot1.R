## GRAPH 1: Global active power histogram

## open and read the data
powerdata <- read.csv("household_power_consumption.txt", 
                      header = TRUE,  sep = ";", 
                      dec = ".", na.strings = "?", 
                      stringsAsFactors = FALSE)

## subset to a smaller dataset with only the date of 
## interest

power <- subset(powerdata, Date== c("1/2/2007","2/2/2007"))

## converting date and time

power$Date <- as.Date(power$Date, format="%d/%m/%Y")

dateTime <- as.POSIXct(paste(power$Date, power$Time), 
                       format="%Y-%m-%d %H:%M:%S")


## open a PNG graphic device
png(file="plot1.png")

## creating the histogramm

hist(power$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)")

## saving the graph
dev.off()
