## This is the code to create plot 4 for Coursera course "Exploratory
## Data Analysis", assignment 1.
## I have already extracted the .zip file 
## "exdata-data-household_power_consumption.zip" into my home directory.
## I have done this because the objectives focused on creating the plots,
## not on reading directly from zip file
##
hpc_data <- read.table("household_power_consumption.txt",
                       header=TRUE,sep=";"
                       ,na.strings="?",stringsAsFactors=FALSE)
##
## Selecting the two specified dates. 
##
hpc_data <- hpc_data[hpc_data$Date %in% c("1/2/2007","2/2/2007"),]
## 
## Combining first two columns into a new column called "DateTime",
## containing the full date (including time). 
##
DateTime <- strptime(paste(hpc_data$Date, hpc_data$Time, sep = ""), 
                        format="%d/%m/%Y%H:%M:%S")
hpc_data <- cbind(hpc_data, DateTime)
##
## Create Plot #4
## 
par(mfrow=c(2,2))
plot(hpc_data$DateTime, hpc_data$Global_active_power, 
     type="l", 
     xlab="", ylab="Global Active Power")
plot(hpc_data$DateTime, hpc_data$Voltage, 
     type="l", 
     xlab="datetime", ylab="Voltage")
plot(hpc_data$DateTime, hpc_data$Sub_metering_1, 
     type="l", 
     xlab="", ylab="Energy sub metering")
lines(hpc_data$DateTime, hpc_data$Sub_metering_2, 
      col="red")
lines(hpc_data$DateTime, hpc_data$Sub_metering_3, 
      col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), 
       lty="solid")
plot(hpc_data$DateTime, hpc_data$Global_reactive_power, 
     type="l", 
     xlab="datetime", ylab="Global_reactive_power")
##
## Save to plot4.png
##
dev.copy(png,file="plot4.png")
dev.off()