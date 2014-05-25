fileUrl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="Power_Consumption.zip")
unzip("Power_Consumption.zip")


######Fetch the data only for 2 days
d = read.table("household_power_consumption.txt", sep=";",header = TRUE, skip = 66637,nrows = 2880)
colnames(d)<- c( "Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

###add date & time as a new column and convert it to date format
d$DT <- strptime(paste(d$Date,d$Time), format='%d/%m/%Y %H:%M:%S')

###Plot 1 - Creat and save as a PNG with specific image size
png("plot1.png", width = 480, height = 480)
hist(d$Global_active_power,col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

###Another way to use dev
#dev.copy(png,'Plot1.png')
#dev.off()

