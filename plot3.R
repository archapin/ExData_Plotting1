
# LOADING THE DATA
# _________________

# Getting the names of the columns from the original file


datacolnames<- as.character(read.table("household_power_consumption.txt",
                                       sep=";", nrows=1, header=FALSE, 
                                       stringsAsFactors = FALSE))

#  Reading the lines with the information for dates 2007-02-01 to 2007-02-02

powerconsumption <- read.table("household_power_consumption.txt",
                               sep = ";", skip = 66637, nrows=2880,
                               colClasses = c("character","character", 
                                              rep("numeric",7)), 
                               col.names = datacolnames, 
                               na.strings = "?")

# making a new variable with the 

powerconsumption$obsTime <- strptime(paste(powerconsumption$Date, powerconsumption$Time),
                                     "%d/%m/%Y %H:%M:%S")


# Making the plot and saving it to a png file
# _______________

# The plot3.png submitted has the x labels in Spanish, which is the locale 
# for my computer


png(filename="plot3.png")

with(powerconsumption, {
        plot(obsTime, Sub_metering_1, xlab="Date and Time", ylab="Energy sub metering (watt-hour)", 
             type="l")
        lines(obsTime, Sub_metering_2, col = "red")
        lines(obsTime, Sub_metering_3, col = "blue")
})

legend("topright", lty = 1, col = c("blue", "red"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()