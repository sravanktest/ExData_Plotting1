## Read data from file
household <- read.csv("household_power_consumption.txt", sep = ";")

## Convert Date and Time variables to Date/Time class (Add new variable DateTime)
household$DateTime <- strptime(paste(household$Date, household$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

## Subset data from date 2007-02-01 to 2007-02-02
household <- subset(household, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))
str(household)

## Plot
household$Global_active_power <- as.numeric(household$Global_active_power)
plot(household$DateTime, household$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Save plot to PNG file
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()
