# Load the data
power_data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# Filter data to only read the necessary two days
power_data <- power_data[which(power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007"),]

# Changed to date and time
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")

# Open png device
png("plot3.png", width = 480, height = 480)

# Plot first line
plot(power_data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab="", xaxt = "n")

# Plot second line
lines(power_data$Sub_metering_2,col="red")

# Plot third line
lines(power_data$Sub_metering_3,col="blue")

# Add required axis
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))

# Add required legend
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close device
dev.off()
