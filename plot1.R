setwd('c:/data/proj1')

##Load the neat SQLDF Lib. Love the SQL.
library(sqldf)


Query <- "SELECT * from file WHERE Date ='1/2/2007' OR  Date='2/2/2007'"


##Let the IO handler sort out using our SQL Query above 
df <- read.csv.sql ('household_power_consumption.txt',Query,sep=';')


##Start drawing the PNG
png(filename="c:/data/proj1/code/plot1.png", width=480, height=480, units="px")
hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()



##We're done; Check the directory 