##load consumption data
filename<-"household_power_consumption.txt"

##Fastread the first column only in order to subset by date 
getRows <- fread(filename, header=TRUE, select=1)

##All = those rows where the dates are Feb1 or Feb2, 2007
all<-(which(getRows$Date %in% c("1/2/2007", "2/2/2007")))

##get the index for the first record, and the number of records to keep
skipLines<-min(all)
rowsToKeep<-length(all)

##Grab the column headers by doing a fast read of first line
consumptionHeader<-names(fread(filename,nrows=1, header=TRUE))

##read consumption data for only those records in the right daterange
consumptionData<-read.table(filename,skip=(skipLines-1), nrows=rowsToKeep, na.strings="?", sep=";", col.names=consumptionHeader)

##clear getRows from memory
rm(getRows) 


par(mfrow = c(2,2))                        #set canvas for 4 plots

##plot Global active powerin upper left corner of canvas
plot(wDays, consumptionData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##plot Voltage in upper right corner of canvas
plot(wDays, consumptionData$Voltage, type="l", xlab="date/time", ylab="Voltage")

##plot Energy Sub metering in bottom left corner of canvas
plot(wDays, consumptionData$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")
leg.txt <- c("sub_metering_1", "sub_metering_2", "sub_metering_3")
legend("topright", ,cex=0.95, lty = 1, col = c("black", "red", "blue"),leg.txt)##, pch="-")
lines(wDays, consumptionData$Sub_metering_2, type="l", xlab="", col="red")
lines(wDays, consumptionData$Sub_metering_3, type="l", xlab="", col="blue")

##plot Global Reactive Power in bottom right corner of canvas
plot(wDays, consumptionData$Global_reactive_power, type="l", xlab="date/time", ylab="Global Reactive Power")

dev.copy(png, file = "plot4.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off()                         ## close the PNG device!
