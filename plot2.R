plot2 <- function()
{
datatable<-read.csv(file="household_power_consumption.txt",sep=";")
datatable$Date <- as.Date(datatable$Date,'%d/%m/%Y')
dt<-subset(datatable,datatable$Date >= as.Date("02/01/2007",'%m/%d/%Y') & datatable$Date < as.Date("02/03/2007",'%m/%d/%Y'))
dt$fullDate<-paste(format(dt$Date,'%m/%d/%Y'), as.character(dt$Time), sep=" ")
dt$timeStamp<-strptime(dt$fullDate, "%m/%d/%Y %H:%M:%OS") 
dt$Global_active_power <- as.double(dt$Global_active_power)
plot(y=dt$Global_active_power,x=dt$timeStamp,type="l",ylab="Global Active Power(kilowatts)",xlab=" ")
dev.copy(png,file="plot2.png")
dev.off()
}