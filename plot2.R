## Script creates plot2 and saves it as a png file

## Load full data set
full_dataset <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
full_dataset$Date <- as.Date(full_dataset$Date, format="%d/%m/%Y")

## Subset data set
data <- subset(full_dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_dataset)

## Date conversion
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Save as plot2.png under the "images" folder
dev.copy(png, file="./images/plot2.png", height=500, width=500)
dev.off()

## Clear objects from the workspace
rm(list=ls())
