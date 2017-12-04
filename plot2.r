##Reading, naming and subsetting power consumption data
setwd("C:\\johnhopkin\\class4\\week1")
power_consum <-read.table("household_power_consumption.txt",na.strings = "?",sep = ";")
subpower <- subset(power_consum,power_consum$Date=="1/2/2007" | power_consum$Date =="2/2/2007")
##calling the basic plot function
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot2.png", width=480, height=480)
## calling the basic plot function
with(subpower, plot(Time, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)",main="Global Active Power Vs Time"))
dev.off()
