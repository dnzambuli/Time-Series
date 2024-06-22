# Load necessary libraries
library(tidyverse)
library(forecast)
library(TTR)
library(readxl)
library(forecast)


# Load the data
# Assume the data is in a CSV file named 'tourist_data.csv' with columns 'Year', 'Month', and 'Tourists'
tourist_data <- read_excel("Mid-sem dataset.xlsx")

# Create a time series object
ts_data <- ts(tourist_data$No_of_tourists, start = c(2019, 1), frequency = 12)

# Calculate the moving average
moving_avg <- ma(ts_data, order = 12)

# Calculate the ratio to moving average
ratio_to_moving_avg <- ts_data / moving_avg

# Calculate seasonal indices
seasonal_indices <- aggregate(ratio_to_moving_avg, nfrequency = 12, FUN = mean, na.rm = TRUE)
seasonal_indices <- rep(seasonal_indices, length = length(ts_data))

# Plot the seasonal indices
plot(seasonal_indices, type = "o", main = "Seasonal Indices", xlab = "Month", ylab = "Seasonal Index")
