#Plots the histogram
plot1<- function()
{
  #load the data
  myData <- read.table("household_power_consumption.txt", head=TRUE, sep = ";")
  
  #convert to date the Date column
  myData$Date <- as.Date(myData$Date, format="%d/%m/%Y")
  #convert Global_active_power to numeric
  myData$Global_active_power <- as.numeric(as.character(myData$Global_active_power))
  
  #subset data
  startDay<-as.Date(c("2007-02-01"), format="%Y-%m-%d")
  endDay<-as.Date(c("2007-02-02"), format="%Y-%m-%d")
  subsetOfData<-subset(myData,myData$Date>=startDay & myData$Date<=endDay)
  
  #create the histogram
  #PNG image
  png("plot1.png",width = 480, height = 480)
  hist(subsetOfData$Global_active_power,main="Global Active Power", 
       col="red", xlab = "Global Active Power (Kilowatts)")
  
  #close
  dev.off()
}