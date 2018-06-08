# Polynomial Regression

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting Linear Regression model to the dataset
linear_regressor = lm(formula = Salary ~ Level,
                      data = dataset)

# Fitting Polynomial Regression model to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ .,
              data = dataset)

# Visualising the Linear Regression results
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(linear_regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Linear Regression)') +
  xlab('Position Level') +
  ylab('Salary')

# Visualising the Polynomial Regression results
# install.packages('ggsn)

# the above package was installed to remove the following error
# Error in grid.Call.graphics(C_setviewport, vp, TRUE) : 
#  non-finite location and/or size for viewport
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Polynomial Regression)') +
  xlab('Position Level') +
  ylab('Salary')

# Visualising the Regression plot for higher resolution and smoother curve
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(poly_reg,
                                        newdata = data.frame(Level = x_grid,
                                                             Level2 = x_grid^2,
                                                             Level3 = x_grid^3,
                                                             Level4 = x_grid^4))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Polynomial Regression)') +
  xlab('Position Level') +
  ylab('Salary')

# Predicting a new result with Linear Regression
prediction_linear = predict(linear_regressor, newdata = data.frame(Level = 6.5))

# Predicting a new result with Polynomial Regression
prediction_value = 6.5
prediction_polynomial = predict(poly_reg, newdata = data.frame(Level = prediction_value,
                                                               Level2 = prediction_value^2,
                                                               Level3 = prediction_value^3,
                                                               Level4 = prediction_value^4))