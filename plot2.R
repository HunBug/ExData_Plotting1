#Load data and initialize header
data <- read.table("household_power_consumption.txt",header=TRUE,skip=66637,nrows=2879,sep=";")
header <- read.table("household_power_consumption.txt",header=TRUE,nrows=1,sep=";")
names(data) <- names(header)

#Convert data types
#data$Date <- as.Date(data$Date,format="%d/%m/%Y")
#data$Time <- strptime(data$Time,format="%H:%M:%S")
data$DateTime <- strptime(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

#draw
png("plot2.png", width = 480, height = 480)
#ONLY WORKS IN ENGLISH ENVIRONMENT
#plot(data$DateTime,data$Global_active_power,type="l",xlab="")
plot(data$Global_active_power,type="l",xlab="",ylab='Global Active Power (kilowatts)',xaxt="n")
axis(1, at=c(1,length(data$Global_active_power)/2+1,length(data$Global_active_power)),labels=c("Thu","Fri","Sat"))
dev.off()