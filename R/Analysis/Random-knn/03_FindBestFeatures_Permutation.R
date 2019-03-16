#Load FunctionUtils

#Load Libraries
library(caret)
library(class)
library(purrr)
library(gtools)

#load data
main.data <- read.csv("~/Documents/workspaces/knime-workspace/Projektarbeit CAS/results/students_withAllValuesOhneAussreisserBinnedAndNormalized.csv", header=TRUE)
main.data$M <- main.data$M - main.data$X3_Orig
#order columns
main.data <- main.data[,c(3,1,2,4,5,6,7,8,9,10,11)]
labels <- c("Note 3. Jahr","Mathematiknote","Arbeitsmarkt","Bevölkerung","Erreichbarkeit","Rang","Sicherheit","Steuerbelastung","Versorgung","Landessprache")
set.seed(123)
samples <- main.data$M %>% createDataPartition(p = 0.70, list = FALSE)

last <- numeric()
for(step in 1:6){
  res <- list()
  if(!is_empty(last)){
    main.data <- main.data[,-c(as.numeric(last))]
    labels <- labels[!labels %in% labels[(as.numeric(last)-1)]]
  }
  for(idx in 2:length(main.data)){
    main.train <- main.data[samples,]
    main.test <- main.data[-samples,]
    
    pred <- knn(train = main.train, test = main.test, cl = main.train$M, k = 8, prob=TRUE) 
    orig_err <- (mean(main.test$M != pred))
    
    err <- vector()
    
    for(i in 1:100){
      c <- main.train[[idx]]
      main.train[[idx]] <- permute(x = c)
      pred <- knn(train = main.train, test = main.test, cl = main.train$M, k = 8, prob=TRUE) 
      err <- c(err, mean(main.test$M != pred))
    }
    res <- c(res, list(c(labels[idx-1], abs(max(err)-orig_err), idx)))
    print(paste(idx, orig_err, abs(max(err)-orig_err)), collapse = " ")
  }
  
  class(res) <- "comparable"
  '[.comparable' <- function(x, i) {
    class(x) <- "list"
    x <- x[i]
    class(x) <- "comparable"
    x
  }
  
  '>.comparable' <- function(a,b) {
    a <- a[[1]]
    b <- b[[1]]
    ifelse((a[2] >= b[2]), TRUE, FALSE)
  }
  
  '<.comparable' <- function(a,b) {
    a <- a[[1]]
    b <- b[[1]]
    ifelse((a[2] < b[2]), TRUE, FALSE)
  }
  
  '==.comparable' <- function(a, b) {
    a <- a[[1]]
    b <- b[[1]]
    ifelse(a[2] > b[2] || b[2] > a[2], FALSE, TRUE)
  }
  
  res <- sort(res)
  
  x <- vector()
  y <- vector()
  for(i in 1:length(res)){
    x <- c(x, res[[i]][2])
    y <- c(y, res[[i]][1])
  }
  
  last <- res[[1]][3]
  
  
  if(step == 1){
    par(mfrow=c(2,3),las=3, mar=c(10,3,3,3))
  }
  plot(rev(x), type = "h",xaxt="n", xlab = "", ylab = "Feature Importance", main = ifelse((step == 1),"Alle Eigenschaften",paste("Step", step, collapse=" ")))
  axis(1, at=1:length(res), labels=rev(y))
}
     
