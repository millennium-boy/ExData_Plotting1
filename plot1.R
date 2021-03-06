data <- read.delim2('E:\\Coursera\\household_power_consumption.txt', skip =1, sep=';')
head(data)
names(data) <- c('Date', 'Time', 'Global_active-power','Global_reactive_power', 'Voltage','Global_intensity','Sub_metering_1',"sub_metering_2",'Sub_metering_3')
subpower <- subset(data,data$Date=='1/2/2007'| data$Date=='2/2/2007')

pnd("plo1.png", width=480, height=480)

hist(as.numeric(as.character(subpower$`Global_active-power`)), col='red', main='Global Active Power', xlab='Global Active Power(kilowatts')

