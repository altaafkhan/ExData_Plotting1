## Script downloads data set from the he UC Irvine Machine Learning Repository, unzips it, loads data set and then creates plot graph plot1.png showing frequency of Global Active Power (kilowatts)

## Create a "data" directory to save data files into 
if (!file.exists("data")) {
dir.create("data")
}

## create an "images" directory to save the png files into 
if (!file.exists("images")) {
dir.create("images")
}

## Dowload data set and save it to working data directory
## Source https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/exdata_data_household_power_consumption.zip")
dateDownloaded <- date()

## Unzip data
unzip("./data/exdata_data_household_power_consumption.zip", files = NULL, list = FALSE, overwrite = TRUE,
junkpaths = FALSE, exdir = "./data", unzip = "internal",
setTimes = FALSE)

## Loading full dataset
full_dataset <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                         nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
full_dataset$Date <- as.Date(full_dataset$Date, format="%d/%m/%Y")

## Subsetting the dataset
data <- subset(full_dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_dataset)

## Date conversion
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving as plot1.png file
dev.copy(png, file="./images/plot1.png", height=500, width=500)
dev.off()
