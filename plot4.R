# read the data
data<-read.table("household_power_consumption_min.txt", sep=";", header=TRUE)

# create a new column called Date (combined Date+Time)
data$Date = with(data, strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

# create a new column that sums up the three sub metering columns
data$Meter = with(data, Sub_metering_1+Sub_metering_2+Sub_metering_3)

# open the file device
png(file="plot4.png")

# set the layout
par(mfrow = c(2, 2))

# plot the data (top left)
with(data, plot(Date, Global_active_power, type="l", ylab="Global Active Power" ))

# plot the data (top right)
with(data, plot(Date, Voltage, type="l", ylab="Voltage" ))

# plot the data (bottom left)
with(data, plot(Date, Meter, type="n", ylab="Energy sub metering" ))
with(data, points(Date, Sub_metering_1, type="l", col="black"))
with(data, points(Date, Sub_metering_2, type="l", col="red"))
with(data, points(Date, Sub_metering_3, type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue") )

# plot the data (bottom right)
with(data, plot(Date, Global_reactive_power, type="l", ylab="Global Reactive Power" ))


# close the file device
dev.off()







