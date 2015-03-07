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
