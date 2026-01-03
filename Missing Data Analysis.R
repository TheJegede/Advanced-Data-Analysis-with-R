setwd('')

gradC = read.csv('gradClimate.csv')

library('VIM')
library('mice')

## MISSING PROPORTIONS ##
(proportionMissing = sum(is.na(gradC))/prod(dim(gradC)))

# Missingness by Variable
missing_by_variable <- colMeans(is.na(gradC))
print(missing_by_variable)

flux(gradC)

fluxplot(gradC)

## SHADING INDICATES MAGNITUDE, RED INDICATES MISSING ##
matrixplot(gradC)

## AGGREGATION PLOT ##
aggr(gradC)

## LITTLE'S TEST ##
install.packages('BaylorEdPsych')
library('BaylorEdPsych')
install.packages('mvnmle')
library('mvnmle')

LittleMCAR(gradC)

install.packages("naniar")
library("naniar")

mcar_test(gradC)


install.packages("mice")
library(mice)

View(gradC)

# Assuming 'data' is your original dataset with missing values
# Set the number of imputed datasets to create
num_imputations <- 4

# Perform multiple imputation
imputed_data <- mice(gradC, m = num_imputations)

summary(imputed_data)

## SET FACTORS CORRECTLY ##
gradC$gender = as.factor(gradC$gender)

# Set the number of imputed datasets to create
num_imputations <- 4

# Perform multiple imputation
imputed_data <- mice(gradC, m = num_imputations)

summary(imputed_data)

## IMPUTED VALUES ##
(imputed_values = imputed_data$imp)

deptsupp_imputed = imputed_values$deptsupp
equity_imputed = imputed_values$equity
deptclim_imputed = imputed_values$deptclim
dptsocl_imputed = imputed_values$dptsocl
discrim_imputed = imputed_values$discrim
# MEANS #
sapply(deptsupp_imputed,mean)
mean(gradC$deptsupp,na.rm=TRUE)

# MEANS #
sapply(equity_imputed,mean)
mean(gradC$equity,na.rm=TRUE)

# MEANS #
sapply(deptclim_imputed,mean)
mean(gradC$deptclim,na.rm=TRUE)

# MEANS #
sapply(dptsocl_imputed,mean)
mean(gradC$dptsocl,na.rm=TRUE)

# MEANS #
sapply(discrim_imputed,mean)
mean(gradC$discrim,na.rm=TRUE)

# VARIANCES: IMPUTED SMALLER #
sapply(deptsupp_imputed,var)
var(gradC$deptsupp,na.rm=TRUE)

sapply(equity_imputed,var)
var(gradC$equity,na.rm=TRUE)

sapply(deptclim_imputed,var)
var(gradC$deptclim,na.rm=TRUE)


sapply(dptsocl_imputed,var)
var(gradC$dptsocl,na.rm=TRUE)


sapply(discrim_imputed,var)
var(gradC$discrim,na.rm=TRUE)

plot(imputed_data)

densityplot(imputed_data)
