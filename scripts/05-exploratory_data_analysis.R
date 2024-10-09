#### Preamble ####
# Purpose: Basic Exploratory Data Analysis.
# Author: Marcus Barnes
# Date: October 9, 2024
# Contact: marcus.barnes@utoronto.ca
# License: MIT
# Pre-requisites: TBD
# Any other information needed? TDB


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(here)
library(ggplot2)

#### Read data ####
data <- read.csv("data/01-raw_data/raw_homeless_deaths_by_month_data.csv")

# Descirptive Statistics, in particular, we are interested in Count.
summary(data)
summary(data$Count)

# Mean, median, and standard deviation
mean(data$Count, na.rm = TRUE)
median(data$Count, na.rm = TRUE)
sd(data$Count, na.rm = TRUE)

# Convert Month.of.death to a date format
data$Date <- as.Date(paste(data$Year.of.death, match(data$Month.of.death, month.name), "01", sep = "-"))

# Time series plot
ggplot(data, aes(x = Date, y = Count)) +
  geom_line() +
  labs(title = "Count Over Time", x = "Date", y = "Count")

# Histogram of 'Count'
ggplot(data, aes(x = Count)) +
  geom_histogram(binwidth = 2, fill = "blue", color = "black") +
  labs(title = "Distribution of Count", x = "Count", y = "Frequency")


# Time series plot of count over time.
ggplot(data, aes(x = Date, y = Count)) +
  geom_line() +
  labs(title = "Count Over Time", x = "Date", y = "Count")



