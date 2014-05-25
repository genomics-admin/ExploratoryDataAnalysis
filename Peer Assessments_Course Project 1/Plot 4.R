######Fetch the data only for 2 days
d = read.table("household_power_consumption.txt", sep=";",header = TRUE, skip = 66637,nrows = 2880)
colnames(d)<- c( "Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

###add date & time as a new column and convert it to date format
d$DT <- strptime(paste(d$Date,d$Time), format='%d/%m/%Y %H:%M:%S')

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

















