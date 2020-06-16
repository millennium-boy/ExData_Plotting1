data <- read.table("E:\\Coursera\\household_power_consumption.txt",skip=1,sep=";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

subpower$Date <- as.Date(subpower$Date, format ="%d %m %y")
subpower$Time <- strptime(subpower$Time, format= "%H :%M :%S")
subpower[1:1440, "Time"] <- format(subpower[1:1440, "Time"]," 2007-02-01 %H:%M:%S")
subpower[1441:2880,'Time'] <- format(subpower[1441:2880,"Time"], '2007-02-02 %H:%M:%S')

png('plot3.png', width=480, height=480)

plot(subpower$Time, as.numeric(subpower$Sub_metering_1), type='l', col='black', xlab='', ylab='Energy sub metering')
lines(subpower$Time,subpower$Sub_metering_2, type='l', col='red')
lines(subpower$Time,as.numeric(as.character(subpower$Sub_metering_3)), type='l',col='blue')

legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black','red','blue'))

dev.off()
