###Welcome to my assignment###
###thank u for reviewing###
library(dplyr)
library(tidyr)
library(datasets)
library(lubridate)
library(ggplot2)
df_data <- read.table(file = "C:/Users/tallg/Documents/GitHub/R_learning/C3_W1/household_power_consumption.txt", header = F,skip = 1, sep = ";", stringsAsFactors = F,col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
###############
###############
converted_data <- mutate(df_data, time = hms(Time)  , date = as.Date.character(x= df_data$Date, format="%d/%m/%Y" ))
data_base <- select(converted_data, c("date","time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
###############
###############
selected_data <- filter(.data = data_base , date[]== c(date("2007-02-01"), date("2007-02-02")))


############

with(selected_data, plot(x= date + time, y = as.numeric(Sub_metering_1),col = "black", type = "l" , ylab = "Energy sub metering", xlab = ""))
with(selected_data, lines(x = date + time , y = as.numeric(Sub_metering_2),col = "red"))
with(selected_data, lines(x = date + time , y = as.numeric(Sub_metering_3),col = "blue"))
dev.copy(png, file = "plot3.png")
dev.off()