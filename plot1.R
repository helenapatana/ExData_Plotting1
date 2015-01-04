Data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")
SubData <- Data[(Data$Date=="2007-02-01")|(Data$Date=="2007-02-02"),]

GlobActPower <- as.numeric(SubData$Global_active_power[complete.cases(SubData$Global_active_power)])
png("plot1.png", width = 480, height = 480)
hist(GlobActPower, col = "red")
dev.off()