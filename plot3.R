install.packages("dplyr")
library(dplyr)
install.packages("readr")
library("readr")
#Launch Graphic Device
png(file = "plot3.png")

#Get Data from File convertin "?" to "NA"
df <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))

#Convert Date and Time to POSIXlt
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$timetemp <- paste(df$Date, df$Time)  
df$Time <- strptime(df$timetemp, format = "%Y-%m-%d %H:%M:%S")

#Subset Data frame for taking data for plotting
plot_base <- subset(df,Date >= "2007-02-01" & Date <= "2007-02-02")

#Final Plot: start plot Sub_metering_1 and then 2 lines are addet to the plot for the other Sub_metering
par(mar=c(5, 4, 4, 2))
with(plot_base, plot(Time, Sub_metering_1, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
with(plot_base, lines(Time, Sub_metering_2, col="red"))
with(plot_base, lines(Time, Sub_metering_3, col="blue"))
leg_text<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
leg_col<-c("black", "red", "blue")
legend("topright", legend=leg_text, col = leg_col, lty = 1)

#Close Device
dev.off()
