# Load the necessary package
install.packages("betareg")
library(betareg)

# Load the dataset
data("FoodExpenditure", package = "betareg")

# Explore the dataset
head(FoodExpenditure)
summary(FoodExpenditure)

# i. Linear regression model
lm_model <- lm(food ~ income + persons, data = FoodExpenditure)
summary(lm_model)
# Linearity
plot(lm_model, which = 1)

# Homoscedasticity
plot(lm_model, which = 3)
library("car")

ncvTest(lm_model)

# Normality of residuals
plot(lm_model, which = 2)

# Perform Shapiro-Wilk test for normality
shapiro.test(residuals(lm_model))

library("nortest")

ad.test(lm_model$residuals)

foodPer = food/income


beta_model <- betareg(foodPer ~ income + persons, link="logit")
summary(beta_model)


