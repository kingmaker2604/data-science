# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the tips.csv dataset
tips <- read.csv("Desktop/q1/tips.csv")

# Explore the dataset
head(tips)
summary(tips)

# Perform linear regression
lm_model <- lm(tip ~ total_bill + size, data = tips)

# View the summary of the linear regression model
summary(lm_model)

# Visualize the regression results
ggplot(tips, aes(x = total_bill, y = tip)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Linear Regression: Tip ~ Total Bill")
