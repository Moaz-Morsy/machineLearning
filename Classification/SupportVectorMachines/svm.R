# Support Vector Machines

# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[, 3:5]

# Splitting the dataset into training set and test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Applying Feature Scaling on the dataset
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Fitting the SVM model on the training set
# install.packages('e1071')
library(e1071)


# Predicting the result on the test set


# Making the Confusion Matrix


# Visualising the training set result


# Visualising the test set result
