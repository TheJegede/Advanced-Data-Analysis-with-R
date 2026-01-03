## R EXAMPLE 16: BASIC SAMPLE SIZE CALCULATIONS ##

library('pwr')
library('ggplot2')


# Data for the plot
# New random power levels
power_levels_new <- c(0.65, 0.70, 0.75, 0.80, 0.85, 0.90)

# New random sample sizes for alpha = 0.05
sample_sizes_005_new <- c(50.25, 60.35, 70.45, 80.55, 90.65, 100.75)

# New random sample sizes for alpha = 0.01
sample_sizes_001_new <- c(80.15, 90.25, 100.35, 110.45, 120.55, 130.65)


# Create a data frame
data <- data.frame(Power = rep(power_levels, 2),
                   SampleSize = c(sample_sizes_005, sample_sizes_001),
                   SignificanceLevel = rep(c('α = 0.05', 'α = 0.01'), each=6))

# Plotting
ggplot(data, aes(x = SampleSize, y = Power, color = SignificanceLevel, group = SignificanceLevel)) +
  geom_line() + geom_point() +
  labs(title = "Plot of Power vs. Sample Size",
       x = "Sample Size",
       y = "Power") +
  theme_minimal() +
  scale_color_brewer(palette = "Set2")





## EXAMPLE: TWO-SAMPLE T-TEST ##
## Set your parameters
n <- 23  # sample size
mu1 <- 12.3  # pre-intervention mean
mu2 <- 14.8  # post-intervention mean
sd <- 7.5  # standard deviation
sig.level <- 0.05  

# Calculate the effect size using Cohen's d
d <- (mu2 - mu1) / sd

# Estimate the power
power = pwr.t.test(n=n,d=d,sig.level= sig.level,type="two.sample",alternative="two.sided")
power <- pwr.t.test(n = n, d = d, sig.level = sig.level, type = "paired", alternative = "greater")$power

# Print the estimated power
print(power)



# Set your parameters
mu1 <- 12.3  # pre-intervention mean
mu2 <- 14.8  # post-intervention mean
sd <- 7.5  # standard deviation

# Calculate the effect size using Cohen's d
d <- (mu2 - mu1) / sd

# Define the power levels
power_levels <- c(0.70, 0.75, 0.80, 0.85, 0.90, 0.95)

# Calculate the required sample sizes for alpha = 0.05
for (power in power_levels) {
  n <- pwr.t.test(d = d, power = power, sig.level = 0.05, type = "paired")$n
  print(paste("For power =", power, "and alpha = 0.05, the required sample size is", round(n)))
}

# Calculate the required sample sizes for alpha = 0.01
for (power in power_levels) {
  n <- pwr.t.test(d = d, power = power, sig.level = 0.01, type = "paired")$n
  print(paste("For power =", power, "and alpha = 0.01, the required sample size is", round(n)))
}


# Install and load the ggplot2 package for creating plots
install.packages("ggplot2")
library(ggplot2)

# Define the power levels and corresponding sample sizes
power_levels <- c(0.70, 0.75, 0.80, 0.85, 0.90, 0.95)
sample_sizes_005 <- c(57, 64, 73, 83, 97, 119)  # Replace with your values
sample_sizes_001 <- c(90, 98, 108, 121, 137, 164)  # Replace with your values

# Create a data frame
df <- data.frame(
  Power = rep(power_levels, 2),
  SampleSize = c(sample_sizes_005, sample_sizes_001),
  Alpha = rep(c("0.05", "0.01"), each = length(power_levels))
)

# Create the plot
ggplot(df, aes(x = SampleSize, y = Power, color = Alpha)) +
  geom_line() +
  labs(title= "Power vs Sample Size", x = "Sample Size", y = "Power", color = "Significance Level") +
  theme_minimal()


library(pwr)
library(ggplot2)

power.curve <- function(n){
  cd <- seq(.1,1.5,.1)  #Vector of effect size
  samp.out <- NULL
  for(i in 1:length(cd)){
    power <-  pwr.t.test(d=cd[i],n=n,sig.level=.05,type="two.sample")$power
    power <-  data.frame(effect.size=cd[i],power=power)
    samp.out <- rbind(samp.out,power)
  }
  ggplot(samp.out, aes(effect.size,power))+ 
    geom_line() +  
    geom_point() + 
    theme_minimal() + 
    geom_hline(yintercept = .8,lty=2, color='blue') + 
    labs(title=paste0("t-test Power Curve for n=", n), x="Cohen's d", y="Power") 
}

n <- 25
power.curve(n)

