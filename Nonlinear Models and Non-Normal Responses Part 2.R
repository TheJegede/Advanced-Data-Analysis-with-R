setwd('C:/Users/student75/Desktop/Assignements and Project/MATH5900/Project 1')


Breast_data = read.csv('breast_cancer_data.csv')
View(Breast_data)

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(pROC)

# Check for missing values
missing_values <- sum(is.na(Breast_data))
missing_values

# Drop the 'sex' column
Breast_data <- subset(Breast_data, select = -id)
Breast_data <- subset(Breast_data, select = -X)

# Check the levels of the response variable (species)
table(Breast_data$diagnosis)

# Assuming 'diagnosis' variable contains categories 'B' (benign) and 'M' (malignant)
Breast_data$diagnosis <- as.factor(ifelse(Breast_data$diagnosis == "M", 1, 0))
View(Breast_data)

# Model fitting: Logistic Regression
model <- glm(diagnosis ~ ., data = Breast_data, 
             family = binomial)

# Predictions on the data
pred <- predict(model, type = "response")

# Hosmer-Lemeshow test
hoslem.test(Breast_data$diagnosis, pred)

# Deviance residuals analysis
plot(residuals(model, type = "deviance"), pch = 16, main = "Deviance Residuals")
abline(h = 0, col = "red")

# ROC curve analysis
roc_curve <- roc(Breast_data$diagnosis, pred)
plot(roc_curve, main = "ROC Curve", col = "blue")
auc(roc_curve)

# Model coefficients
summary(model)

newmodel <- glm.nb(diagnosis ~ ., data = Breast_data)
summary(newmodel)
