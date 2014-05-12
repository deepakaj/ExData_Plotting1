setwd('c:/data/proj1')

##Load the neat SQLDF Lib. Love the SQL.
library(sqldf)


Query <- "SELECT * from file WHERE Date ='1/2/2007' OR  Date='2/2/2007'"


##Let the IO handler sort out using our SQL Query above 
df <- read.csv.sql ('household_power_consumption.txt',Query,sep=';')


##setup rows, cols
png (filename='c:/data/proj1/code/plot4.png')
par(mfrow=c(2,2))


#df[,1] <- as.Date(df[,1],format = '%d/%m/%Y')
dt <- paste (as.character(df$Date),df$Time,sep=' ')
dt <- strptime (dt, format='%d/%m/%Y %H:%M:%S')
df$DateTime <- dt


##plot em!
hist(df$Global_active_power,  main='',xlab="Global Active Power (kilowatts)",col='red')

plot(df$DateTime, df$Voltage,type='l',ylab='Voltage',xlab='datetime')

plot(df$DateTime, df$Sub_metering_1 ,type='l',ylab='Energy sub metering',xlab='')
lines(df$DateTime, df$Sub_metering_2,col='red')
lines(df$DateTime, df$Sub_metering_3,col='blue')
legend ('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_2'),lwd=c(1,1,1),col=c('black','red','blue'),bty='n',pt.cex=.5)

plot(df$DateTime, df$Global_reactive_power,type='l',xlab='datetime')

dev.off()