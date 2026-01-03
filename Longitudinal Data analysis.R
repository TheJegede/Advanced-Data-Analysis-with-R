setwd('C:/Users/student75/Desktop/Assignements and Project/MATH5900/Assignment 4')

df <- read.csv('frmgham2.csv',header=TRUE)
View(df)
df <- na.omit(df)

library(ggplot2)
library(GGally)


# Load necessary libraries
library(tidyverse)
library(ggplot2)
library(GGally)

# Load the dataset
df_cleaned <- read.csv('frmgham2.csv')

# Impute missing values for TOTCHOL using the median
df_cleaned$TOTCHOL[is.na(df_cleaned$TOTCHOL)] <- median(df_cleaned$TOTCHOL, na.rm = TRUE)

# Remove rows with missing HEARTRTE and BMI values
df_cleaned <- na.omit(df_cleaned[,c('HEARTRTE', 'BMI')])

# Select columns of interest for the analysis
cols_of_interest <- c('SEX', 'AGE', 'BMI', 'TOTCHOL', 'HEARTRTE')
df_analysis <- df_cleaned[cols_of_interest]


# Load necessary library
library(lmtest)

# Fit a linear model: Total Cholesterol as a function of Age
model <- lm(TOTCHOL ~ AGE, data = df_analysis)

# Summary of the model to check coefficients and model statistics
summary(model)

# Obtain residuals from the model
residuals <- resid(model)

# Optionally, add residuals to the dataframe if further analysis is needed
df_analysis$residuals <- residuals

# View the first few rows of the dataframe to check residuals
head(df_analysis)
