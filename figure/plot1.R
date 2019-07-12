# Loading the data
setwd("D:/Organisasi/Ayo mondok/PP. Al-Hikam/Coursera/Data Science Specializations by John Hopkins University/Course 4 Exploratory Data Analysis/Week 1/[5] Project")
data <- read.csv("hpc.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# Subseting the data
subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")

# Converting dates
Sys.setlocale("LC_TIME", "English")
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

# Saving the Plot 1
png("plot1.png", width=480, height=480)
hist(subdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
