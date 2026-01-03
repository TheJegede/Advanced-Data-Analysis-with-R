setwd('C:/Users/student75/Desktop/Assignements and Project/MATH5900/Project 1')


Penguins = read.csv('penguins.csv')
View(Penguins)

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(pROC)

# Drop the 'sex' column
Penguins <- select(Penguins, -sex)

# Check for missing values
sum(is.na(Penguins))

# Remove rows with missing values
penguins <- na.omit(Penguins)


# Explore the structure of the dataset
str(Penguins)

# Check the first few rows of the dataset
head(Penguins)

Penguins <- Penguins[complete.cases(Penguins), ]

# Check the levels of the response variable (species)
table(Penguins$species)


# Convert 'species' to a factor variable
Penguins$species <- factor(Penguins$species)

# Encode 'species' into binary values
Penguins$species <- as.numeric(Penguins$species) - 1


# Fit a logistic regression model without splitting the data
logit_model <- glm(species ~ bill_length_mm + bill_depth_mm + flipper_length_mm + body_mass_g, data = Penguins)

# Summary of the logistic regression model
summary(logit_model)

# Scatterplot of fitted values vs. residuals
plot(logit_model$fitted.values, residuals(logit_model), 
     xlab = "Fitted values", ylab = "Residuals",
     main = "Residuals vs. Fitted values")

# Plot residuals vs. row number
plot(residuals(logit_model) ~ 1:nrow(Penguins),
     xlab = "Row number", ylab = "Residuals",
     main = "Residuals vs. Row number")


# Plot deviance residuals
plot(predict(logit_model, type = "response"), 
     residuals(logit_model, type = "deviance"), 
     xlab = "Fitted values", ylab = "Deviance residuals",
     main = "Deviance Residuals vs. Fitted values")

library(ResourceSelection)
# Hosmer-Lemeshow test for goodness-of-fit
hoslem.test(Penguins$species, fitted(logit_model))

# Predict the species of penguins on the entire dataset
predictions <- predict(logit_model, type = "response")


# ROC curve analysis
roc <- roc(penguins$species, fitted(logit_model))
auc <- auc(roc)
auc
plot(roc, main = paste("ROC Curve (AUC =", round(auc, 2), ")"))
