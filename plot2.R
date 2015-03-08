#Plots line chart
plot2<- function()
{
  #load the data
  myData <- read.table("household_power_consumption.txt", head=TRUE, sep = ";")
  
  #Combine Date and Time 
  myData$Time<-paste(myData$Date,myData$Time, sep = " ")
  
  #convert to date the Date column
  myData$Date <- as.Date(myData$Date, format="%d/%m/%Y")
  myData$Time <- strptime(myData$Time, format="%d/%m/%Y %H:%M:%S")

  #convert Global_active_power to numeric
  myData$Global_active_power <- as.numeric(as.character(myData$Global_active_power))
  
  #subset data
  startDay<-as.Date(c("2007-02-01"), format="%Y-%m-%d")
  endDay<-as.Date(c("2007-02-02"), format="%Y-%m-%d")
  subsetOfData<-subset(myData,myData$Date>=startDay & myData$Date<=endDay)
  
  #create the histogram
  #PNG image
  png("plot2.png",width = 480, height = 480, bg="transparent")
  plot(subsetOfData$Time,subsetOfData$Global_active_power, type='l', 
       ylab = "Global Active Power (Kilowatts)", xlab = "")
  
  #close
  dev.off()
}