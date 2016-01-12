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
hist(data$active,xlab="Global active power (KiloWatt)",main="Global Active Power",col="red")
dev.copy(png,file="plot1.png") 
dev.off()