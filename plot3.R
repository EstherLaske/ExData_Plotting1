## GRAPH 3: Energy sub metering multiple lines

## open and read the data
powerdata <- read.csv("household_power_consumption.txt", 
                      header = TRUE,  sep = ";", 
                      dec = ".", na.strings = "?", 
                      stringsAsFactors = FALSE)

## subset to a smaller dataset with only the date of 
## interest

power <- subset(powerdata, Date== c("1/2/2007","2/2/2007"))

## convert date and time

power$Date <- as.Date(power$Date, format="%d/%m/%Y")

dateTime <- as.POSIXct(paste(power$Date, power$Time), 
                       format="%Y-%m-%d %H:%M:%S")


## open a PNG graphic device
png(file= "plot3.png")

## plot the graph
plot(dateTime, power$Sub_metering_1, ylim=c(0,30),
     type="l", xlab="", ylab="Energy sub metering")
lines(dateTime, power$Sub_metering_2, col="red")
lines(dateTime, power$Sub_metering_3, col="blue")

## annotate with legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", 
      "Sub_metering_3"), col=c("black", "red", "blue"), pch= "-",
      bty="o", pt.cex = 1, cex = 1)

## saving the graph
dev.off()
