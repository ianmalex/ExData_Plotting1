##load file
power <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
power <- subset(power, subset = power$Date=="1/2/2007" | power$Date=="2/2/2007" | power$Date=="Date")
##format date and time
power$Date = as.Date(power$Date, "%d/%m/%Y")
power$Time <- paste(power$Date, power$Time, sep=" ")
power$Time <- strptime(power$Time, "%Y-%m-%d %H:%M:%S")
##create image
png(file = "plot3.png", width=480, height=480)
plot(power$Time, power$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(power$Time, power$Sub_metering_2,col="red")
lines(power$Time, power$Sub_metering_3,col="blue")
legend("topright", lty=c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
