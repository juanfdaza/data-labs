# Supervised & Unsupervised Learning Project

## Overview

The objective is to execute two ML modelds. First, a sales forecaster by month using Supervided learning through a Deep Learning model. Second, a store clustering using Unsupervised learning with Kmeans models.

## Input

1. Daily store sales over various years by item and store.
2. Store features.

## Output

1. Monthly estimated sales.
2. Cluster by store

## Supervised learning steps

* Data transformation >> Given thats the data is not stationary, Using 12 months of historic info, the data is transformed from time-series to a format usable in supervised learning. shift() technique is used.
* Data preprocessing >> Using sklearn preprocessing the data is normalized to values between 0-1
* Building and fitting the model >> LSTM model is used.
* Testing the model >> A re-shape technique is used to plot the test df with the real df to evaluate the solution.

* Conclusion: Using 3-4 months instead of 12 months to run the forecast is more accurate.

## Unsupervised learning steps

* Data prep >> Given the sales data, the features are attached and get_dummies is performed also to include these categorial features in the cluster calculationed.
* Building and fitting the model >> Kmeans is used creating different number of clusters, n = 3 is the most effective number.
* Testing the model >> A parallel clusterization is done only based in sales to check if this is the most important component. This hypothesis is rejected though based on the graphs shown.
* Plot >> A 3D plot is done to evaluate each feature with the clusters created.

* Conclusion: Sales is the more relevant feature but not the only one taken into account.