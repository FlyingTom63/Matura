#Load FunctionUtils
source("~/Documents/workspaces/HSLU-ML/R/Simulations.R")

#Load Libraries
library(rknn)
library(tidyverse)
library(caret)
library(class)
library(gmodels)

#load data
main.data <- read.csv("~/Documents/workspaces/knime-workspace/Projektarbeit CAS/results/students_withAllValuesOhneAussreisserOnlyMBinned.csv", header=TRUE)
#order columns
main.data <- main.data[,c(3,1,2,4,5,6,7,8,9,10,11)]

#Split the data into train and test set
set.seed(123)
training.samples <- main.data$M %>%
  createDataPartition(p = 0.8, list = FALSE)

X <- list()
X <- c(X, list(c(1,2,3,4,5,6,7,8,9,10,11)))
X <- c(X, list(c(1,2,3,4,5,6,7,8,9,10)))
X <- c(X, list(c(1,2,3,4,5,6,7,8,9,11)))
X <- c(X, list(c(1,2,3,4,5,6,7,8,11,10)))
X <- c(X, list(c(1,2,3,4,5,6,7,11,9,10)))
X <- c(X, list(c(1,2,3,4,5,6,11,8,9,10)))
X <- c(X, list(c(1,2,3,4,5,11,7,8,9,10)))
X <- c(X, list(c(1,2,3,4,11,6,7,8,9,10)))
X <- c(X, list(c(1,2,3,11,5,6,7,8,9,10)))
X <- c(X, list(c(1,2,11,4,5,6,7,8,9,10)))
X <- c(X, list(c(1,11,3,4,5,6,7,8,9,10)))

writeLines(c(""), "~/Documents/workspaces/HSLU-ML/R/log.txt")  
sink("~/Documents/workspaces/HSLU-ML/R/log.txt", append=TRUE)
iterateOverFeatures(data = main.data, samples = training.samples, X = X)
