setwd("/Users/Flo/coursera_R/Class 4 - Exploratory data analysis/Week1")

library(dplyr)
library(tidyr)
library(tibble)
library(lubridate)

# Extract data
full_set <- read.csv("household_power_consumption.txt",
                     na.strings = "?",
                     sep = ";",
                     header = TRUE)
full_set$full_date <- as.POSIXct(paste(full_set$Date, full_set$Time), format="%d/%m/%Y %H:%M:%S")
set <- full_set %>% 
        filter(year(full_date) == 2007, month(full_date) == 2, day(full_date) < 3) 

# Create chart
setwd("/Users/Flo/coursera_R/Class 4 - Exploratory data analysis/Week1/Answers")
png(file = "plot4.png", width=480, height=480)
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(1,1,1,1))
with(set, plot(full_date,
               Global_active_power,
               type = "l",
               lty = 1,
               xlab = "",
               ylab = "Global Active Power"))

with(set, plot(full_date,
               Voltage,
               type = "l",
               lty = 1,
               xlab = "datetime"))

with(set, plot(full_date,
               Sub_metering_1,
               type = "l",
               lty = 1,
               col = "black",
               xlab = "",
               ylab = "Energy sub metering"))
points(set$full_date,
       set$Sub_metering_2,
       type = "l",
       lty = 1,
       col = "red")
points(set$full_date,
       set$Sub_metering_3,
       type = "l",
       lty = 1,
       col = "blue")
legend("topright",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1:1,
       cex=0.8,
       box.lty=0)

with(set, plot(full_date,
               Global_reactive_power,
               type = "l",
               lty = 1,
               xlab = "datetime"))
dev.off()