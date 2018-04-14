data<-read.table("household_power_consumption.txt",sep=";",head=TRUE,stringsAsFactors = FALSE)
data$date_time<-strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
cd<- subset(data,data$Date>="2007-02-01" & data$Date<="2007-02-02")
cd$Voltage<-as.numeric(cd$Voltage)
cd$Global_reactive_power<-as.numeric(cd$Global_reactive_power)

png("plot4.png.png",height=480,width=480)
par(mfrow=c(2,2))

plot(cd$date_time,cd$Global_active_power,xlab=" ",ylab="Global Active Power(kilowatts)",type="l")

plot(cd$date_time,cd$Voltage,xlab="datetime",ylab="Voltage",type="l")

with(cd,plot(date_time,Sub_metering_1,xlab=" ",ylab="Energy sub metering",type="l",col="black"))
lines(cd$date_time,cd$Sub_metering_2,type="l",col="red")
lines(cd$date_time,cd$Sub_metering_3,type="l",col="blue")
legend(c("topright"),lty=1,cex=0.8 ,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(cd$date_time,cd$Global_reactive_powe,xlab="datetime",ylab="Global_reactive_power",type="l")

dev.off()