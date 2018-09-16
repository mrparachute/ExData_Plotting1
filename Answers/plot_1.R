setwd("/Users/Flo/coursera_R/Class 4 - Exploratory data analysis")

library(dplyr)
library(tidyr)
library(tibble)
library(lubridate)

full_set <- read.csv("household_power_consumption.txt",
                    na.strings = "?",
                    sep = ";",
                    header = TRUE)
full_set$full_date <- as.POSIXct(paste(full_set$Date, full_set$Time), format="%d/%m/%Y %H:%M:%S")
set <- full_set %>% 
        filter(year(full_date) == 2007, month(full_date) == 2, day(full_date) < 3) 