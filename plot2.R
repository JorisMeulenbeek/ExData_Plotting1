##set working directory
setwd('/Users/Joris/Documents/Exploratory_Data_Analysis');

##Load file 
expl_data <- read.table('./household_power_consumption_correct.txt',header=TRUE, sep = ";")  

##Datum en tijd combi 
datum <- strptime(paste(expl_data$Date, expl_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Omzetten data 
GAP <- as.numeric(expl_data$Global_active_power)

##Lijndiagram opslaan als png
png("plot2.png", width=480, height=480)
plot(datum, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off();