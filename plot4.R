#Plots 3 line charts
plot4<- function()
{
  #load the data
  myData <- read.table("household_power_consumption.txt", head=TRUE, sep = ";")
  
  #Combine Date and Time 
  myData$Time<-paste(myData$Date,myData$Time, sep = " ")
  
  #convert to date the Date column
  myData$Date <- as.Date(myData$Date, format="%d/%m/%Y")
  myData$Time <- strptime(myData$Time, format="%d/%m/%Y %H:%M:%S")
  
  #convert Sub_metering_1,Sub_metering_2,Sub_metering_3 to numeric
  myData$Global_active_power <- as.numeric(as.character(myData$Global_active_power))
  myData$Sub_metering_1 <- as.numeric(as.character(myData$Sub_metering_1))
  myData$Sub_metering_2 <- as.numeric(as.character(myData$Sub_metering_2)) 
  myData$Sub_metering_3 <- as.numeric(as.character(myData$Sub_metering_3))
  myData$Voltage <- as.numeric(as.character(myData$Voltage))  
  myData$Global_reactive_power <- as.numeric(as.character(myData$Global_reactive_power))    
  
  #subset data
  startDay<-as.Date(c("2007-02-01"), format="%Y-%m-%d")
  endDay<-as.Date(c("2007-02-02"), format="%Y-%m-%d")
  subsetOfData<-subset(myData,myData$Date>=startDay & myData$Date<=endDay)
  
  #create the histogram
  #PNG image
  png("plot4.png",width = 480, height = 480, bg="transparent")
  attach(mtcars)
  par(mfrow=c(2,2))
  
  plot(subsetOfData$Time,subsetOfData$Global_active_power, type='l', 
       ylab = "Global Active Power (Kilowatts)", xlab = "")
  
  plot(subsetOfData$Time,subsetOfData$Voltage, type='l', 
       ylab = "Voltage", xlab = "datetime")
  
  plot(subsetOfData$Time, subsetOfData$Sub_metering_1, type='l',col="black", 
       xlab = "", ylab="Energy Sub metering")
  lines(subsetOfData$Time, subsetOfData$Sub_metering_2, type='l',col="red", 
        xlab = "", ylab="")
  lines(subsetOfData$Time, subsetOfData$Sub_metering_3, type='l',col="blue",
        xlab = "", ylab="")
  
  legend("topright",pch=NA, col=c("black","blue","red"), legend=c("Sub_metering_1",
                                                                  "Sub_metering_2",
                                                                  "Sub_metering_3"),
         lwd=2, xpd = TRUE, bty ="n")
  
  plot(subsetOfData$Time,subsetOfData$Global_reactive_power, type='l', 
       ylab = "Voltage", xlab = "datetime")
  
  #close
  dev.off()
}