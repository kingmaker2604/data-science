
install.packages("ClusterR") 
install.packages("cluster")

# Loading package 
library(ClusterR) 
library(cluster) 

df<-data.frame(
  x=c(1,2,5,6,7),
  y=c(3,5,2,9,6)
)

df


# Removing initial label of  
# Species from original dataset
#iris_1 <- iris[, -5] 

# Fitting K-Means clustering Model  
# to training dataset 
set.seed(240) # Setting seed 
kmeans.re <- kmeans(df, centers = 3, nstart = 20) 
kmeans.re 

# Cluster identification for  
# each observation 
kmeans.re$cluster 

# Confusion Matrix 
cm <- table(df$y, kmeans.re$cluster) 
cm 

# Model Evaluation and visualization 
plot(df[c("x", "y")],  
     col = kmeans.re$cluster,
     pch=19,
     main = "K-means with 3 clusters") 

## Plotiing cluster centers 
kmeans.re$centers 
kmeans.re$centers[, c("x", "y")] 

## Visualizing clusters 
y_kmeans <- kmeans.re$cluster 
clusplot(df[, c("x", "y")], 
         y_kmeans, 
         lines = 0, 
         shade = TRUE, 
         color = TRUE, 
         labels = 2, 
         plotchar = FALSE, 
         span = TRUE, 
         main = paste("Cluster data"), 
         xlab = 'x values', 
         ylab = 'y values') 

# Code contriubuted by Manja