library(tidyverse)
library(lme4)
library(lmerTest)

# Load the dataset
setwd('C:/Users/student75/Desktop/Assignements and Project/MATH5900/Project 2')
file_path <- 'enrollments1.csv'
enrollment <- read.csv(file_path)

head(enrollment)

# Load required packages
library(ggplot2)
library(dplyr)
library(plotly)
library(tidyr)

# Summary statistics for numerical variables
summary(enrollment[, c("private01", "phd_granting", "students5_estimated")])

# Histograms for selected variables
hist(enrollment$students5_estimated, main = "Distribution of student")

interaction.plot(x.factor=as.factor(enrollment$year),
                 trace.factor=as.factor(enrollment$iau_id),response=enrollment$students5_estimated,
                 fun=function(x)mean(x,na.rm=TRUE))


## SPECIFIC PERCENTILES ##
ggplot(data=enrollment,aes(x=year,y=students5_estimated,group=iau_id)) + 
  geom_point() + 
  stat_summary(aes(group=1),geom="line", fun.y=function(x){quantile(x,probs=c(0.10),na.rm=TRUE)}) + 
  stat_summary(aes(group=1),geom="line", fun.y=function(x){quantile(x,probs=c(0.50),na.rm=TRUE)}) + 
  stat_summary(aes(group=1),geom="line", fun.y=function(x){quantile(x,probs=c(0.90),na.rm=TRUE)})

## INTERACTION PLOT ##
interaction.plot(x.factor=as.factor(enrollment$year),trace.factor=as.factor(enrollment$private01),
                 response=enrollment$students5_estimated,fun=function(x)mean(x,na.rm=TRUE))

library(joineR)

# Assuming 'enrollment' is your dataframe
enrollment$iau_id <- as.numeric(enrollment$iau_id)
# Assuming 'enrollment' is your dataframe
enrollment$iau_id <- as.numeric(enrollment$iau_id, na.rm = TRUE)

# Line plot of student enrollment over time by university
ggplot(enrollment, aes(x = year, y = students5_estimated, color = iau_id, group = iau_id)) +
  geom_line() +
  labs(title = "Student Enrollment Trends by University",
       x = "Year",
       y = "Student Enrollment")

# Bar chart of student enrollment by PhD-granting status
ggplot(enrollment, aes(x = phd_granting, y = students5_estimated, fill = phd_granting)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(title = "Average Student Enrollment by PhD-Granting Status",
       x = "PhD-Granting Status",
       y = "Average Student Enrollment")

# Bar chart of student enrollment by institutional type
ggplot(enrollment, aes(x = private01, y = students5_estimated, fill = factor(private01, labels = c("Public", "Private")))) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(title = "Average Student Enrollment by Institutional Type",
       x = "Institutional Type",
       y = "Average Student Enrollment")

# Overall summary statistics
summary(enrollment$students5_estimated)

# Summary statistics by year
enrollment %>%
  group_by(year) %>%
  summarize(mean_enrollment = mean(students5_estimated),
            median_enrollment = median(students5_estimated),
            sd_enrollment = sd(students5_estimated))

## VARIOGRAM ##
data = lm(students5_estimated~year+phd_granting+private01 ,data=enrollment)
resids = residuals(data)
chickVG = variogram(enrollment$iau_id,enrollment$year,resids)
plot(chickVG)

library(lme4)
# RANDOM INTERCEPT MODEL #
RIModel = lmer(students5_estimated~year+phd_granting+private01+(1|iau_id),
               data=enrollment,REML=TRUE)
RIModel
summary(RIModel)

# RANDOM TIME (SLOPE) MODEL #
RTModel = lmer(students5_estimated~year+phd_granting+private01+(1+year|iau_id),
               data=enrollment,REML=TRUE)
summary(RTModel)

AIC(RIModel,RTModel)
BIC(RIModel,RTModel)

anova(RIModel,RTModel)


RTModel


RIResid = residuals(RIModel)
RIPred = predict(RIModel)

## RESIDUALS VERSUS PREDICTED VALUES ##
qplot(RIPred,RIResid)

## RESIDUALS VERSUS PREDICTED TIME ##
qplot(enrollment$year,RIResid)
