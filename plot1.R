
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
                        rep("numeric",7)), col.names = datacolnames, 
                        na.strings = "?")


# Making the plot and saving it to a png file
# _______________

png(filename="plot1.png")
hist(powerconsumption$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()


