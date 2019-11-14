# Random Forest Regression

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting the Regression Model to the dataset
# install.packages('randomForest')
library(randomForest)

regressor1 = randomForest(x = dataset[1], y = dataset$Salary, ntree = 10)
regressor2 = randomForest(x = dataset[1], y = dataset$Salary, ntree = 100)
regressor3 = randomForest(x = dataset[1], y = dataset$Salary, ntree = 500)
set.seed(1234)

# Predicting a new result
y_pred1 = predict(regressor1, data.frame(Level = 6.5))
y_pred2 = predict(regressor2, data.frame(Level = 6.5))
y_pred3 = predict(regressor3, data.frame(Level = 6.5))

# Visualising the Regression Model results (for higher resolution and smoother curve)
# install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
	geom_point(aes(x = dataset$Level, y = dataset$Salary),
			   colour = 'red') +
	geom_line(aes(x = x_grid, y = predict(regressor1, newdata = data.frame(Level = x_grid))),
			  colour = 'yellow') +
	geom_line(aes(x = x_grid, y = predict(regressor2, newdata = data.frame(Level = x_grid))),
			  colour = 'green') +
	geom_line(aes(x = x_grid, y = predict(regressor3, newdata = data.frame(Level = x_grid))),
			  colour = 'blue') +
	ggtitle('Truth or Bluff (Regression Model)') +
	xlab('Level') +
	ylab('Salary')
