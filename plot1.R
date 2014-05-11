
hist(consumptionData[,3], col="blue", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off()                         ## close the PNG device!