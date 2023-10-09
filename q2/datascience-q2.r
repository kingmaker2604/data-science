# Load the necessary library
library(arules)

# Load the dataset (make sure the file path is correct)
data <- read.csv("Desktop/market-basket.csv", header = FALSE)

# Convert the data to transactions format
transactions <- as(data, "transactions")

# Explore the dataset
summary(transactions)

# Apply the Apriori algorithm
rules <- apriori(transactions, 
                 parameter = list(support = 0.1, confidence = 0.8))

# View the generated rules
inspect(rules)
