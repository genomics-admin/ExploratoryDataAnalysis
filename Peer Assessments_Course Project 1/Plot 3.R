######Fetch the data only for 2 days
d = read.table("household_power_consumption.txt", sep=";",header = TRUE, skip = 66637,nrows = 2880)
colnames(d)<- c( "Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

###add date & time as a new column and convert it to date format
d$DT <- strptime(paste(d$Date,d$Time), format='%d/%m/%Y %H:%M:%S')

###Plot 3 - Creat and save as a PNG with specific image size
png("plot3.png", width = 480, height = 480)
plot_colors <- c("black","red","blue")
with(d,plot(DT,Sub_metering_1,xlab="",ylab="Energy Sub metering", type="n"))
with(d,points(DT,Sub_metering_1,type='o',pch='',col=plot_colors[1]))
with(d,points(DT,Sub_metering_2,type='o',pch='',col=plot_colors[2]))
with(d,points(DT,Sub_metering_3,type='o',pch='',col=plot_colors[3]))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=1,lty=1,col=plot_colors)
dev.off()

















