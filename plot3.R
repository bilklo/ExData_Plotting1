#Plots line chart
plot3<- function()
{
  #load the data
  myData <- read.table("household_power_consumption.txt", head=TRUE, sep = ";")
  
  #Combine Date and Time 
  myData$Time<-paste(myData$Date,myData$Time, sep = " ")
  
  #convert to date the Date column
  myData$Date <- as.Date(myData$Date, format="%d/%m/%Y")
  myData$Time <- strptime(myData$Time, format="%d/%m/%Y %H:%M:%S")
  
  #convert Sub_metering_1,Sub_metering_2,Sub_metering_3 to numeric
  myData$Sub_metering_1 <- as.numeric(as.character(myData$Sub_metering_1))
  myData$Sub_metering_2 <- as.numeric(as.character(myData$Sub_metering_2)) 
  myData$Sub_metering_3 <- as.numeric(as.character(myData$Sub_metering_3))  
  
  #subset data
  startDay<-as.Date(c("2007-02-01"), format="%Y-%m-%d")
  endDay<-as.Date(c("2007-02-02"), format="%Y-%m-%d")
  subsetOfData<-subset(myData,myData$Date>=startDay & myData$Date<=endDay)
  
  #create the histogram
  #PNG image
  png("plot2.png",width = 480, height = 480, bg="transparent")
  plot(subsetOfData$Time, subsetOfData$Sub_metering_1, type='l',col="black")
  lines(subsetOfData$Time, subsetOfData$Sub_metering_2, type='l',col="red")
  lines(subsetOfData$Time, subsetOfData$Sub_metering_3, type='l',col="blue")
  
  #close
  dev.off()
}