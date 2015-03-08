# Download file onto your harddrive and unzip to your working directory

#Load data set, trying to get the prices for 2 days. Use read.table to read the .txt file. Save it to data frame called power
power <-read.table("./household_power_consumption.txt" , sep=";", skip= 66637, nrows= 2880, stringsAsFactors=F, na.strings="?")
#Name the columns
colnames(power)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage" , "Global_intensity", "Sub_metering_1" , "Sub_metering_2", "Sub_metering_3")

#Create a new variable, dt that combine the Date and Time. Convert dt to the POSIXlt class called datetime. 
power$dt<- paste (power$Date, power$Time, sep = " ")
power$datetime <- strptime(power$dt, "%d/%m/%Y %H:%M:%S")

# Script to plot and save to png
# Call to png graphic device
png(filename = "plot4.png", width = 480, height = 480, bg = "white") 
#Create a plot of 2X2 charts
par(mfrow = c(2, 2))
#Create 4 plot on screen device
with(power, {
        plot(datetime, Global_active_power, type ="l", xlab= "", ylab= "Global Active Power")
        plot(datetime, Voltage, type ="l", ylab= "Voltage")
        plot(datetime, Sub_metering_1, type ="l", xlab= "", ylab= "Energy sub metering", col= "black")
        lines(power$datetime, y = power$Sub_metering_2, type = "l", col= "red")
        lines(power$datetime, y = power$Sub_metering_3, type = "l", col= "blue")
        legend("topright", lwd = 1  , bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1" , "Sub_metering_2", "Sub_metering_3"))
        plot(datetime, Global_reactive_power, type ="l", ylab= "Global_reactive_power")
})
# Close the PNG device
dev.off() 