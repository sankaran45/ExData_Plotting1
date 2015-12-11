# read the data
data<-read.table("household_power_consumption_min.txt", sep=";", header=TRUE)

# create a new column called Date (combined Date+Time)
data$Date = with(data, strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

# open the file device
png(file="plot2.png")

# plot the data
with(data, plot(Date, Global_active_power, type="l", ylab="Global Active Power (kilowatts)" ))

# close the file device
dev.off()







