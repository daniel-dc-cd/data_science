# Remember to account for the transformation of your data when you plot your model.

`mammals.plot.scatter(x='body', y='brain', logx=True, logy=True);
plt.plot(np.exp(X), np.exp(reg.predict(X)), color='red');`

You have to plot the predictors and the predictions values as exponents in order to produce a straight line(as show in the code I've provided)