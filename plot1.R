## Read in file
pwr<-read.csv("household_power_consumption.txt",sep=";",na.strings="?")
pwr$Date<-as.Date(pwr$Date,format="%d/%m/%Y")
d1<-as.Date("2007-02-01",format="%Y-%m-%d")
d2<-as.Date("2007-02-02",format="%Y-%m-%d")

##Read in only values from Feb 1st 2007 to Feb 2nd 2007
pwr2<-subset(pwr,(Date>=d1&Date<=d2),)
hist(pwr2$Global_active_power,breaks=12,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")

##copy to png file
dev.copy(png,file="plot1.png", width=480,height=480)
dev.off()
