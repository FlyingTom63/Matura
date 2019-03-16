projPath <- rprojroot::find_rstudio_root_file()

FunctionUtilsPath <- paste(projPath,"/R/Analysis/FunctionUtils.R", sep="")
source(FunctionUtilsPath)

ModelFunctionsPath <- paste(projPath,"/R/Analysis/old/ModelFunctions.R", sep="")
source(ModelFunctionsPath)

LogPath <- paste(projPath,"/R/Analysis/log/log.txt", sep="")


iterateOverFeatures <- function(data, samples, X, k){
  res <- list(acc = vector("list",10), max = vector("list",10))
  sink(LogPath, append=TRUE)
  library(rknn)
  for(idx in 1:length(X)){
    main.train <- data[samples, X[[idx]]]
    main.test <- data[-samples, X[[idx]]]
    numberOfAttributes = ncol(main.train) - 1
    tryCatch({
      pred <- knn(main.train, main.test, main.train$M, k = k)
      singleAcc <- (1-mean(main.test$M != pred))
      print(paste(c("Accurancy (KNN) for columns",X[[idx]] , ":", singleAcc) , collapse = " "))
      res$acc[[numberOfAttributes]] <- c(res$acc[[numberOfAttributes]], singleAcc)
      if(length(res$max[[numberOfAttributes]]) == 0){
        res$max[[numberOfAttributes]] <- list(label = print(X[[idx]]), value = singleAcc)
      } else if(res$max[[numberOfAttributes]]$value < singleAcc){
        res$max[[numberOfAttributes]]$value = singleAcc
        res$max[[numberOfAttributes]]$label = print(X[[idx]])
      }
      print()
    }, warning = function(w) {
      print(paste(c("Warning for", X[[idx]] , ":", w) , collapse=" "))
    }, error = function(e) {
      print(paste(c("Error for",X[[idx]] , ":", e) , collapse=" "))
    })
  }
  res
}

getAccuranciesForK <- function(data, samples, X){
  library(rknn)
  sink(LogPath, append=TRUE)
  
  main.train <- data[samples, X]
  main.test <- data[-samples, X]
  accurancies <- vector("list", 10)
  acc <- c(0)
  tryCatch({
    for(k in 1:150){
      main.singlernn <- knn(main.train, main.test, main.train$M, k = k)
      singleAcc <- getAccurancy(main.singlernn, main.test$M)
      print(paste(c("Accurancy (KNN) for columns",X , k,":", singleAcc) , collapse = " "))
      acc <- c(acc, 1-singleAcc)
    }
    acc <- acc[-(1)]
    print(paste(c("Accurancy (KNN) for columns",X , ":", mean(acc)) , collapse = " "))
  }, warning = function(w) {
    print(paste(c("Warning for", X , ":", w) , collapse=" "))
  }, error = function(e) {
    print(paste(c("Error for",X , ":", e) , collapse=" "))
  })
  acc
}


nn_simulation <- function(idx){
  sink("~/Documents/workspaces/HSLU-ML/R/log.txt", append=TRUE)
  df <- prepareDataFrame(idx, td, names, c("3", "4", "5","6"))
  x <- vector(mode="numeric", length=0)
  for(iteration in 1:maxNumIteration){
    x[iteration] <- nn_func(df)
  }
  print(paste("Accurancy (NN) for",names[idx], ":",mean(x), sep = " "))
  mean(x)
  sink()
}

knn_simulation <- function(idx){
  sink("~/Documents/workspaces/HSLU-ML/R/log.txt", append=TRUE)

  df <- prepareDataFrame(idx, td, names, c("3", "4", "5","6"))
  x <- vector(mode="numeric", length=0)
  for(iteration in 1:maxNumIteration){
    x[iteration] <- knn_func(df)
  }
  print(paste("Accurancy (KNN) for",names[idx], ":",mean(x), sep = " "))
  mean(x)
  sink()
}

mda_simulation <- function(idx){
  sink("~/Documents/workspaces/HSLU-ML/R/log.txt", append=TRUE)

  df <- prepareDataFrame(idx, td, names, c("3", "4", "5","6"))
  x <- vector(mode="numeric", length=0)
  for(iteration in 1:maxNumIteration){
    x[iteration] <- mda_func(df)
  }
  print(paste("Accurancy (MDA) for",names[idx], ":",mean(x), sep = " "))
  mean(x)
  sink()
}

rda_simulation <- function(idx){
  sink("~/Documents/workspaces/HSLU-ML/R/log.txt", append=TRUE)

  df <- prepareDataFrame(idx, td, names, c("3", "4", "5","6"))
  x <- vector(mode="numeric", length=0)
  for(iteration in 1:maxNumIteration){
    x[iteration] <- rda_func(df)
  }
  print(paste("Accurancy (RDA) for",names[idx], ":",mean(x), sep = " "))
  mean(x)
  sink()
}

fda_simulation <- function(idx){
  sink("~/Documents/workspaces/HSLU-ML/R/log.txt", append=TRUE)
  df <- prepareDataFrame(idx, td, names, c("3", "4", "5","6"))
  x <- vector(mode="numeric", length=0)
  for(iteration in 1:maxNumIteration){
    x[iteration] <- fda_func(df)
  }
  print(paste("Accurancy (FDA) for",names[idx], ":",mean(x), sep = " "))
  mean(x)
  sink()
}

svm_simulation <- function(idx){
  sink("~/Documents/workspaces/HSLU-ML/R/log.txt", append=TRUE)

  df <- prepareDataFrame(idx, td, names, c("3", "4", "5","6"))
  x <- vector(mode="numeric", length=0)
  for(iteration in 1:maxNumIteration){
    x[iteration] <- svm_func(df)
  }
  print(paste("Accurancy (SVM) for",names[idx], ":",mean(x), sep = " "))
  mean(x)
  sink()
}

nb_simulation <- function(idx){
  sink("~/Documents/workspaces/HSLU-ML/R/log.txt", append=TRUE)

  df <- prepareDataFrame(idx, td, names, c("3", "4", "5","6"))
  x <- vector(mode="numeric", length=0)
  for(iteration in 1:maxNumIteration){
    x[iteration] <- nb_func(df)
  }
  print(paste("Accurancy (Naive Bayes) for",names[idx], ":",mean(x), sep = " "))
  mean(x)
  sink()
}

qda_simulation <- function(idx){
  sink("~/Documents/workspaces/HSLU-ML/R/log.txt", append=TRUE)
  
  df <- prepareDataFrame(idx, td, names, c("3", "4", "5","6"))
  x <- vector(mode="numeric", length=0)
  for(iteration in 1:maxNumIteration){
    x[iteration] <- qda_func(df)
  }
  print(paste("Accurancy (QDA) for",names[idx], ":",mean(x), sep = " "))
  mean(x)
  sink()
  
}

rf_simulation <- function(idx){
  sink("~/Documents/workspaces/HSLU-ML/R/log.txt", append=TRUE)
  
  df <- prepareDataFrame(idx, td, names, c("3", "4", "5","6"))
  x <- vector(mode="numeric", length=0)
  for(iteration in 1:maxNumIteration){
    x[iteration] <- random_func(df)
  }
  print(paste("Accurancy (Random) for",names[idx], ":",mean(x), sep = " "))
  mean(x)
  sink()
  
}