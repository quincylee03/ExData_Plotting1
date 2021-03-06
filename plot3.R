# Download file onto your harddrive and unzip to your working directory

#Load data set, trying to get the prices for 2 days. Use read.table to read the .txt file. Save it to data frame called power
power <-read.table("./household_power_consumption.txt" , sep=";", skip= 66637, nrows= 2880, stringsAsFactors=F, na.strings="?")
#Name the columns
colnames(power)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage" , "Global_intensity", "Sub_metering_1" , "Sub_metering_2", "Sub_metering_3")

#Create a new variable, datetime that combine the Date and Time. Convert datetime to the POSIXlt class. 
power$datetime<- paste (power$Date, power$Time, sep = " ")
power$xaxis <- strptime(power$datetime, "%d/%m/%Y %H:%M:%S")

# Script to plot and save to png
# Call to png graphic device
png(filename = "plot3.png", width = 480, height = 480, bg = "white") 
#Create plot on screen device. Set legend to the top right.
with(power, plot(xaxis, Sub_metering_1, type ="l", xlab= "", ylab= "Energy sub metering", col= "black"))
lines(power$xaxis, y = power$Sub_metering_2, type = "l", col= "red")
lines(power$xaxis, y = power$Sub_metering_3, type = "l", col= "blue")
legend("topright", lwd = 1  , col = c("black", "red", "blue"), legend = c("Sub_metering_1" , "Sub_metering_2", "Sub_metering_3"))
# Close the PNG device
dev.off() 