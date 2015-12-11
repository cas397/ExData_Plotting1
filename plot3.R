data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
feb1 <- data[ , 1] == ("1/2/2007")
feb2 <- data[ , 1] == ("2/2/2007")
feb <- feb1 | feb2
data2 <- data[feb, ]
DayChar <- as.character(data2[, 1])
TimeChar <- as.character(data2[ ,2])
DateChar <- paste(DayChar, TimeChar, sep = " ")
Dates <- strptime(DateChar, format = "%d/%m/%Y %H:%M:%S")
sb1 <- data2[7]
sb2 <- data2[8]
sb3 <- data2[9]
string1 <- as.character(sb1[ , 1])
string2 <- as.character(sb2[ , 1])
string3 <- as.character(sb3[ , 1])
subm1 <- as.numeric(string1)
subm2 <- as.numeric(string2)
subm3 <- as.numeric(string3)
png(filename = "plot3.png", width = 480, height = 480)
plot(Dates, subm1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Dates, subm2, type = "l", col = "red")
lines(Dates, subm3, type = "l", col = "blue")
legend('topright', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c('black', 'red', 'blue'), cex = 1)
dev.off()