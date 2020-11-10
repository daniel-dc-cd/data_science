#### Hint1: Remember to account for the transformation of your data when you plot your model.

`mammals.plot.scatter(x='body', y='brain', logx=True, logy=True);
plt.plot(np.exp(X), np.exp(reg.predict(X)), color='red');`

You have to plot the predictors and the predictions values as exponents in order to produce a straight line(as show in the code I've provided)

#### Hint2:
Your group wil likely encounter this error when they attempt this visualization: `ValueError: Expected 2D array, got 1D array instead.` In order to avoid this, they will need to use the `reshape(-1,1)` method as shown in the code cell below.

`mammals.plot.scatter(x='body', y='brain')
x_array = np.arange(1, max(mammals['body']))
plt.plot(x_array, np.exp(reg.predict(np.log(x_array).reshape(-1,1))), color='red');`