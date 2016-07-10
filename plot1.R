# Load the data
power_data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# Filter data to only read the necessary two days
power_data <- power_data[which(power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007"),]

# Changed to date and time
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")

# Open png device
png("plot1.png", width = 480, height = 480)

# Plot graph
hist(power_data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Close device
dev.off()
