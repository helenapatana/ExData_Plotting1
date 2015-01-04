Data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")
SubData <- Data[(Data$Date=="2007-02-01")|(Data$Date=="2007-02-02"),]

GlobActPower <- as.numeric(SubData$Global_active_power[complete.cases(SubData$Global_active_power)])
Date <- SubData$Date[complete.cases(SubData$Date)]
Time <- SubData$Time[complete.cases(SubData$Time)]

Day <- as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(Day, GlobActPower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()