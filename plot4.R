# Coursera / John Hopkins Data Science Specialization - Course 4 - Week 1 Project
# Construct Plot 4

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

# 2x2 graph

# Reset default graphing parameters
plot.new() 

# Define png file parameters
png(filename="plot4.png",
    width=480,
    height=480)

# Define 2x2 grid - filling sub-plots along row 1 then row 2
par(mfrow=c(2,2))

# Sub-plot 1 (top-left) - Same plot as "plot2.R"
# x: Date expressed using weekdays (no x-axis label)
# y: "Global Active Power"
# title: none
with(raw1, 
     plot(Date, 
          Global_active_power, 
          type = "l",
          xlab = "",
          ylab = "Global Active Power",
          col = "black"))

# Sub-plot 2 (top-right) 
# x: "datetime"
# y: "Voltage"
# title: none
with(raw1, 
     plot(Date, 
          Voltage, 
          type = "l",
          xlab = "datetime",
          ylab = "Voltage",
          col = "black"))

# Sub-plot 3 (bottom-left) - Same plot as "plot3.R"
# x: Date expressed using weekdays (no x-axis label)
# y: "Energy sub metering"
# title: none
with(raw1, 
     plot(Date, 
          Sub_metering_1, 
          type = "l",
          xlab = "",
          ylab = "Energy sub metering",
          col = "black"))
with(raw1,
     lines(Date,
           Sub_metering_2,
           col = "red"))
with(raw1,
     lines(Date,
           Sub_metering_3,
           col = "blue"))
legend("topright", 
       lty = c(1,1,1), 
       col = c("black","red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Sub-plot 4 (bottom-right) 
# x: "datetime"
# y: "Global_reactive_power"
# title: none
with(raw1, 
     plot(Date, 
          Global_reactive_power, 
          type = "l",
          xlab = "datetime",
          ylab = "Global_reactive_power",
          col = "black"))

# Turns off the graphics device
dev.off()
