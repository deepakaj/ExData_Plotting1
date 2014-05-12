setwd('c:/data/proj1')

##Load the neat SQLDF Lib. Love the SQL.
library(sqldf)


Query <- "SELECT * from file WHERE Date ='1/2/2007' OR  Date='2/2/2007'"


##Let the IO handler sort out using our SQL Query above 
df <- read.csv.sql ('household_power_consumption.txt',Query,sep=';')




#new datetime column
#dtime <- paste (as.character(df$Date),df$Time,sep=' ')
#dtime <- strptime (dtime, format='%d/%m/%Y %H:%M:%S')
#df$DateTime <- dtime


plot2 <- as.numeric(df$Global_active_power)
days <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
plot(days, plot2, xlab="", ylab="Global Active Power (kilowatts)", type="l")
##Start drawing the PNG
dev.copy(png, file = "c:/data/proj1/code/plot2.png", width = 480, height = 480, units = "px")
dev.off()


##We're done; Check the directory 