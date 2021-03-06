# Download file onto your harddrive and unzip to your working directory

#Load data set, trying to get the prices for 2 days. Use read.table to read the .txt file. Save it to data frame called power
power <-read.table("./household_power_consumption.txt" , sep=";", skip= 66637, nrows= 2880, stringsAsFactors=F, na.strings="?")
#Name the columns
colnames(power)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage" , "Global_intensity", "Sub_metering_1" , "Sub_metering_2", "Sub_metering_3")


# Script to plot and save to png
# Call to png graphic device
png(filename = "plot1.png", width = 480, height = 480, bg = "white") 
#Create plot on screen device
with(power, hist(Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", main= "Global Active Power")) 
# Close the PNG device
dev.off() 