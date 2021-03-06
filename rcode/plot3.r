data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses="character")
data2<-data[66637:69516,]
data2$Date<-strptime(paste(data2$Date,data2$Time), "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
a<-as.numeric(data2$Sub_metering_1)
b<-as.numeric(data2$Sub_metering_2)
c<-as.numeric(data2$Sub_metering_3)
png(file="plot3.png")
plot(data2$Date,a,type="l",ylab="Energy sub metering",xlab="")
lines(data2$Date,b,col="red")
lines(data2$Date,c,col="blue")
legend("topright",lty=1,cex=0.6,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()