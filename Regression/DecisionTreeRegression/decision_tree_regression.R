# Decision Tree Regression
# Non-linear and Non-continuous Regression Model

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting the Decision Tree Regression model to the dataset
# install.packages('rpart')
library(rpart)
regressor = rpart(formula = Salary ~.,
                  data = dataset,
                  control = rpart.control(minsplit = 1))

# Predicting the results with the Decision Tree Regression model
y_pred = predict(regressor, newdata = data.frame(Level = 6.5))

# Visualising the Decision Tree Regression model with higher resolution
# install.packages('ggplot2')
library(ggplot2)
X_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = X_grid, y = predict(regressor, newdata = data.frame(Level = X_grid))),
             colour = 'blue') +
  ggtitle('Truth or Bluff (Decision Tree Regression)') +
  xlab('Position Level') +
  ylab('Salary')
