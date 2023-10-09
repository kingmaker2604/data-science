# Load the necessary library
library(randomForest)

# Load the dataset (make sure the file path is correct)
tips <- read.csv("Desktop/tips.csv")

# Explore the dataset
head(tips)
summary(tips)

# Split the dataset into a training set and a testing set
set.seed(123)  # for reproducibility
sample_indices <- sample(1:nrow(tips), 0.7 * nrow(tips))
train_data <- tips[sample_indices, ]
test_data <- tips[-sample_indices, ]

# Build a Random Forest model
rf_model <- randomForest(tip ~ ., data = train_data, ntree = 100)

# View the model details
print(rf_model)

# Make predictions on the test set
predictions <- predict(rf_model, newdata = test_data)

# Evaluate the model (you can use different metrics depending on your goal)
mean_squared_error <- mean((predictions - test_data$tip)^2)
cat("Mean Squared Error:", mean_squared_error, "\n")

# Feature importance
importance(rf_model)

# Variable Importance Plot
varImpPlot(rf_model, main = "Variable Importance Plot")

# Partial Dependence Plots (PDPs)
library(pdp)
pdp_total_bill <- partial(rf_model, pred.var = "total_bill", grid.resolution = 100)
pdp_size <- partial(rf_model, pred.var = "size", grid.resolution = 100)

plot(pdp_total_bill, main = "Partial Dependence Plot for 'total_bill'")
plot(pdp_size, main = "Partial Dependence Plot for 'size'")


# Actual vs. Predicted Plot
plot(test_data$tip, predictions, 
     xlab = "Actual Tips", ylab = "Predicted Tips", 
     main = "Actual vs. Predicted Tips")
abline(0, 1, col = "red")  # Add a 45-degree reference line


# Residual Plot

residuals <- test_data$tip - predictions
plot(predictions, residuals, 
     xlab = "Predicted Tips", ylab = "Residuals", 
     main = "Residual Plot")
abline(h = 0, col = "red")  # Add a horizontal reference line at y=0

