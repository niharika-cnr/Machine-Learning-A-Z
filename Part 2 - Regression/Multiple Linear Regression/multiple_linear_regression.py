# -*- coding: utf-8 -*-
"""
Created on Wed Sep 25 18:01:18 2019

@author: Niharika_Cnr
"""

## Multiple Linear Regression

## Importing the libraries
import numpy as np
import statsmodels.api as sm
import pandas as pd

## Helper Function:- Backward Elimination (Automatic) to avoid unimportant variables
def backwardElimination(x, sl):
    cols = len(x[0])
#    print("COLS:", cols)
    for i in range(cols):
        regressor_OLS = sm.OLS(y, x).fit()
        pMax = max(regressor_OLS.pvalues).astype(float)
#        print(i, pMax)       
        if(pMax>=SL):
            for j in range(cols-i):
                if regressor_OLS.pvalues[j].astype(float) == pMax:
                    x = np.delete(x,j,1)
                    break
        else: break
    print(regressor_OLS.summary())
    return x


if __name__ == "__main__":
    
    # Importing the dataset
    dataset = pd.read_csv('50_Startups.csv')
    X = dataset.iloc[:, :-1].values
    y = dataset.iloc[:, -1].values
    
    # Encoding categorical data
    from sklearn.preprocessing import OneHotEncoder, LabelEncoder
    
    labelencoder_X = LabelEncoder()
    X[:,-1] = labelencoder_X.fit_transform(X[:,-1])
    onehotencoder_X = OneHotEncoder(categorical_features = [-1])
    X = onehotencoder_X.fit_transform(X).toarray()
    
    # Avoiding the Dummy Variable Trap
    X = X[:, 1:]
    
    # Backward Elimination (function implementation)
    SL = 0.05
    X_opt = backwardElimination(X, SL)
    
    # Splitting the dataset into the Training set and Test set
    from sklearn.model_selection import train_test_split
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)
    
    # Fitting the Multiple Linear Regression Model in the Training set
    from sklearn.linear_model import LinearRegression
    regressor = LinearRegression()
    regressor.fit(X_train, y_train)
    
    # Predicting the Test set results
    y_pred = regressor.predict(X_test)
    
    '''
    ## Backward Elimination (step-by-step) to build the optimal model
    
    #appending X to an array of ones to convert the feature vector X to the format b0 + b1X1 + b2X2 + ... + bnXn = y
    X = np.append(arr = np.ones((len(X), 1)).astype(int), values = X, axis = 1)
    
    X_opt = X[:,[0,1,2,3,4,5]]
    #regressor_OLS = sm.OLS(endog = y, exog = X_opt).fit()
    #regressor_OLS.summary()
    X_opt = X[:,[0,1,3,4,5]]
    #regressor_OLS = sm.OLS(endog = y, exog = X_opt).fit()
    #regressor_OLS.summary()
    X_opt = X[:,[0,3,5]]
    #regressor_OLS = sm.OLS(endog = y, exog = X_opt).fit()
    #regressor_OLS.summary()
    X_opt = X[:,[0,3]]
    regressor_OLS = sm.OLS(endog = y, exog = X_opt).fit()
    regressor_OLS.summary()
    '''
