# -*- coding: utf-8 -*-
"""
Created on Sun Oct 13 11:24:05 2019

@author: Niharika_Cnr
"""

# Bluffing Detector using Polynomial Regression

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:-1].values
y = dataset.iloc[:, -1].values

# Fitting Linear Regression to the dataset
from sklearn.linear_model import LinearRegression

lin_reg = LinearRegression()
lin_reg.fit(X, y)

#Fitting Polynomial Regression to the dataset
from sklearn.preprocessing import PolynomialFeatures

poly_reg = PolynomialFeatures(degree = 4)
X_poly = poly_reg.fit_transform(X)

poly_lin_reg = LinearRegression()
poly_lin_reg.fit(X_poly, y)

#---------------------------------------------------------------------------------------#
## Visualising Linear Regression Results
#plt.scatter(X, y, color = 'r')
#plt.plot(X, lin_reg.predict(X), color = 'b')
#plt.title("Truth or Bluff? (Linear Regression)")
#plt.xlabel("Position Level")
#plt.ylabel("Salary")
#plt.show()
#
## Visualizing Polynomial Regression Results
#X_grid = np.arange(min(X), max(X), 0.1)
#X_grid = X_grid.reshape(len(X_grid), 1)
#plt.scatter(X, y, color = 'r')
#plt.plot(X_grid, poly_lin_reg.predict(poly_reg.fit_transform(X_grid)), color = 'b')
#plt.title("Truth or Bluff? (Polynomial Regression)")
#plt.xlabel("Position Level")
#plt.ylabel("Salary")
#plt.show()
#---------------------------------------------------------------------------------------#

# Predicting a new result with Linear Regression Model
lin_reg.predict([[6.5]])

# Prediciting new result with Polynominal Regression Model
poly_lin_reg.predict(poly_reg.fit_transform([[6.5]]))
