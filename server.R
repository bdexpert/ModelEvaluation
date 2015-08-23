
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#This app is available at https://bdexpert.shinyapps.io/ModelEvaluation

library(shiny)
#library(AppliedPredictiveModeling)
library(caret)
library(e1071)
library(MASS)


## Input Data
training_url = "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
training_file = "pml-training.csv"
if (!file.exists(training_file)){download.file(url=training_url, destfile=training_file)}

testing_url = "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"
testing_file = "pml-testing.csv"
if (!file.exists(testing_file)) {download.file(url=testing_url, destfile=testing_file)}

# Import the data and convert blanks and DIV errors as NA.
train = read.csv("pml-training.csv", na.strings=c('NA','','#DIV/0!'), header=TRUE)
train_cols = colnames(train)
test = read.csv("pml-testing.csv", na.strings=c('NA','','#DIV/0!'), header=TRUE)
test_cols = colnames(test)

# Verify that the column names (excluding classe and problem_id) are identical in the training and test set.
all.equal(train_cols[1:length(train_cols)-1], test_cols[1:length(test_cols)-1])


#Remove NA columns from training and test dataset

NAindex = apply(train,2,function(x) {sum(is.na(x))}) 
trainNA = train[,which(NAindex == 0)]
testNA = test[,which(NAindex == 0)]

train_cols = colnames(trainNA)
test_cols = colnames(testNA)
all.equal(train_cols[1:length(train_cols)-1], test_cols[1:length(test_cols)-1])

#Remove unnecessary columns like timestamps, usernames, etc
trainNA = trainNA[,8:length(names(trainNA))]
testNA = testNA[,8:length(names(testNA))]

#center and scale the variables
preproc = preProcess(trainNA[,-53],method=c('center', 'scale'))
trainproc = predict(preproc, trainNA[,-53])
trainproc$classe = trainNA$classe

testproc = predict(preproc,testNA[,-53])

#Create a validation set out of the training set in a 60%-40% ratio.
set.seed(12031987)

inTrain = createDataPartition(trainproc$classe, p = 0.6, list=FALSE)
training = trainproc[inTrain,]
crossValidation = trainproc[-inTrain,]


shinyServer(function(input, output) {
  output$inputValue = renderPrint({input$algorhythm}) 
  
  observe({
    if(input$algorhythm == 'none'){
      output$results = renderPrint({'Please select an algorhythm'})
    } 
    
    if(input$algorhythm == 'lda'){
      modFitlda <- lda(classe~., data = training)
      predlda <- predict(modFitlda, newdata=crossValidation)
      output$results = renderPrint({confusionMatrix(predlda$class, crossValidation$classe)})
    }

    if(input$algorhythm == 'qda'){
      modFitqda <- qda(classe~., data = training)
      predqda <- predict(modFitqda, newdata=crossValidation)
      output$results = renderPrint({confusionMatrix(predqda$class, crossValidation$classe)})
    }
    
    if(input$algorhythm == 'knn'){
      library(class)
      modFitknn <- knn(training[,-53], crossValidation[,-53], training$classe, k = 1)
      output$results = renderPrint({confusionMatrix(modFitknn, crossValidation$classe)})
    }
    
    if(input$algorhythm == 'classtree'){
      library(rpart.plot)
      library(rpart)
      modFittree <- train(classe ~ ., data = training, method="rpart")
      predtree = predict(modFittree, newdata=crossValidation)
      output$results = renderPrint({confusionMatrix(predtree, crossValidation$classe)})
    }

    return()
  })
  
  
})

