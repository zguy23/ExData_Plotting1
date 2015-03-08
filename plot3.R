## Read data in from local directory
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

## Subset data to include only dates of interest
data1 <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"), ]

## Convert and combine the original Date and Time columns into a new column with Date / Time class
data1$DateTime<-as.POSIXct(paste(data1$Date,data1$Time), format="%d/%m/%Y %H:%M:%S")

## Open png graphics device
png(filename = "plot3.png", width=480, height=480)

## Convert factor to integer for $Sub_metering_1 and create plot with desired parameters
plot(data1$DateTime, as.numeric(as.character(data1$Sub_metering_1)), type="l", xlab="",ylab="Energy sub metering")

## Add line for $Sub_metering_2.  Coerce factor into numeric.
lines(data1$DateTime, as.numeric(as.character(data1$Sub_metering_2)),col="red")

## Add line for $Sub_metering_3
lines(data1$DateTime, data1$Sub_metering_3,col="blue")

## Add legend plus any necessary formatting
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = .75, cex = .75)

## Close png device
dev.off()
