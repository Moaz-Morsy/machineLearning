#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jun  8 09:27:02 2018

@author: rajchoudhary
"""

# Decision Tree Regression
# Non-linear and Non-continuous Regression model

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:-1].values
y = dataset.iloc[:, -1].values

# Fitting the Decision Tree Regression model to the dataset
from sklearn.tree import DecisionTreeRegressor
regressor = DecisionTreeRegressor(random_state = 0)
regressor.fit(X, y)

# Predicting the results using Decision Tree Regressor
y_pred = regressor.predict(6.5)

# Visualising the Decision Tree Regression model
# If we simply plot our regressor for the X dataset, then the plot will be continuous
# and the visualisation will be wrong.
# So we plot our visualisation for higher resolution
X_grid = np.arange(min(X), max(X), 0.01)
X_grid = X_grid.reshape((len(X_grid), 1))
plt.scatter(X, y, color = 'red')
plt.plot(X_grid, regressor.predict(X_grid), color = 'blue')
plt.title('Bluff or Truth (Decision Tree Regression)')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()
