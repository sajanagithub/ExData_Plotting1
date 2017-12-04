##Reading, naming and subsetting power consumption data
setwd("C:\\johnhopkin\\class4\\week1")
power_consum <-read.csv("household_power_consumption.txt",na.strings = "?",sep = ";")
subpower <- subset(power_consum,power_consum$Date=="1/2/2007" | power_consum$Date =="2/2/2007")
##calling the basic plot function
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
png("plot3.png", width=480, height=480)
par(mar=c(4,4,2,2))
with(subpower, plot(Time, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
lines(subpower$Time, subpower$Sub_metering_2,type="l", col= "red")
lines(subpower$Time, subpower$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()