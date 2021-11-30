setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)

D=read_csv("hw4_dataset_for_miadam.csv")

#1 what is the mean of the temperature column?
temps = D$`Temperature(F)`
mean(temps)
#2 what is the median of the temperature column?
median(temps)

# Now take the first 200 values of this column to be our sample.
our_sample = temps[1:200]
#3 what is the sample mean?
mean(our_sample)
#4 what is the sample median?
median(our_sample)

#5 use R's.test function to obtain a 95% confidence interval for the mean temperature
t.test(our_sample, conf.level = 0.95)
#6 Use the bootstrap method with 10'000 resamples to obtain a 95% confidence interval for the mean temperature.
B = 10000
bootstrap_mean = rep(NA,B)
for (i in 1:B) {
  new_sample = sample(our_sample, replace=TRUE)
  bootstrap_mean[i] = mean(new_sample)
}
quantile(bootstrap_mean, 0.025)
quantile(bootstrap_mean, 0.975)
#7 Use the bootstrap method with 10'000 resamples to obtain a 95% confidence interval for the median temperature.
B = 10000
bootstrap_median = rep(NA,B)
for (i in 1:B) {
  new_sample = sample(our_sample, replace=TRUE)
  bootstrap_median[i] = median(new_sample)
}
quantile(bootstrap_median, 0.025)
quantile(bootstrap_median, 0.975)

