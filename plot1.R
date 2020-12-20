source("./read_data.R")

png(filename = "PNGs/plot1.png", width = 480, height = 480)
hist(power_consumption$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
