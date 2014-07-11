## Read in file
pwr<-read.csv("household_power_consumption.txt",sep=";",na.strings="?")
pwr$Date<-as.Date(pwr$Date,format="%d/%m/%Y")
d1<-as.Date("2007-02-01",format="%Y-%m-%d")
d2<-as.Date("2007-02-02",format="%Y-%m-%d")

##Read in only values from Feb 1st 2007 to Feb 2nd 2007
pwr2<-subset(pwr,(Date>=d1&Date<=d2),)
pwr2["datetime"]<-paste(as.character(pwr2$Date),as.character(pwr2$Time))
pwr2$datetime<-strptime(pwr2$datetime,"%Y-%m-%d %H:%M:%S")
par(mar=c(4,4,4,4))

plot(pwr2$datetime,pwr2$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(pwr2$datetime,pwr2$Sub_metering_1,col="black",type="l")
points(pwr2$datetime,pwr2$Sub_metering_2,col="red",type="l")
points(pwr2$datetime,pwr2$Sub_metering_3,col="blue",type="l")
legend("topright",pch="_____",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##copy to png file
png(file="plot3.png", width=480,height=480)
plot(pwr2$datetime,pwr2$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(pwr2$datetime,pwr2$Sub_metering_1,col="black",type="l")
points(pwr2$datetime,pwr2$Sub_metering_2,col="red",type="l")
points(pwr2$datetime,pwr2$Sub_metering_3,col="blue",type="l")
legend("topright",pch="_____",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
