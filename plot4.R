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

global_active_Power <- data2[3]
GAPstring <- as.character(global_active_Power[ , 1])
GAP <- as.numeric(GAPstring)

global_reactive_Power <- data2[4]
GRPstring <- as.character(global_reactive_Power[ , 1])
GRP <- as.numeric(GRPstring)

Volts <- data2[5]
Voltstring <- as.character(Volts[ , 1])
Voltage <- as.numeric(Voltstring)

png(filename = "plot4.png", width = 480, height = 480)

par(mfcol = c(2, 2))

plot(Dates, GAP, type = "l", main = "", xlab = "", ylab = "Global Active Power", cex.lab = .75)

plot(Dates, subm1, type = "l", ylab = "Energy sub metering", xlab = "", cex.lab = .75)
lines(Dates, subm2, type = "l", col = "red")
lines(Dates, subm3, type = "l", col = "blue")
legend('topright', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c('black', 'red', 'blue'), cex = .5, bty = "n")

plot(Dates, Voltage, type = "l", main = "", xlab = "datetime", ylab = "Voltage", cex.lab = .75)

plot(Dates, GRP, type = "l", main = "", xlab = "datetime", ylab = "Global_reactive_power", cex.lab = .75)

dev.off()