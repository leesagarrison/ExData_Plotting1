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
consumptionData<-read.table(filename,skip=(skipLines-1), nrows=rowsToKeep, na.strings="?", sep=" ", col.names=consumptionHeader) ##, header=TRUE)

##clear getRows from memory
rm(getRows)               
