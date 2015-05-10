# Read the complete data set from the file household_power_consumption.txt
dataset <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?", dec=".")

## Subset the data for the dates specified
datasubset <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]

datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep= " "), "%d/%m/%Y %H:%M:%S")


## Plot the graph and save it to plot3.png
plot(datetime, as.numeric(datasubset$Sub_metering_1), type="l", xlab="", ylab="Energy Submetering")
lines(datetime, as.numeric(datasubset$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(datasubset$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()