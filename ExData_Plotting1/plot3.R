##Project 1 - Exploratory Data Analysis
#Read data in
dat<- read.csv("power.csv", header=TRUE, stringsAsFactors = FALSE)
#subset data
data<- dat[which(dat$Date %in% c("01/02/2007","02/02/2007")),]
#convert date column to date
data$Date <- as.Date(data$Date, "%d/%m/%Y")
#convert time to time
data$T<- paste(data$Date, data$Time)
data$Time<- strptime(data$T, "%Y-%m-%d %H:%M:%S")
#convert to numeric for 1st plot
data$Global_active_power<- as.numeric(data$Global_active_power)
#create plit file

#plot3
with(data, plot(Time,Sub_metering_1, type = "n", ylab = "Energy sub metering"))
with(data, lines(Time, Sub_metering_1))
with(data, lines(Time, Sub_metering_2, col = "red"))
with(data, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", lty = c(1,1), col = c("black", "red", "blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
