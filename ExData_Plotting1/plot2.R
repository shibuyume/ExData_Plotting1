# read the  UC Irvine Machine Learning Repository  "Individual household electric power consumption Data Set" from folder

fullds<-read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings="?", nrows= 2075259)

#format the date column to date class

fullds[,1] <- as.Date(fullds[,1], format="%d/%m/%Y")

#subset for relevant date range between 2007-02-01 and 2007-02-02
barchartds<- subset(fullds,fullds[,1]>=as.Date("2007-02-01"))
barchartds<- subset(barchartds,barchartds[,1]<=as.Date("2007-02-02"))

#create new column with datetime values
listDateTime <- strptime(paste(barchartds$Date, barchartds$Time), format = "%Y-%m-%d %H:%M:%S")
barchartds$DateTime<-listDateTime

#draw line chart
with(barchartds, plot(DateTime, Global_active_power, ylab ="Global Active Power (kilowatts)", xlab="", type = "l"))

#export line chart
dev.copy(png, file = "plot2.png")
dev.off()