#Load FunctionUtils

#Load Libraries
library(caret)
library(class)

#load data
main.data <- read.csv("~/Documents/workspaces/knime-workspace/Projektarbeit CAS/results/students_withAllValuesOhneAussreisserBinnedAndNormalized.csv", header=TRUE)
main.data$M <- main.data$M - main.data$X3_Orig
#order columns
main.data <- main.data[,c(3,1,2,4,5,6,7,8,9,10,11)]
labels <- c("Note 3. Jahr","Mathematiknote","Arbeitsmarkt","Bevölkerung","Erreichbarkeit","Rang","Sicherheit","Steuerbelastung","Versorgung","Landessprache")


X <- list()
for(idx0 in 2:10){
  for(idx1 in (idx0+1):11){
    X <- c(X, list(c(1,idx0,idx1)))
    if(idx0 < 10 && idx1 < 11){
      for(idx2 in (idx1+1):11){
        X <- c(X, list(c(1,idx0,idx1, idx2)))
        if(idx0 < 9 && idx1 < 10 && idx2 < 11){
          for(idx3 in (idx2+1):11){
            X <- c(X, list(c(1,idx0,idx1, idx2, idx3)))
            if(idx0 < 8 && idx1 < 9 && idx2 < 10 & idx3 < 11){
              for(idx4 in (idx3+1):11){
                X <- c(X, list(c(1,idx0,idx1, idx2, idx3, idx4)))
                if(idx0 < 7 && idx1 < 8 && idx2 < 9 & idx3 < 10 & idx4<11){
                  for(idx5 in (idx4+1):11){
                    X <- c(X, list(c(1,idx0,idx1, idx2, idx3, idx4, idx5)))
                    if(idx0 < 6 && idx1 < 7 && idx2 < 8 & idx3 < 9 & idx4 < 10 && idx5 < 11){
                      for(idx6 in (idx5+1):11){
                        X <- c(X, list(c(1,idx0,idx1, idx2, idx3, idx4, idx5, idx6)))
                        if(idx0 < 5 && idx1 < 6 && idx2 < 7 & idx3 < 8 & idx4 < 9 && idx5 < 10 && idx6 < 11){
                          for(idx7 in (idx6+1):11){
                            X <- c(X, list(c(1,idx0,idx1, idx2, idx3, idx4, idx5, idx6, idx7)))
                            if(idx0 < 4 && idx1 < 5 && idx2 < 6 && idx3 < 7 & idx4 < 8 && idx5 < 9 && idx6 < 10 && idx7 < 11){
                              for(idx8 in (idx7+1):11){
                                X <- c(X, list(c(1,idx0,idx1, idx2, idx3, idx4, idx5, idx6, idx7, idx8)))
                                if(idx0 < 3 && idx1 < 4 && idx2 < 5 && idx3 < 6 & idx4 < 7 && idx5 < 8 && idx6 < 9 && idx7 < 10 && idx8 < 11){
                                  for(idx9 in (idx8+1):11){
                                    X <- c(X, list(c(1,idx0,idx1, idx2, idx3, idx4, idx5, idx6, idx7, idx8, idx9)))
                                    if(idx0 < 2 && idx1 < 3 && idx2 < 4 && idx3 < 5 & idx4 < 6 && idx5 < 7 && idx6 < 8 && idx7 < 9 && idx8 < 10 && idx9 < 11){
                                      for(idx10 in (idx9+1):11){
                                        X <- c(X, list(c(1,idx0,idx1, idx2, idx3, idx4, idx5, idx6, idx7, idx8, idx9, idx10)))
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}


labels <- c("Note Mathematik","Note 3. Jahr","Arbeitsmarkt","Bevölkerung","Erreichbarkeit","Rang","Sicherheit","Steuerbelastung","Versorgung","Landessprache")
res <- list(acc = vector("list",11))
for(idx in (1:length(X))){
  set.seed(123*idx)
  samples <- main.data$M %>%
    createDataPartition(p = 0.70, list = FALSE)
  
  main.train <- main.data[samples, X[[idx]]]
  main.test <- main.data[-samples, X[[idx]]]
  pred <- knn(train = main.train, test = main.test, cl = main.train$M, k = 8) 
  acc <- (1-mean(main.test$M != pred))
  
  for(featureNo in 2:11){
    if(featureNo %in% X[[idx]]){
      res$acc[[featureNo]] <- c(res$acc[[featureNo]], acc)
    }
  }
}

mean <- list()
for(idx in (2:11)){
  mean <- c(mean, list(c(labels[idx-1], mean(res$acc[[idx]]))))
}

class(mean) <- "comparable"

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

mean <- sort(mean)

x <- vector()
y <- vector()
for(i in 1:length(mean)){
  x <- c(x, mean[[i]][2])
  y <- c(y, mean[[i]][1])
}

par(mfrow=c(1,1),las=3, mar=c(10,3,3,3))
plot(rev(x), type = "h",xaxt="n", xlab = "", ylab = "Feature Support")
axis(1, at=1:length(mean), labels=rev(y), padj=1)
