allData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
df<-subset(allData, Date == "1/2/2007" | Date == "2/2/2007")
datetime<-strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
df_datetime <- data.frame(datetime,df)

png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")
with(df_datetime,plot(datetime, Global_active_power, type="l", xlab = NA, ylab = "Global Active Power (kilowatts)"))
dev.off()