install.packages("dplyr")
library(dplyr)
install.packages("readr")
library("readr")
#Launch Graphic Device
png(file = "plot1.png")

#Get Data from File convertin "?" to "NA"
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

#Convert Date
household_power_consumption$Date<-as.Date(household_power_consumption$Date, "%d/%m/%Y")

#Subset Data set - Plyr exercise
x<-filter(household_power_consumption, Date >= "2007-02-01" & Date <= "2007-02-02")

#lets plot it...
par(mar = c(4,4,1,2))
hist(x$Global_active_power, xlab= "Global Active Power (kilowatts)",col="red", main = "Global Active Power")


#Close Device
dev.off()






