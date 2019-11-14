# -*- coding: utf-8 -*-
"""
Created on Sun Oct 13 12:14:56 2019

@author: Niharika_Cnr
"""

# Generic Regression Template

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:-1].values
y = dataset.iloc[:, -1].values

# Splitting the dataset into the Training set and Test set
"""from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)"""

# Feature Scaling
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)"""

# Fitting the Regression Model to the dataset
# Create regressor here
regressor =  None   

# Prediciting new result with the Regression Model
y_pred = regressor.predict([[6.5]])

#---------------------------------------------------------------------------------------#
# Visualizing the Regression Results
plt.scatter(X, y, color = 'r')
plt.plot(X, regressor.predict(X), color = 'b')
plt.title("Plot_Title_goes_here")
plt.xlabel("XLabel_goes_here")
plt.ylabel("YLabel_goes_here")
plt.show()

# Visualizing the Regression Results (for higher resolution)
X_grid = np.arange(min(X), max(X), 0.1)
X_grid = X_grid.reshape(len(X_grid), 1)
plt.scatter(X, y, color = 'r')
plt.plot(X_grid, regressor.predict(X_grid), color = 'b')
plt.title("Plot_Title_goes_here (Higher Resolution)")
plt.xlabel("XLabel_goes_here")
plt.ylabel("YLabel_goes_here")
plt.show()
#---------------------------------------------------------------------------------------#
