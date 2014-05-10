#Load data and initialize header
data <- read.table("household_power_consumption.txt",header=TRUE,skip=66637,nrows=2879,sep=";")
header <- read.table("household_power_consumption.txt",header=TRUE,nrows=1,sep=";")
names(data) <- names(header)

#Convert data types
#data$Date <- as.Date(data$Date,format="%d/%m/%Y")
#data$Time <- strptime(data$Time,format="%H:%M:%S")
data$DateTime <- strptime(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

#draw
png("plot4.png", width = 480, height = 480)
#ONLY WORKS IN ENGLISH ENVIRONMENT
#plot(data$DateTiem,data$Sub_metering_1,type="l",xlab="",ylab='Energy sub metering', col="black")

par(mfrow=c(2,2))

#PLOT1
plot(data$Global_active_power,type="l",xlab="",ylab='Global Active Power',xaxt="n")
axis(1, at=c(1,length(data$Global_active_power)/2+1,length(data$Global_active_power)),labels=c("Thu","Fri","Sat"))
#PLOT2
plot(data$Voltage,type="l",xlab="datetime",ylab='Voltage',xaxt="n",lwd=1)
axis(1, at=c(1,length(data$Global_active_power)/2+1,length(data$Global_active_power)),labels=c("Thu","Fri","Sat"))
#PLOT3
plot(data$Sub_metering_1,type="l",xlab="",ylab='Energy sub metering',xaxt="n", col="black")
lines(data$Sub_metering_2,col="red")
lines(data$Sub_metering_3,col="blue")
axis(1, at=c(1,length(data$Global_active_power)/2+1,length(data$Global_active_power)),labels=c("Thu","Fri","Sat"))
legend("topright",bty="n", lwd=1,lty=c(1,1,1),col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#PLOT4
plot(data$Global_reactive_power,type="l",xlab="datetime",ylab='Voltage',xaxt="n")
axis(1, at=c(1,length(data$Global_active_power)/2+1,length(data$Global_active_power)),labels=c("Thu","Fri","Sat"))


dev.off()