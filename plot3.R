data<-read.table("household_power_consumption.txt",sep=";",head=TRUE,stringsAsFactors = FALSE)
data$date_time<-strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
cd<- subset(data,data$Date>="2007-02-01" & data$Date<="2007-02-02")

png("plot3.png.png",height=480,width=480)
with(cd,plot(date_time,Sub_metering_1,xlab=" ",ylab="Energy sub metering",type="l",col="black"))
lines(cd$date_time,cd$Sub_metering_2,type="l",col="red")
lines(cd$date_time,cd$Sub_metering_3,type="l",col="blue")
legend(c("topright"),lty=1,cex=0.5 ,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()