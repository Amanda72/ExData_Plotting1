
data<-read.table("household_power_consumption.txt",sep=";",head=TRUE,stringsAsFactors = FALSE)
data$Date<-as.Date(data$Date,format="%d/%m/%Y") 
cd<- subset(data,Date>="2007-02-01" & Date<="2007-02-02")
cd$Global_active_power<- as.numeric(cd$Global_active_power)

png("plot1.png",height=480,width=480)

hist(cd$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power")

dev.off()