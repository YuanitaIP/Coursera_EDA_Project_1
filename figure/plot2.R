setwd("D:/Organisasi/Ayo mondok/PP. Al-Hikam/Coursera/Data Science Specializations by John Hopkins University/Course 4 Exploratory Data Analysis/Week 1/[5] Project")
data <- read.csv("hpc.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
Sys.setlocale("LC_TIME", "English")
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

## Plot 2
png("plot2.png", width=480, height=480)
with(subdata, {
    plot(Global_active_power~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
})


dev.off()

