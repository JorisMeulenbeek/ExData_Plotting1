##set working directory
setwd('/Users/Joris/Documents/Exploratory_Data_Analysis');

##Load file 
expl_data <- read.table('./household_power_consumption_correct.txt',header=TRUE, sep = ";")  

##Omzetten data 
GAP <- as.numeric(expl_data$Global_active_power)

##Histogram opslaan als png
png("plot1.png", width=480, height=480)
hist(GAP, xlab="Global Active Power (kilowatts)" , col="red", main="Global Active Power", )
dev.off();