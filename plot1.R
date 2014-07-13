# Plot1.R
# Creates a histogram of global active power

# Read data
data <- read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
data$Date <- strptime(data$Date,format="%d/%m/%Y")

timeLowLim <- as.POSIXct("2007-02-01")
timeUpLim <- as.POSIXct("2007-02-02")

dataSubset <- subset(data,Date >= timeLowLim & Date <= timeUpLim)
png(filename="plot1.png",width=480,height=480,pointsize=12)
hist(dataSubset$Global_active_power,breaks=12,col="red",
     main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()