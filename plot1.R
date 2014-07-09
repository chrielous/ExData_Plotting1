plot1 <- function()
{
datatable<-read.csv(file="household_power_consumption.txt",sep=";")
datatable$Date <- as.Date(datatable$Date,'%d/%m/%Y')
dt<-subset(datatable,datatable$Date >= as.Date("02/01/2007",'%m/%d/%Y') & datatable$Date < as.Date("02/03/2007",'%m/%d/%Y'))
hist(x=as.numeric(dt$Global_active_power),main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, file="plot1.png")
dev.off()
}