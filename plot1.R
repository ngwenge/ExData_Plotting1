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

#Plot 1
par(mfrow=c(1,1))
with(data, hist(Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="orangered"))


