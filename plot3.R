##png(filename="plot3.png", width=480, height=480)

wDays <- strptime(paste(consumptionData$Date, consumptionData$Time), format='%d/%m/%Y %H:%M:%S')
plot(wDays, consumptionData$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")
leg.txt <- c("sub_metering_1", "sub_metering_2", "sub_metering_3")
legend("topright", ,cex=0.95, lty = 1, col = c("black", "red", "blue"),leg.txt)##, pch="-")
lines(wDays, consumptionData$Sub_metering_2, type="l", xlab="", col="red")
lines(wDays, consumptionData$Sub_metering_3, type="l", xlab="", col="blue")

dev.copy(png, file = "plot3.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off()                         ## close the PNG device!