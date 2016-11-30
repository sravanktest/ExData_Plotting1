## Read data from file
household <- read.csv("household_power_consumption.txt", sep = ";")

## Convert Date and Time variables to Date/Time class (Add new variable DateTime)
household$DateTime <- strptime(paste(household$Date, household$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

## Subset data from date 2007-02-01 to 2007-02-02
household <- subset(household, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))
str(household)

## Plot
household$Sub_metering_1 <- as.numeric(household$Sub_metering_1)
household$Sub_metering_2 <- as.numeric(household$Sub_metering_2)
household$Sub_metering_3 <- as.numeric(household$Sub_metering_3)
plot(household$DateTime, household$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering", yaxp=c(0,40,4))
lines(household$DateTime, household$Sub_metering_1, type = "l")
lines(household$DateTime, household$Sub_metering_2, type = "l", col = "red")
lines(household$DateTime, household$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))

## Save plot to PNG file
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()
