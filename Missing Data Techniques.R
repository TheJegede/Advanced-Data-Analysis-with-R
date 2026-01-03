setwd('C:/Users/student75/Desktop/Assignements and Project/MATH5900/Project 3')

enrollment = read.csv('Nigeria dataset.csv')

View(enrollment)

(proportionMissing = sum(is.na(enrollment))/prod(dim(enrollment)))

# Missingness by Variable
missing_by_variable <- colMeans(is.na(enrollment))
print(missing_by_variable)

enrollments <- enrollment[, c( "iau_id", "private01", "m_granting", "b_granting", 
                              "phd_granting", "year", "students5_estimated")]

(proportionMissing = sum(is.na(enrollments))/prod(dim(enrollments)))

# Missingness by Variable
missing_by_variable <- colMeans(is.na(enrollments))
print(missing_by_variable)

data_summary <- sapply(enrollments, function(x) {
  data_length <- length(x)
  num_missing <- sum(is.na(x))
  num_observed <- data_length - num_missing
  percent_complete <- (num_observed / data_length) * 100
  percent_observed <- percent_complete  # In this context, observed = complete
  percent_unobserved <- (num_missing / data_length) * 100
  
  return(c(Percent_Complete = percent_complete, 
           Percent_Observed = percent_observed, 
           Percent_Unobserved = percent_unobserved))
})


# Print the summary
print(data_summary)

aggr_plot <- aggr(enrollments, col=c('red','blue'), numbers=TRUE, sortVars=TRUE,
                  labels=names(enrollments), cex.axis=.7, gap=3, ylab=c("The Aggregation plot of missing data Pattern", ""))

library('ggplot2')

gg_miss_var(enrollments) +
  ggtitle('Dot Chart for the selected variables') + theme(plot.title = element_text(hjust = 0.5))

matrixplot(enrollments) + title('Matrix plot showing missingness of all Variables')





library('VIM')
library('mice')
flux(enrollments)

fluxplot(enrollment)

summary(enrollment)

 

install.packages("naniar")
library("naniar")

mcar_test(enrollments)


num_imputations <- 3

# Perform multiple imputation
imputed_data <- mice(enrollment, m = num_imputations)

summary(imputed_data)

## IMPUTED VALUES ##
(imputed_values = imputed_data$imp)

m_granting_imputed = imputed_values$m_granting
b_granting_imputed = imputed_values$b_granting
students5_estimated_imputed = imputed_values$students5_estimated 


# MEANS #
sapply(m_granting_imputed,mean)
mean(enrollments$m_granting,na.rm=TRUE)

sapply(b_granting_imputed,mean)
mean(enrollments$b_granting,na.rm=TRUE)

sapply(students5_estimated_imputed ,mean)
mean(enrollments$students5_estimated ,na.rm=TRUE)

# VARIANCES: IMPUTED SMALLER #
sapply(m_granting_imputed,var)
var(enrollments$m_granting,na.rm=TRUE)

sapply(b_granting_imputed,var)
var(enrollments$b_granting,na.rm=TRUE)

sapply(students5_estimated_imputed,var)
var(enrollments$students5_estimated,na.rm=TRUE)

plot(imputed_data)
densityplot(imputed_data)
