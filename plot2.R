# Plot2.R
# Creates a line plot of global active power vs day/time

# Read data
data <- read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
data$Date <- strptime(data$Date,format="%d/%m/%Y")

timeLowLim <- as.POSIXct("2007-02-01")
timeUpLim <- as.POSIXct("2007-02-02")

dataSubset <- subset(data,Date >= timeLowLim & Date <= timeUpLim)
dataSubset$DateTime <- strptime(paste(dataSubset$Date,dataSubset$Time,sep=" "),format="%Y-%m-%d %H:%M:%S")
png(filename="plot2.png",width=480,height=480,pointsize=12)
plot(x=dataSubset$DateTime,y=dataSubset$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")
dev.off()