library('pwr')
library('ggplot2')
# Load required packages
install.packages("pwr")
library(pwr)



m1 = 65.33
m2 = 59.21

sd1 = 18.55
sd2 = 18.85

sample_s1 = 75
sample_s2 = 76

pooled_standard_deviation = sqrt(((sample_s1 - 1) * sd1^2 + (sample_s2 - 1) * sd2^2)/ sample_s1 + sample_s2 - 2)
pooled_standard_deviation

d = (m2 - m1) / pooled_standard_deviation
d

library(pwr)
pwr.t.test(n=sample_s1 ,d=d,sig.level=0.05,type="paired",alternative="two.sided")

power_values = c(0.70,0.75,0.80,0.85,0.90,0.95)

# Calculate the required sample sizes for alpha = 0.05
for (power in power_values) {
  n <- pwr.t.test(d = d, power = power, sig.level = 0.05, type = "paired")$n
  print(paste("For power =", power, "and alpha = 0.05, the required sample size is", round(n)))
}

# Calculate the required sample sizes for alpha = 0.01
for (power in power_levels) {
  n <- pwr.t.test(d = d, power = power, sig.level = 0.01, type = "paired")$n
  print(paste("For power =", power, "and alpha = 0.01, the required sample size is", round(n)))
}

sample_sizes_005 = c(129, 144, 163, 186, 218, 269)

sample_sizes_001 = c(201, 220, 243, 271, 309, 369)

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


