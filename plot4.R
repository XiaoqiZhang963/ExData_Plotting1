allData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
df<-subset(allData, Date == "1/2/2007" | Date == "2/2/2007")
datetime<-strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
df_datetime <- data.frame(datetime,df)

png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow = c(2,2))
with(df_datetime,{
        ## top left
        plot(datetime, Global_active_power, type="l", xlab = NA, ylab = "Global Active Power")
        ## top right
        plot(datetime, Voltage, type = "l",xlab = "datetime", ylab = "Voltage")
        ## bottom left
        plot(datetime, Sub_metering_1, type = "l",xlab = NA, ylab = "Energy sub metering")
        lines(datetime, Sub_metering_2, col = "red")
        lines(datetime, Sub_metering_3, col = "blue")
        legend("topright",lty = 1, bty = "n", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        ## bottom right
        plot(datetime, Global_reactive_power, type = "l")
                 }
     )
dev.off()