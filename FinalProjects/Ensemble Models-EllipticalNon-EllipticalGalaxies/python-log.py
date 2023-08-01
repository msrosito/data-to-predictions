import sklearn.linear_model as lm
import pandas as pd
from sklearn.model_selection import train_test_split
import numpy as np



galaxies = pd.read_csv('galaxies.csv')

X = np.array(galaxies.iloc[:, :-1])
y = np.array(galaxies.iloc[:, -1])
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size= 0.25, 
    random_state = 0)

log_model_fit = lm.LogisticRegression(fit_intercept = True, max_iter = 1000).fit(X_train,y_train)
#default threshold = 0.5

pred_train_class = log_model_fit.predict(X_train)
pred_test_class = log_model_fit.predict(X_test)

accuracy_train = 1 - sum(abs(pred_train_class - y_train))/len(y_train)

accuracy_test = 1 - sum(abs(pred_test_class - y_test))/len(y_test)

print("Accuracy (training) :", accuracy_train)
print("Accuracy (test) :", accuracy_test)

