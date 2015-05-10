## Read the complete data set from the file household_power_consumption.txt
dataset <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?", dec=".")

##Subset the data for the dates specified
datasubset <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]

##Plot the graph and save to plot1.png
hist(datasubset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()