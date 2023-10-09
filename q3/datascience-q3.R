# Load the Iris dataset (built-in dataset)
data(iris)

# Select the features (exclude the species column)
iris_features <- iris[, 1:4]

# Determine the number of clusters (e.g., 3 clusters)
k <- 3

# Perform k-means clustering
set.seed(123)  # for reproducibility
kmeans_result <- kmeans(iris_features, centers = k)

# View the cluster assignments
cluster_assignments <- kmeans_result$cluster
print(cluster_assignments)

# Visualize the clusters (using the first two features for simplicity)
library(ggplot2)

# Add the cluster assignments to the Iris dataset
iris_with_clusters <- data.frame(iris, Cluster = cluster_assignments)

# Scatter plot of Sepal Length vs. Sepal Width, colored by clusters
ggplot(iris_with_clusters, aes(x = Sepal.Length, y = Sepal.Width, color = factor(Cluster))) +
  geom_point() +
  labs(title = "K-Means Clustering of Iris Dataset") +
  theme_minimal()
