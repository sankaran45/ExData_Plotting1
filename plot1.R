# read the data
data<-read.table("household_power_consumption_min.txt", sep=";", header=TRUE)
# open the file device
png(file="plot1.png")
# create the histogram and send to the file
with (data, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency", freq=TRUE, col="Red"))
# close the file device
dev.off()

