source("./read_data.R")

png(filename = "PNGs/plot3.png", width = 480, height = 480)
plot(power_consumption$Time, power_consumption$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(power_consumption$Time, power_consumption$Sub_metering_2, col = "red")
lines(power_consumption$Time, power_consumption$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_mettering_1", "Sub_mettering_2", "Sub_mettering_3"), 
       col=c("black", "red", "blue"), lty=1)
dev.off()
