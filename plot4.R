#Read full data 
full_data <- read.table("household_power_consumption.txt", header=T, sep=";", colClasses="character", nrow=70000)

#Coerce Date variable into "Date" using as.Date. Then, subset full data to only 2007-02-01 and 2007-02-02
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")
data <- subset(full_data, Date>="2007-02-01" & Date<="2007-02-02")

#Coerce all the varaibles (except Date and Time) into numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

#Add DateTime variable
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format="%Y-%m-%d %H:%M:%S")

#Plot 4
par(mfrow=c(2,2), mar=c(2,4,2,2))
with(data, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power"))

with(data, plot(DateTime, Voltage, type="l", ylab="Voltage"))

with(data, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering"), col="black")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data, plot(DateTime, Global_reactive_power, type="l"))