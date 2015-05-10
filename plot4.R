# Read the complete data set from the file household_power_consumption.txt
dataset <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?", dec=".")

## Subset the data for the dates specified
datasubset <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]

datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep= " "), "%d/%m/%Y %H:%M:%S")

## Plot the graph and save it to plot4.png

par(mfrow = c(2, 2),mar=c(4,4,2,1)) 


plot(datetime, as.numeric(datasubset$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime, as.numeric(datasubset$Voltage), type="l", xlab="datetime", ylab="Voltage")

plot(datetime, as.numeric(datasubset$Sub_metering_1), type="l", xlab="datetime", ylab="Energy Submetering")
lines(datetime, as.numeric(datasubset$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(datasubset$Sub_metering_3), type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, bty="n", col=c("black", "red", "blue"), cex=.75)

plot(datetime, as.numeric(datasubset$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()