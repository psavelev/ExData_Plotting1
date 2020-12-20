source("./read_data.R")

png(filename = "PNGs/plot2.png", width = 480, height = 480)
plot(power_consumption$Time, power_consumption$Global_active_power, 
     type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
