##text file household_power_consumption.txt needs to be in current working directory

##read data
data <- read.csv("household_power_consumption.txt",sep=";",dec=".",header=TRUE,stringsAsFactors=FALSE,na.strings="?")

##subset 2007-02-01 & 2007-02-02, create a column that holds both date & time,
##and transform this column into date-time class
data <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")
data$datetime <- paste(data$Date,data$Time)
data$datetime <- strptime(data$datetime,"%d/%m/%Y %H:%M:%S")

##create plot as png and close graphics device when finished
png("plot3.png")
with(data,{
  plot(datetime,Sub_metering_1,"l",xlab="",ylab="Energy sub metering")
  lines(datetime,Sub_metering_2,col="red")
  lines(datetime,Sub_metering_3,col="blue")
  })
legend("topright",lwd=1,col=c("black","red","blue"),legend=names(data[,7:9]))
dev.off()