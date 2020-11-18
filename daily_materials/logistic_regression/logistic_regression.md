# Logistic Regression - Machine Learning Version - Saudi Digital Academy

## Activity Goals

- Implement the gradient descent algorithm from scratch.
- Perform logistic regression with NumPy and Python.
- Create data visualizations with Matplotlib and Seaborn.

### Task 1: Introduction and Project Overview

- Introduction to the data set and the problem overview.
- See a demo of the final product you will build by the end of this project.
- Introduction to the Rhyme interface.

### Task 2: Load the Data and Import Libraries

- Load the dataset using pandas.
- Import essential modules and helper functions from NumPy and Matplotlib.
- Explore the pandas dataframe using the head() and info() functions.

### Task 3: Visualize the Data

- Before starting on any task, it is often useful to understand the data by visualizing it. 
- For this dataset, we can use a scatter plot using Seaborn to visualize the data, since it has only two variables: scores for test 1, scores for test 2.

### Task 4: Define the Logistic Sigmoid Function 𝜎(𝑧)

- We can interpret the output of the logistic sigmoid function as a probability, since this function outputs in the range 0 to 1 for any input.
- We can threshold the function at 50% to make our classification.
- If the output is greater than or equal to 0.5, we classify it as passed, and less than 0.5 as failed
- The maximal uncertainty, we can easily see if we plug in 0 as the input. So when the model is most uncertain it tells you the data point has a 50% probability of being in either of the classes.
- We’re going to be using this function to make our predictions based on the input

### Task 5: Compute the Cost Function 𝐽(𝜃) and Gradient

- Now that we have defined the logistic sigmoid, we can go ahead and define the objective function for logistic regression.

!()[images/formula.png]

- The mathematics of how we arrived at the result is beyond the scope of this project. But I highly recommend you do some reading on your own time.
- We can use the standard tool from convex optimization, the simplest of which is gradient descent to minimize the cost function.
  
### Task 6a: Cost and Gradient at Initialization

Before doing gradient descent, never forget to do feature scaling for a multivariate problem.
Initialize the cost and gradient before any optimization steps.

### Task 6b: Implement Gradient Descent from scratch in Python

- Recall that the parameters of our model are the 𝜃_j values. These are the values we will adjust to minimize the cost J(𝜃).
- One way to do this is to use the batch gradient descent algorithm.
  
> In batch gradient descent, each iteration performs the following update.

- With each step of gradient descent, the parameters 𝜃_j come closer to the optimal values that will achieve the lowest cost J(𝜃).
- Since we already have a function for computing the gradient previously, let’s not repeat the calculation and add on an alpha term here to update Θ.
- Let’s now actually run gradient descent using our data and run it for 200 iterations.
- The alpha parameter  controls how big or small of a step you take in the direction of steepest slope. - Set it too small, and your model may take a very long time to converge or never converge. Set it too large and your model may overshoot and never find the minimum.

### Task 7: Plotting the Convergence of 𝐽(𝜃)

- Let’s plot how the cost function varies with the number of iterations.
- When we ran gradient descent previously, it returns the history of J(𝜃) values in a vector “costs”.
- We will now plot the J values against the number of iterations.

### Task 8: Plotting the Decision Boundary

- Let's over the scatterplot from Task 3 with the learned logistic regression decision boundary.

### Task 9: Predictions Using the Optimized 𝜃 Values

- In this final task, let’s use our final values for 𝜃 to make predictions.
