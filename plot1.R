## Read data in from local directory
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

## Subset data to include only dates of interest
data1 <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"), ]

## Convert and combine the original Date and Time columns into a new column with Date / Time class
data1$DateTime<-as.POSIXct(paste(data1$Date,data1$Time), format="%d/%m/%Y %H:%M:%S")

## Open png graphics device
png(filename = "plot1.png", width=480, height=480)

## Convert factor to integer for $Global_active_power and create histogram with desired parameters
hist(as.numeric(as.character(data1$Global_active_power)),xlab="Global Active Power (kilowatts)",main="Global Active Power", col="red")

## Close png device
dev.off()

