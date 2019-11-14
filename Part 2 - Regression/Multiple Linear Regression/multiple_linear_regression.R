# Multiple Linear Regression

# Importing the dataset
dataset = read.csv('50_Startups.csv')

# Encoding categorical data
dataset$State = factor(dataset$State,
						levels = c('New York', 'California', 'Florida'),
						labels = c(1, 2, 3))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# # Step-by-Step Backward Elimination
# regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, data = dataset)
# regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend, data = dataset)
# regressor = lm(formula = Profit ~ R.D.Spend, data = dataset)
# summary(regressor)

# Automatic Backward Elimination
backwardElimination <- function(x, sl)	{
	cols = length(x)
	for(i in c(1:cols))	{
		regressor = lm(formula = Profit ~ ., data = x)
		pMax = max(coef(summary(regressor))[c(2:cols), "Pr(>|t|)"])
		if(pMax > sl)	{
			j = which(coef(summary(regressor))[c(2:cols), "Pr(>|t|)"] == pMax)
			x = x[, -j]
			cols = cols - 1
		}
	}
	summary(regressor)
	return(x)
}

SL = 0.05
# dataset = dataset[, c(1,2,3,4,5)]
training_set_opt = backwardElimination(dataset, SL)
regressor = lm(formula = Profit ~ R.D.Spend, data = training_set_opt)

# Predicting the Test Set Results
y_pred = predict(regressor, newdata = test_set)
