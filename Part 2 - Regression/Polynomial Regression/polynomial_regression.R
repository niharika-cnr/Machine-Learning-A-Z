# Bluffing Detector
# Polynomial Linear Regression

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')

dataset = dataset[2:3]

# Fitting Linear Regression Model to the dataset
lin_reg = lm(formula = Salary ~ ., data = dataset)

# Fitting the Polynomial Regression Model to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ ., data = dataset)


library(ggplot2)

# Visualizing the Linear Regression Results
ggplot() +
	geom_point(aes(x = dataset$Level , y = dataset$Salary),
			   colour = 'red') +
	geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
			  colour = 'blue') +
	ggtitle("Truth or Bluff? (Linear Regression)") +
	xlab("Level") +
	ylab("Salary")

# Visualizing the Polynominal Linear Regression Results
ggplot() +
	geom_point(aes(x = dataset$Level , y = dataset$Salary),
			   colour = 'red') +
	geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
			  colour = 'blue') +
	ggtitle("Truth or Bluff? (Polynomial Linear Regression)") +
	xlab("Level") +
	ylab("Salary")

# Visualizing the Polynominal Linear Regression Results (High Resolution)
X_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
dataset_high_resol = data.frame(Level = X_grid,
								Level2 = X_grid^2,
								Level3 = X_grid^3,
								Level4 = X_grid^4)
ggplot() +
	geom_point(aes(x = dataset$Level , y = dataset$Salary),
			   colour = 'red') +
	geom_line(aes(x = X_grid, y = predict(poly_reg, newdata = dataset_high_resol)),
			  colour = 'blue') +
	ggtitle("Truth or Bluff? (Polynomial Linear Regression - High Resol)") +
	xlab("Level") +
	ylab("Salary")

# Predicting the new result with Linear Regression Model
y_pred = predict(lin_reg, newdata = data.frame(Level = 6.5))

# Predicting the new result with Linear Regression Model
poly_new_data = data.frame(Level = 6.5, Level2 = 6.5^2, Level3 = 6.5^3, Level4 = 6.5^4)
y_pred = predict(poly_reg, newdata = poly_new_data)
