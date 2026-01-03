# R FILE FOR ANALYSIS OF SHIP ACCIDENTS DATA #


setwd('C:/Users/student75/Desktop/Assignements and Project/MATH5900/Assignment 2')

ShipData <- read.csv('ShipAccidents.csv',header=TRUE)
ShipData = na.omit(ShipData)
str(ShipData)

attach(ShipData)

library(ggplot2)

# DESCRIPTIVES #
hist(accidents)
boxplot(accidents)

mean(accidents)
var(accidents)
summary(accidents)
table(accidents)

# Fit the linear regression model
model <- lm(accidents ~ exposure + construction1 + construction2 + construction3 + operational, data = ShipData)

# Display the summary of the model
summary(model)

# Plotting residuals vs fitted values
plot(model$fitted.values, model$residuals, xlab = "Fitted Values", ylab = "Residuals", main = "Residuals vs Fitted")

# Calculate residuals
residuals <- residuals(model)

# Calculate Durbin-Watson statistic
dw_statistic <- sum(diff(residuals)^2) / sum(residuals^2)

# Print Durbin-Watson statistic
print(dw_statistic)

# Plotting residuals vs fitted values
plot(model$fitted.values, sqrt(abs(model$residuals)), xlab = "Fitted Values", ylab = "Sqrt(|Residuals|)", main = "Scale-Location Plot")

# Normal Q-Q plot of residuals 
qqnorm(model$residuals, main = "Normal Q-Q Plot")
qqline(model$residuals)

