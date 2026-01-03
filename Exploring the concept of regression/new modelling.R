# R FILE FOR ANALYSIS OF SHIP ACCIDENTS DATA #


setwd('C:/Users/student75/Desktop/Assignements and Project/MATH5900/Assignment 2')

ShipData <- read.csv('ShipAccidents.csv',header=TRUE)
#str(ShipData)

#summary(ShipData)

# Fit the linear regression model
model <- lm(accidents ~ exposure + construction1 + construction2 + construction3, data = ShipData)

# Display the summary of the model

summary(model)

# Plotting residuals vs fitted values
plot(model$fitted.values, model$residuals, xlab = "Fitted Values", ylab = "Residuals", main = "Residuals vs Fitted")


# Plotting residuals vs fitted values
plot(model$fitted.values, model$residuals, xlab = "Fitted Values", ylab = "Residuals", main = "Scale-Location Plot")

install.packages("car")
library("car")

ncvTest(model)

install.packages("nortest")
library("nortest")

ad.test(model$residuals)

library(MASS)
bct <- boxcox(model)
# Add 0.01 to the response variable to make it positive
ShipData$new_accidents <- ShipData$accidents + 0.01
bct <- boxcox(model)


# Transform the outcome variable
ShipData$log_accidents <- log(ShipData$new_accidents)  # Adding 1 to avoid log(0)

lm_model <- lm(log_accidents ~ exposure + construction1 + construction2 + construction3, data = ShipData)

# Plotting residuals vs fitted values
plot(lm_model$fitted.values, lm_model$residuals, xlab = "Fitted Values", ylab = "Residuals", main = "Residuals vs Fitted")
summary(lm_model)

# Residuals vs. Fitted values plot for linearity
plot(lm_model$residuals ~ lm_model$fitted.values, xlab = "Fitted values", ylab = "Residuals", main = "Residuals vs. Fitted")

plot(lm_model$fitted.values, lm_model$residuals, xlab = "Fitted values", ylab = "Residuals", main = "Residuals vs. Fitted", col = "blue")
abline(h = 0, lty = 2, col = "red")


# Visualize constant variance (homoscedasticity) assumption
plot(lm_model$fitted.values, lm_model$residuals, xlab = "Fitted values", ylab = "Residuals", main = "Constant variance Check", pch = 19)
abline(h = 0, col = "red")
ncvTest(lm_model)

# Check normal probability plot
qqnorm(lm_model$residuals, main = "Normal Q-Q Plot of Residuals")
qqline(lm_model$residuals) 

# Perform Shapiro-Wilk test for normality
shapiro.test(lm_model$residuals)



# question 3
# CREATE A BINARY RESPONSE VARIABLE #
binary_acc <- ifelse(ShipData$accidents > 0, 1, 0)
# Descriptive statistics of the binary response variable
table(binary_acc, ShipData$accidents)
summary(binary_acc)

table(ShipData$exposure, binary_acc)
table(ShipData$construction1, binary_acc)
table(ShipData$construction2, binary_acc)
table(ShipData$construction3, binary_acc)
table(ShipData$operational, binary_acc)
table(ShipData$service_months, binary_acc)

library(ggplot2)
qplot(ShipData$exposure, binary_acc)



# Fit logistic regression model
logist_model <- glm(binary_acc ~ exposure + construction1 + construction2 + construction3, family=binomial,  data = ShipData)
summary(logist_model)

install.packages("ResourceSelection")
library(ResourceSelection)
hoslem.test(binary_acc,logist_model$fitted.values)

install.packages("pROC")
library(pROC)

roc(binary_acc~logist_model$fitted.values,plot=TRUE)
auc(roc_curve)

fivenum(summary(logit_model)$deviance.resid)
