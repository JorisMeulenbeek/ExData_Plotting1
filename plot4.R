##set working directory
setwd('/Users/Joris/Documents/Exploratory_Data_Analysis');

##Load file 
expl_data <- read.table('./household_power_consumption_correct.txt',header=TRUE, sep = ";")  

##Datum en tijd combi 
datum <- strptime(paste(expl_data$Date, expl_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Omzetten data 
GAP <- as.numeric(expl_data$Global_active_power)
GRAP <- as.numeric(expl_data$Global_reactive_power)


##Instellen aantal plots
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))



##Plot
plot(datum, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(datum, expl_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

with(expl_data, plot(datum, Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering"))
with(subset(expl_data), lines(datum, Sub_metering_1, type="l", col = "black"))
with(subset(expl_data), lines(datum, Sub_metering_2, type="l", col = "red"))
with(subset(expl_data), lines(datum, Sub_metering_3, type="l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datum, GRAP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off();