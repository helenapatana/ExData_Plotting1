Data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")
SubData <- Data[(Data$Date=="2007-02-01")|(Data$Date=="2007-02-02"),]

Sub_metering_1 <- as.numeric(SubData$Sub_metering_1[complete.cases(SubData$Sub_metering_1)])
Sub_metering_2 <- as.numeric(SubData$Sub_metering_2[complete.cases(SubData$Sub_metering_2)])
Sub_metering_3 <- as.numeric(SubData$Sub_metering_3[complete.cases(SubData$Sub_metering_3)])
Date <- SubData$Date[complete.cases(SubData$Date)]
Time <- SubData$Time[complete.cases(SubData$Time)]
Day <- as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480)
plot(Day, Sub_metering_1, type= "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(Day, Sub_metering_2, col = "red")
lines(Day, Sub_metering_3, col = "blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","red","blue"),bg="white",lwd=2)
dev.off()