data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses="character")
data2<-data[66637:69516,]
a<-as.numeric(data2$Global_active_power)
#Comebine date and time
data2$Date<-strptime(paste(data2$Date,data2$Time), "%d/%m/%Y %H:%M:%S")
#set system language to english
Sys.setlocale("LC_TIME", "English")
#plot
plot(data2$Date,a,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()