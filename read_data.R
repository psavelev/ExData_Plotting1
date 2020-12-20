url_data <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file_data <- "./data/household_power_consumption.zip"
file_power_consumption <- "./data/power_consumption.txt"

# Load data if queried data is not existing
if (!file.exists(file_power_consumption))
{
        if (!dir.exists("./data"))
                dir.create("./data")
        if (!file.exists(file_data))
                download.file(url_data, file_data)
        power_consumption_all <- read.csv2(unz(file_data, "household_power_consumption.txt"))
        
        # Fix data types
        power_consumption_all$Time <- strptime(paste(power_consumption_all$Date, power_consumption_all$Time), "%d/%m/%Y %H:%M:%S")
        power_consumption_all$Date <- strptime(power_consumption_all$Date, "%d/%m/%Y")
        # Replace ? with na and conver to numeric
        power_consumption_all$Global_active_power[power_consumption_all$Global_active_power == "?"] <- NA
        power_consumption_all$Global_active_power <- as.numeric(power_consumption_all$Global_active_power)
        
        power_consumption_all$Global_reactive_power[power_consumption_all$Global_active_power == "?"] <- NA
        power_consumption_all$Global_reactive_power <- as.numeric(power_consumption_all$Global_reactive_power)
        power_consumption_all$Voltage[power_consumption_all$Global_active_power == "?"] <- NA
        power_consumption_all$Voltage <- as.numeric(power_consumption_all$Voltage)
        power_consumption_all$Global_intensity[power_consumption_all$Global_active_power == "?"] <- NA
        power_consumption_all$Global_intensity <- as.numeric(power_consumption_all$Global_intensity)
        power_consumption_all$Sub_metering_1[power_consumption_all$Global_active_power == "?"] <- NA
        power_consumption_all$Sub_metering_1 <- as.numeric(power_consumption_all$Sub_metering_1)
        power_consumption_all$Sub_metering_2[power_consumption_all$Global_active_power == "?"] <- NA
        power_consumption_all$Sub_metering_2 <- as.numeric(power_consumption_all$Sub_metering_2)
        power_consumption_all$Sub_metering_3[power_consumption_all$Global_active_power == "?"] <- NA
        power_consumption_all$Sub_metering_3 <- as.numeric(power_consumption_all$Sub_metering_3)
        
        # Query data
        power_consumption <- subset(power_consumption_all, Date >= strptime("2007-02-01", "%Y-%m-%d") & Date <= strptime("2007-02-02", "%Y-%m-%d"))
        # Save for a future use
        write.csv2(power_consumption, file_power_consumption)
        rm(power_consumption_all)
} else {
        power_consumption <- read.csv2(file_power_consumption)
        power_consumption$Time <- strptime(power_consumption$Time, "%Y-%m-%d %H:%M:%S")
        power_consumption$Date <- strptime(power_consumption$Date, "%Y-%m-%d ")
}
