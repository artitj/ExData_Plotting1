# Plot2.R
# Creates a line plot of global active power vs day/time

# Read data
data <- read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
data$Date <- strptime(data$Date,format="%d/%m/%Y")

timeLowLim <- as.POSIXct("2007-02-01")
timeUpLim <- as.POSIXct("2007-02-02")

dataSubset <- subset(data,Date >= timeLowLim & Date <= timeUpLim)
dataSubset$DateTime <- strptime(paste(dataSubset$Date,dataSubset$Time,sep=" "),format="%Y-%m-%d %H:%M:%S")
png(filename="plot4.png",width=480,height=480,pointsize=12)
par(mfrow=c(2,2))
plot(x=dataSubset$DateTime,y=dataSubset$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")
plot(x=dataSubset$DateTime,y=dataSubset$Voltage,type="l",
     xlab="datetime",ylab="Voltage")
plot(x=dataSubset$DateTime,y=dataSubset$Sub_metering_1,type="l",col="black",
     xlab="",ylab="Energy sub metering")
lines(x=dataSubset$DateTime,y=dataSubset$Sub_metering_2,type="l",col="red")
lines(x=dataSubset$DateTime,y=dataSubset$Sub_metering_3,type="l",col="blue")
lines(x=dataSubset$DateTime,y=dataSubset$Sub_metering_2,type="l",col="red")
legend(x="topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"),box.lwd=0)
plot(x=dataSubset$DateTime,y=dataSubset$Global_reactive_power,type="l",
     xlab="datetime",ylab="Global_reactive_power")
dev.off()