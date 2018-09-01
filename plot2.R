# Coursera / John Hopkins Data Science Specialization - Course 4 - Week 1 Project
# Construct Plot 2

# Ensure working directory is set properly

# Read data ("household_power_consumption.txt") that has been downloaded from course site
# File is in /data folder in working directory
if(!file.exists("./data")){dir.create("./data")}
raw <- read.table("./data/household_power_consumption.txt", 
                  header=TRUE, 
                  sep=";", 
                  na.strings = "?",
                  stringsAsFactors=FALSE)

# Concatenate "Date" and "Time" column
raw$Date <- paste(raw$Date, raw$Time)
# Convert new "Date" column into "date/time" format
raw$Date <- strptime(raw$Date, "%d/%m/%Y %H:%M:%S")
# Subset data (Date: 2007-02-01 and 2007-02-02)
raw1 <- subset(raw, raw$Date>="2007-02-01 00:00:00" & raw$Date<"2007-02-03 00:00:00")

# Line
# x: Date expressed using weekdays (no x-axis label)
# y: "Global Active Power (kilowatts)"
# title: none
# Reset default graphing parameters
plot.new() 
# Define png file parameters
png(filename="plot2.png",
    width=480,
    height=480)
# Plotting
with(raw1, 
     plot(Date, 
          Global_active_power, 
          type = "l",
          xlab = "",
          ylab = "Global Active Power (kilowatts)",
          col = "black"))
# Turns off the graphics device
dev.off()
