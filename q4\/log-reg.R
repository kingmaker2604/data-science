# Load necessary libraries
library(dplyr)

# Load the tips.csv dataset
tips <- read.csv("Desktop/q1/tips.csv")

# Explore the dataset
head(tips)
summary(tips)

# Create a binary outcome variable (e.g., "high_tip" if tip > 5)
tips <- tips %>%
  mutate(high_tip = ifelse(tip > 5, 1, 0))

# Perform logistic regression
logit_model <- glm(high_tip ~ total_bill + size, data = tips, family = binomial)

# View the summary of the logistic regression model
summary(logit_model)# Load necessary libraries
library(dplyr)

# Load the tips.csv dataset
tips <- read.csv("Desktop/q1/tips.csv")

# Explore the dataset
head(tips)
summary(tips)

# Create a binary outcome variable (e.g., "high_tip" if tip > 5)
tips <- tips %>%
  mutate(high_tip = ifelse(tip > 5, 1, 0))

# Implement logistic regression without glm
logistic_regression <- function(data, predictors, target, learning_rate, num_iterations) {
  # Initialize coefficients
  coefficients <- rep(0, length(predictors))
  
  for (iteration in 1:num_iterations) {
    # Calculate predicted probabilities
    logits <- rowSums(coefficients * data[, predictors])
    probabilities <- 1 / (1 + exp(-logits))
    
    # Update coefficients using gradient descent
    for (i in 1:length(predictors)) {
      gradient <- -sum(data[, predictors[i]] * (data[, target] - probabilities))
      coefficients[i] <- coefficients[i] - learning_rate * gradient
    }
  }
  
  return(coefficients)
}

# Define predictors and target variable
predictors <- c("total_bill", "size")
target <- "high_tip"

# Set learning rate and number of iterations
learning_rate <- 0.001
num_iterations <- 1000

# Train the logistic regression model
coefficients <- logistic_regression(tips, predictors, target, learning_rate, num_iterations)

# View the learned coefficients
cat("Learned Coefficients:\n")
print(coefficients)

