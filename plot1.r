##Reading, naming and subsetting power consumption data
setwd("C:\\johnhopkin\\class4\\week1")
power_consum <-read.csv("household_power_consumption.txt",na.strings = "?",sep = ";")
subpower <- subset(power_consum,power_consum$Date=="1/2/2007" | power_consum$Date =="2/2/2007")

##calling the basic plot function
## plot histogram of global active power for those 2 days
png("plot1.png", width=480, height=480)
hist(subpower$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()