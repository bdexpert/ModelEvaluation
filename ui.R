
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

#setwd('/media/me/Data/Projects/Ensemble')
library(shiny)


shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Model Evaluation"),
  
  # Sidebar with a radio button input for selecting the alorhythm to run.
  sidebarPanel(
    h3('Synopsis'),
    p('Using devices such as Jawbone Up, Nike FuelBand, and Fitbit it is now possible to collect a large amount of data about personal activity relatively inexpensively. These type of devices are part of the quantified self movement - a group of enthusiasts who take measurements about themselves regularly to improve their health, to find patterns in their behavior, or because they are tech geeks. One thing that people regularly do is quantify how much of a particular activity they do, but they rarely quantify how well they do it.'),

    p('The approach proposed for the Weight Lifting Exercises dataset is to investigate "how (well)" an activity was performed by the wearer. The "how (well)" investigation has only received little attention so far, even though it potentially provides useful information for a large variety of applications,such as sports training.'),

    p('Six young health participants were asked to perform one set of 10 repetitions of the Unilateral Dumbbell Biceps Curl in five different fashions: '),
    p('*Class A: exactly according to the specification, '),
    p('*Class B: throwing the elbows to the front '),
    p('*Class C: lifting the dumbbell only halfway '),
    p('*Class D: lowering the dumbbell only halfway '),
    p('*Class E: throwing the hips to the front'),

    p('Class A corresponds to the specified execution of the exercise, while the other 4 classes correspond to common mistakes.'),
    p('Data files available at: '),
    p('Training: https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv'),
    p('Test: https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv')
  ),
  
  # Show the results of the algorhythm
  mainPanel(
    h3('Question'),
    h4('Using the training and test data provided by accelerometers on arm, waistband  and dumbell of participants, how well can we predict the activity quality (Class A-E) on an out of sample observation?'),
    h3('Response'),
    h4('To answer this question, select one of the algorhythms below and clikc the Submit button. The output is a confusion matrix that indicates how well the model predicted the outcome on the validation dataset. Focus is on the Accuracy term in the output'),
    radioButtons("algorhythm", "Select Algorhythm: ", c("None" = "none", "LDA" = "lda", "QDA" = "qda", "KNN (k=1)" = "knn", "Classification Trees" = "classtree")),
    submitButton('Submit'),
    p(''),
    h4("Ouput for: "),
    verbatimTextOutput("inputValue"), 
    verbatimTextOutput("results")   
       
       
  )
))
