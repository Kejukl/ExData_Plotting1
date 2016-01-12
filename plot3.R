xtot<-read.table("household_power_consumption.txt",sep = ";", na.strings = "?",skip=66637, nrows=2880,colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#above is reading the file
#combining date and time into single column.  
dates <- paste(xtot$V1,xtot$V2)
datetime <- strptime(dates, "%d/%m/%Y %H:%M:%S")
#remove first tow column and introduce the new datetime column.
xtotm<-xtot[,-c(1:2)]
data<-cbind(datetime,xtotm)
#Rename column
names(data)<-c("datetime","active","reactive","V","Intensity","m1","m2","m3")
#plot
#par(mar=c(5,5,5,5),oma=c(1,1,1,1))
png(file = "plot3.png", width = 480, height = 480, units = "px")

plot(data$datetime,data$m1,type="l",col="black",xlab="",ylab="Energy sub metering",cex=0.5)
points(data$datetime,data$m2,type="l",col="blue")
points(data$datetime,data$m3,type="l",col="red")
legend("topright", lty = c(1,1,1), lwd = c(2,2,2), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()