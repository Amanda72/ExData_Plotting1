data<-read.table("household_power_consumption.txt",sep=";",head=TRUE,stringsAsFactors = FALSE)
data$date_time<-strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
cd<- subset(data,data$Date>="2007-02-01" & data$Date<="2007-02-02")

png("plot2.png.png",height=480,width=480)
plot(cd$date_time,cd$Global_active_power,xlab=" ",ylab="Global Active Power(kilowatts)",type="l")
dev.off()