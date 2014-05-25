###Fetch the data
#d = read.table("household_power_consumption.txt", sep=";")
#head(d)
#str(d)

###And filter only 2 dates
#bestDF <- d1[d1["Date"] == c("1/2/2007", "2/2/2007"),]

######Fetch the data only for 2 days
#d1 = read.table("household_power_consumption.txt", sep=";",header = TRUE)
d = read.table("household_power_consumption.txt", sep=";",header = TRUE, skip = 66637,nrows = 2880)
colnames(d)<- c( "Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

head(d)

###add date & time as a new column and convert it to date format
#d$Date <- as.Date(d$Date,"%d/%m/%Y")
#d$DT <- paste(d$Date,d$Time)
#d$DT <- strptime(d$DT, format='%d/%m/%Y %H:%M:%S')
d$DT <- strptime(paste(d$Date,d$Time), format='%d/%m/%Y %H:%M:%S')

head(d)
str(d)

###Plot 1 - Creat and save as a PNG with specific image size
png("plot1.png", width = 480, height = 480)
hist(d$Global_active_power,col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


###Plot 2 - Creat and save as a PNG with specific image size
png("plot2.png", width = 480, height = 480)
plot(d$DT,d$Global_active_power,type='o',pch='',ylab="Global Active Power (kilowatts)", xlab="")
dev.off()



###Plot 3 - Creat and save as a PNG with specific image size
png("plot3.png", width = 480, height = 480)
plot_colors <- c("black","red","blue")
with(d,plot(DT,Sub_metering_1,xlab="",ylab="Energy Sub metering", type="n"))
with(d,points(DT,Sub_metering_1,type='o',pch='',col=plot_colors[1]))
with(d,points(DT,Sub_metering_2,type='o',pch='',col=plot_colors[2]))
with(d,points(DT,Sub_metering_3,type='o',pch='',col=plot_colors[3]))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=1,lty=1,col=plot_colors)
dev.off()




###Plot 4 - Creat and save as a PNG with specific image size
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(d,{
  
  ###SubPlot 1 - 
  plot(DT,Global_active_power,type='o',pch='',ylab="Global Active Power (kilowatts)", xlab="")
  
  ###SubPlot 2 - 
  plot(DT,Voltage,type='o',pch='',ylab="Voltage", xlab="datetime")
  
  ###SubPlot 3 - 
  plot_colors <- c("black","red","blue")
  with(d,plot(DT,Sub_metering_1,xlab="",ylab="Energy Sub metering", type="n"))
  with(d,points(DT,Sub_metering_1,type='o',pch='',col=plot_colors[1]))
  with(d,points(DT,Sub_metering_2,type='o',pch='',col=plot_colors[2]))
  with(d,points(DT,Sub_metering_3,type='o',pch='',col=plot_colors[3]))
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.7,lty=1,col=plot_colors)
  
  ###SubPlot 4 - 
  plot(DT,Global_reactive_power,type='o',pch='.',ylab="Global_reactive_power", xlab="datetime")
  
})
dev.off()







