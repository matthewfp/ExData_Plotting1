# Load the data
power_data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# Filter data to only read the necessary two days
power_data <- power_data[which(power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007"),]

# Changed to date and time
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")

# Open png device
png("plot4.png", width = 480, height = 480)

# Create multiplot
par(mfrow = c(2, 2))

# Plot first graph
plot(power_data$Global_active_power, type = "l", ylab = "Global Active Power", xlab="", xaxt = "n")
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))

# Plot second graph
plot(power_data$Voltage, type = "l", ylab = "Voltage", xlab="datetime", xaxt = "n")
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))

# Plot third graph
plot(power_data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab="", xaxt = "n")
lines(power_data$Sub_metering_2,col="red")
lines(power_data$Sub_metering_3,col="blue")
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
legend("topright", cex=0.9, lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

# Plot fourth graph
plot(power_data$Global_reactive_power, ylab = "Global_reactive_power", type = "l", xlab="datetime", xaxt = "n")
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))

# Close device
dev.off()
