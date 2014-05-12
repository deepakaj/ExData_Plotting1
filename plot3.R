setwd('c:/data/proj1')

##Load the neat SQLDF Lib. Love the SQL.
library(sqldf)


Query <- "SELECT * from file WHERE Date ='1/2/2007' OR  Date='2/2/2007'"


##Let the IO handler sort out using our SQL Query above 
df <- read.csv.sql ('household_power_consumption.txt',Query,sep=';')



##plot em!
plot2 <- as.numeric(df$Sub_metering_1)
days <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

plot(days, plot2, ylab='Energy sub metering', xlab="")
lines(days, df$Sub_metering_2,col='red')
lines(days, df$Sub_metering_3,col='blue')

axis(1, at=c(1, as.integer(nrow(df)/2), nrow(df)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Start drawing the PNG
dev.copy(png, file = "c:/data/proj1/code/plot3.png", width = 480, height = 480, units = "px")
dev.off()


##We're done; Check the directory 