# Generic Regression Template

# Importing the dataset
dataset = read.csv('Salary_Positions.csv')

# Fitting the Regression Model to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
regressor = lm(formula = Salary ~ ., data = dataset)


# Visualizing the Polynominal Linear Regression Results
library(ggplot2)
ggplot() +
	geom_point(aes(x = dataset$Level , y = dataset$Salary),
			   colour = 'red') +
	geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
			  colour = 'blue') +
	ggtitle("Title_Goes_Here (Polynomial Linear Regression)") +
	xlab("xLabel_Goes_Here") +
	ylab("yLabel_Goes_Here")

# Predicting the new result with Regression Model
y_pred = predict(regressor, newdata = data.frame(Level = 6.5))

# Visualizing the Regression Model Results (High Resolution)
X_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)

ggplot() +
	geom_point(aes(x = dataset$Level , y = dataset$Salary),
			   colour = 'red') +
	geom_line(aes(x = X_grid, y = predict(regressor, newdata = data.frame(Level = X_grid))),
			  colour = 'blue') +
	ggtitle("Title_Goes_Here (Polynomial Linear Regression)") +
	xlab("XLabel_Goes_Here") +
	ylab("YLabel_Goes_Here")
