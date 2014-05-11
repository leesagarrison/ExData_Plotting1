
wDays <- strptime(paste(consumptionData$Date, consumptionData$Time), format='%d/%m/%Y %H:%M:%S')
plot(wDays, consumptionData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off()                         ## close the PNG device!