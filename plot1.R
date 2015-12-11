data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
feb1 <- data[ , 1] == ("1/2/2007")
feb2 <- data[ , 1] == ("2/2/2007")
feb <- feb1 | feb2
data2 <- data[feb, ]
global_active_Power <- data2[3]
string <- as.character(global_active_Power[ , 1])
GAP <- as.numeric(string)
png(filename = "plot1.png", width = 480, height = 480)
hist(GAP, col = "Red", xlab = "Global Active Power (kilowats)", ylab = "Frequency", main = "Global Active Power", cex.lab = .75, cex.axis = .75, cex.main = .85)
dev.off()