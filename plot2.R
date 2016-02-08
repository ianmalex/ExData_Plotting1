##load file
power <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
power <- subset(power, subset = power$Date=="1/2/2007" | power$Date=="2/2/2007" | power$Date=="Date")
##format date and time
power$Date = as.Date(power$Date, "%d/%m/%Y")
power$Time <- paste(power$Date, power$Time, sep=" ")
power$Time <- strptime(power$Time, "%Y-%m-%d %H:%M:%S")
##create image
png(file = "plot2.png", width=480, height=480)
plot(power$Time, type="l", power$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
