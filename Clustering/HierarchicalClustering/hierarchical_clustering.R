# Hierarchical Clustering

# Importing the dataset
dataset = read.csv('Mall_Customers.csv')
X = dataset[, 4:5]

# Using the dendrograms to find the optimal number of clusters
dendrogram = hclust(dist(X, method = 'euclidean'), method = 'ward.D')
plot(dendrogram,
     main = 'Dendrogram',
     xlab = 'Customers',
     ylab = 'Euclidean Distance')

# Optimal number of clusters from the dendrogram is 5
# Fitting Hierarchical clustering to the dataset
hc = hclust(dist(X, method = 'euclidean'), method = 'ward.D')
y_hc = cutree(hc, k = 5)

# Plotting the visualisation
# install.packages('cluster')
library(cluster)
clusplot(X,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = 'Hierarchical Clustering',
         xlab = 'Annual income',
         ylab = 'Spending score')

