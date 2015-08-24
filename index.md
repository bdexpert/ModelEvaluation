---
title       : Model Evaluation on Personal Activity Data
subtitle    : Coursera Data developing Products Course
author      : Created By Deepak on Aug 15th, 2015

job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
url: 
  assets: /assets
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---


## Synopsis
 
 
 
 
- Jawbone, Nike, Fitbit enable collection of personal activity data

- Measure how much of a particular activity is carried out

- Do we measure how well these activities are carried out?

- 'How well' provides useful information for personal health & sports training

- App at: https://bdexpert.shinyapps.io/ModelEvaluation 

--- .class #id 


## Model
 

- User selects a model to evaluate

- App outputs the model's accuracy

- Compare output of multiple models easily by selecting the desired model

- Original Dataset consists of 19622 obs and 134 variables

- Final dataset consisted of 52 predictors and 1 response

- Model evaluated on training and cross validation data

- Model Options
 - LDA
 - QDA
 - KNN
 - Classification Trees

--- .class #id 




## Dendogram for Classification Trees


```
## Loading required package: lattice
## Loading required package: ggplot2
## Loading required package: rpart
```

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png) 


--- .class #id 

## Confusion Matrix Output for Classification Trees



```
## Confusion Matrix and Statistics
## 
##           Reference
## Prediction    A    B    C    D    E
##          A 2028  633  603  579  222
##          B   41  549   51  220  194
##          C  158  336  714  487  374
##          D    0    0    0    0    0
##          E    5    0    0    0  652
## 
## Overall Statistics
##                                           
##                Accuracy : 0.5025          
##                  95% CI : (0.4914, 0.5137)
##     No Information Rate : 0.2845          
##     P-Value [Acc > NIR] : < 2.2e-16       
##                                           
##                   Kappa : 0.3499          
##  Mcnemar's Test P-Value : NA              
## 
## Statistics by Class:
## 
##                      Class: A Class: B Class: C Class: D Class: E
## Sensitivity            0.9086  0.36166   0.5219   0.0000  0.45215
## Specificity            0.6372  0.92004   0.7908   1.0000  0.99922
## Pos Pred Value         0.4989  0.52038   0.3451      NaN  0.99239
## Neg Pred Value         0.9460  0.85731   0.8868   0.8361  0.89011
## Prevalence             0.2845  0.19347   0.1744   0.1639  0.18379
## Detection Rate         0.2585  0.06997   0.0910   0.0000  0.08310
## Detection Prevalence   0.5181  0.13446   0.2637   0.0000  0.08374
## Balanced Accuracy      0.7729  0.64085   0.6564   0.5000  0.72568
```
