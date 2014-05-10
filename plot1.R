#Load data and initialize header
data <- read.table("household_power_consumption.txt",header=TRUE,skip=66637,nrows=2879,sep=";")
header <- read.table("household_power_consumption.txt",header=TRUE,nrows=1,sep=";")
names(data) <- names(header)

#Convert data types
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$Time <- strptime(data$Time,format="%H:%M:%S")

#draw
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power,main="Global Active Power",xlab ="Global Active Power (kilowatts)",col="red")
dev.off()