plot2 <- function() {
  df<-read.csv2("./household_power_consumption.txt",header=TRUE,sep = ";")
  dd<-rbind(df[as.Date(df$Date,"%d/%m/%Y" )==as.Date("01/02/2007","%d/%m/%Y" ),],df[as.Date(df$Date,"%d/%m/%Y" )==as.Date("02/02/2007","%d/%m/%Y" ),])
  dd["timestamp"] <- as.POSIXct(paste(dd$Date, dd$Time), format = "%d/%m/%Y %H:%M:%S")
  dd["nGlobal_active_Power"]<-as.numeric(as.character(dd$Global_active_power))
  dd["nGlobal_reactive_power"]<-as.numeric(as.character(dd$Global_reactive_power))
  dd["nVoltage"]<-as.numeric(as.character(dd$Voltage))
  dd["nGlobal_intensity"]<-as.numeric(as.character(dd$Global_intensity))
  dd["nSub_metering_1"]<-as.numeric(as.character(dd$Sub_metering_1))
  dd["nSub_metering_2"]<-as.numeric(as.character(dd$Sub_metering_2))
  dd["nSub_metering_3"]<-as.numeric(as.character(dd$Sub_metering_3))
  dd$Global_active_power<-NULL
  dd$Global_reactive_power<-NULL
  dd$Voltage<-NULL
  dd$Global_intensity<-NULL
  dd$Sub_metering_1<-NULL
  dd$Sub_metering_2<-NULL
  dd$Sub_metering_3<-NULL
  ## plotting the histogram
  png(filename = "./Plot2.png",width = 480, height = 480, units = "px")
  with(dd,plot(dd$timestamp,dd$nGlobal_active_Power,type = "l",xlab = " ",
               ylab = "Global Active Power (kilowatts)"))
  dev.off()
  
  }
