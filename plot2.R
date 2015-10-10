install.packages("dplyr")
library(dplyr)
install.packages("readr")
library("readr")
#Launch Graphic Device
png(file = "plot2.png")

#Get Data from File convertin "?" to "NA"
df <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))

#Convert Date and Time to POSIXlt
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$timetemp <- paste(df$Date, df$Time)  
df$Time <- strptime(df$timetemp, format = "%Y-%m-%d %H:%M:%S")

#Subset Data frame for taking data for plotting
plot_base <- subset(df,Date >= "2007-02-01" & Date <= "2007-02-02")

#Final Plot
with(plot_base, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

#Close Device
dev.off()
