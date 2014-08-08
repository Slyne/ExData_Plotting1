#load data
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses="character")
data2<-data[66637:69516,]
a<-as.numeric(data2$Global_active_power)
#plot data
hist(a,col="red",main="Global Active Power",xlim=c(0,6))

