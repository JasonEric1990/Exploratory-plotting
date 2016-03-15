library(data.table)
data=fread("household_power_consumption.txt")
data=data[data$Date %in% c("2/2/2007","1/2/2007")]
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
par(mar=c(5,4.5,4.5,3))
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)
globalreactivepower <- as.numeric(data$Global_reactive_power)
globalActivePower <- as.numeric(data$Global_active_power)
datetime=strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
voltage <- as.numeric(data$Voltage)


plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage",cex=1)

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="",cex=0.2)
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power",cex=0.2)


dev.off()