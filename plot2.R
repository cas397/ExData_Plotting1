data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
feb1 <- data[ , 1] == ("1/2/2007")
feb2 <- data[ , 1] == ("2/2/2007")
feb <- feb1 | feb2
data2 <- data[feb, ]
global_active_Power <- data2[3]
string <- as.character(global_active_Power[ , 1])
GAP <- as.numeric(string)
DayChar <- as.character(data2[, 1])
TimeChar <- as.character(data2[ ,2])
DateChar <- paste(DayChar, TimeChar, sep = " ")
Dates <- strptime(DateChar, format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480)
plot(Dates, GAP, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)", cex.axis = .75)
dev.off()