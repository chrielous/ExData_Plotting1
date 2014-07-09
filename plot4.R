plot4 <- function()
{
datatable<-read.csv(file="household_power_consumption.txt",sep=";")
datatable$Date <- as.Date(datatable$Date,'%d/%m/%Y')
dt<-subset(datatable,datatable$Date >= as.Date("02/01/2007",'%m/%d/%Y') & datatable$Date < as.Date("02/03/2007",'%m/%d/%Y'))

dt$fullDate<-paste(format(dt$Date,'%m/%d/%Y'), as.character(dt$Time), sep=" ")
dt$timeStamp<-strptime(dt$fullDate, "%m/%d/%Y %H:%M:%OS") 

par(mfrow=c(2,2))
par(mar=c(2,2,2,2))
plot(y=dt$Global_active_power,x=dt$timeStamp,type="l",ylab="Global Active Power(kilowatts)", xlab = " ")
dt$Voltage<-as.double(dt$Voltage)
plot(y=dt$Voltage,x=dt$timeStamp,type="l",ylab="Votage", xlab = "datetime")
plot(y=dt$Sub_metering_1,x=dt$timeStamp,type="l",ylab="Energy Sub Metering", xlab=" ")
lines(dt$timeStamp,dt$Sub_metering_2,type="l",col="red")
lines(dt$timeStamp,dt$Sub_metering_3,type="l",col="blue")
legend("topright",inset = 0.08,cex=0.6,box.lwd = 0,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col=c("black","red","blue"))
dt$Global_reactive_power <- as.double(dt$Global_reactive_power)
plot(y=dt$Global_reactive_power,x=dt$timeStamp,type="l",ylab="Global Reactive Power", xlab = "datetime")
dev.copy(png,file="plot4.png")
dev.off()
}