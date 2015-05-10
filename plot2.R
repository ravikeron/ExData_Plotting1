## Read the complete data set from the file household_power_consumption.txt
dataset <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?", dec=".")

## Subset the data for the dates specified
datasubset <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]

datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep= " "), "%d/%m/%Y %H:%M:%S")

## Plot the graph and save it to plot2.png
plot(datetime, as.numeric(datasubset$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()