projPath <- rprojroot::find_rstudio_root_file()
FunctionUtilsPath <- paste(projPath,"/R/Analysis/FunctionUtils.R", sep="")

source(FunctionUtilsPath)

knn_func <- function(pDataFrame){
  library(class)

  # Random splitting of data as 70% train and 30%test datasets
  ind <- getIndex(pDataFrame)
  trainData <- pDataFrame[ind==1,]
  testData <- pDataFrame[ind==2,]

  # Removing factor variable from training and test datasets
  trainData1 <- trainData[-1]
  testData1 <- testData[-1]
  
  predictions <- knn(train = trainData1, test = testData1, cl= trainData$M ,k = 6,prob=TRUE)
  
  getAccurancy(predictions, testData$M)
}



nn_func <- function (pDataFrame){
  library(nnet)
  library(OneR)
  
  # Random splitting of data as 70% train and 30%test datasets
  ind <- getIndex(pDataFrame)
  trainData <- pDataFrame[ind==1,]
  testData <- pDataFrame[ind==2,]
  
  # fit model
  fit <- nnet(M~., data=trainData, size=12, decay=0.0001, maxit=5000, trace = FALSE)
  # summarize the fit
  summary(fit)
  # make predictions
  predictions <- predict(fit, testData, type="class")
  # summarize accuracy
  table(predictions, testData$M)
  # CrossTable(x = testData$M, y = predictions,prop.chisq=FALSE) 
  getAccurancy(predictions, testData$M)
}

mda_func <- function(pDataFrame){
  # load the package
  library(mda)

  # Random splitting of data as 70% train and 30%test datasets
  ind <- getIndex(pDataFrame)
  trainData <- pDataFrame[ind==1,]
  testData <- pDataFrame[ind==2,]
  
  fit <- fda(M~., data=trainData)
  # summarize the fit
  summary(fit)
  # make predictions
  predictions <- predict(fit, testData)
  # summarize accuracy
  table(predictions, testData$M)
  getAccurancy(predictions, testData$M)
}

rda_func <-function(pDataFrame){
  library(klaR)
  # Random splitting of data as 70% train and 30%test datasets
  ind <- getIndex(pDataFrame)
  trainData <- pDataFrame[ind==1,]
  testData <- pDataFrame[ind==2,]
 
   # fit model
  fit <- rda(M~., data=trainData, gamma=0.05, lambda=0.01)
  # summarize the fit
  summary(fit)
  # make predictions
  predictions <- predict(fit, testData)$class
  # summarize accuracy
  table(predictions, testData$M)
  getAccurancy(predictions, testData$M)
}

fda_func <-function(pDataFrame){
  # Random splitting of data as 70% train and 30%test datasets
  ind <- getIndex(pDataFrame)
  trainData <- pDataFrame[ind==1,]
  testData <- pDataFrame[ind==2,]
  
  # load the package
  library(mda)
  # fit model
  fit <- fda(M~., data=trainData)
  # summarize the fit
  summary(fit)
  # make predictions
  predictions <- predict(fit, testData)
  # summarize accuracy
  table(predictions, testData$M)
  getAccurancy(predictions, testData$M)
}

svm_func <-function(pDataFrame){
  # Random splitting of data as 70% train and 30%test datasets
  ind <- getIndex(pDataFrame)
  trainData <- pDataFrame[ind==1,]
  testData <- pDataFrame[ind==2,]
  
  # load the package
  library(kernlab)
  # fit model
  fit <- ksvm(M~., data=trainData)
  # summarize the fit
  summary(fit)
  # make predictions
  predictions <- predict(fit, testData, type="response")
  # summarize accuracy
  table(predictions, testData$M)
  getAccurancy(predictions, testData$M)
}

nb_func <- function(pDataFrame){
  # Random splitting of data as 70% train and 30%test datasets
  ind <- getIndex(pDataFrame)
  trainData <- pDataFrame[ind==1,]
  testData <- pDataFrame[ind==2,]
  
  # load the package
  library(e1071)
  # fit model
  fit <- naiveBayes(M~., data=trainData)
  # summarize the fit
  summary(fit)
  # make predictions
  predictions <- predict(fit, testData)
  # summarize accuracy
  table(predictions, testData$M)
  getAccurancy(predictions, testData$M)
}

qda_func <- function(pDataFrame){
  # Random splitting of data as 70% train and 30%test datasets
  ind <- getIndex(pDataFrame)
  trainData <- pDataFrame[ind==1,]
  testData <- pDataFrame[ind==2,]

    # load the package
  library(MASS)
  # fit model
  fit <- qda(M~., data=trainData)
  # summarize the fit
  summary(fit)
  # make predictions
  predictions <- predict(fit, testData)$class
  # summarize accuracy
  table(predictions, testData$M)
  getAccurancy(predictions, testData$M)
}

random_func <- function(pDataFrame){
  # Random splitting of data as 70% train and 30%test datasets
  ind <- getIndex(pDataFrame)
  trainData <- pDataFrame[ind==1,]
  testData <- pDataFrame[ind==2,]
  
  library(randomForest)

  # Create a Random Forest model with default parameters
  fit <- randomForest(M~., data = trainData, importance = TRUE)
  
  predictions <- predict(fit, testData)
  # summarize accuracy
  table(predictions, testData$M)
  getAccurancy(predictions, testData$M)
}
