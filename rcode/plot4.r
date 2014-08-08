data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses="character")
data2<-data[66637:69516,]
data2$Date<-strptime(paste(data2$Date,data2$Time), "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
par(mfrow=c(2,2),mar=c(2,2,2,2))

#The first graph
a<-as.numeric(data2$Global_active_power)
plot(data2$Date,a,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#The second graph
Voltage<-as.numeric(data2$Voltage)
plot(data2$Date,Voltage,type="l",xlab="")

#The third graph
a<-as.numeric(data2$Sub_metering_1)
b<-as.numeric(data2$Sub_metering_2)
c<-as.numeric(data2$Sub_metering_3)
plot(data2$Date,a,type="l",ylab="Energy sub metering",xlab="")
lines(data2$Date,b,col="red")
lines(data2$Date,c,col="blue")
#to make the top right box without border: inset=0.01,box.lty=0
legend("topright",lty=1,cex=0.6,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),inset=0.01,box.lty=0)

#The fourth graph
a<-as.numeric(data2$Global_reactive_power)
plot(data2$Date,a,type="l",xlab="",ylab="Global_reactive_power")

dev.copy(png,file="plot4.png")
dev.off()
