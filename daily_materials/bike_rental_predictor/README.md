
# Build Random Forests in R using Azure ML Studio

## Project Objectives

- Train and evaluate a regression model on Azure ML Studio.
- Perform feature Engineering and data preprocessing using custom R scripts.
- Write custom machine learning models in R.


### Task 1: Introduction and Overview

- Create a new experiment from the [Azure ML Studio dashboard](https://azure.microsoft.com/en-in/services/machine-learning/).
- [Link to classic version(I prefer this)](https://studio.azureml.net)
- As we saw yesterday, Azure ML Studio has a fair amount of built-in machine learning algorithms that you can use as modules. But what if we need an algorithm not included by default? Well, Azure can leverage the entire open-source R and Python communities!
- We can simply [use the `Create R Model` module](https://docs.microsoft.com/en-us/azure/machine-learning/studio-module-reference/create-r-model) to use any R machine learning library and the associated algorithms.
- We are going to be working with the Bike Sharing Dataset which is a great dataset to explore [Azure ML Studio's `Execute R Script`](https://docs.microsoft.com/en-us/azure/machine-learning/studio-module-reference/execute-r-script) and Create R Model modules. 
- The Bike Sharing dataset has 10,886 observations, each one pertaining to a specific hour from the first 19 days of each month from 2011 to 2012. The dataset consists of 11 columns that record information about bike rentals.
- [Link to Data](https://archive.ics.uci.edu/ml/datasets/bike+sharing+dataset)


### Task 2: Feature Engineering and Preprocessing

- There is an untapped wealth of prediction power hidden in the datetime column. However, it needs to be converted from its current form. Conveniently, Azure ML has a module for running R scripts, which can take advantage of R’s built-in functionality for extracting features from the datetime data.
- We now select an R-Script Module to run our feature engineering script. This module allows us to import the dataset from Azure ML, add new features, and then export the improved dataset. This module has many uses beyond our use in this project, which help with cleaning data and creating graphs.

### Task 3: Removing Outliers

- This dataset only has one observation where a feature value is an outlier.
- Since this is a categorical variable, R will result in an error if it ends up in the test data split. 
- This is because R expects the number of levels for each categorical variable to equal the number of levels found in the training data split.
- Therefore, it must be removed. We we write a custom R-script to remove the outlier.

### Task 4: Model Building and Training

- Here is where we take advantage of Azure ML’s newest feature: the Create R Model module.
- Now we can use the [R randomForest](https://www.rdocumentation.org/packages/randomForest/versions/4.6-14/topics/randomForest) library and take advantage of its large number of adjustable parameters directly inside Azure ML Studio.
- The model can be deployed in a web service. Previously, R models were nearly impossible to deploy to the web.

### Task 5: Scoring and Evaluating the Models

- Compare how the two models perform using the [Score Model](https://docs.microsoft.com/en-us/azure/machine-learning/studio-module-reference/score-model) and [Evaluate Model](https://docs.microsoft.com/en-us/azure/machine-learning/studio-module-reference/evaluate-model) modules.
- Use the AOC and ROC metrics to evaluate and diagnose your models.

### Task 6: Model Evaluation

- Unfortunately, AzureML’s Evaluate Model Module does not yet support models that use the Create R Model module.
- In the meantime, you can import the results from the Score Model module into an Execute R Script module and perform an evaluation using R.
- Calculate the MSE and export your results back to Azure ML Studio as a data frame.