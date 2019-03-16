#Load FunctionUtils

#Load Libraries
library(caret)
library(class)
library(dplyr)
#load data
main.data <- read.csv("~/Documents/workspaces/knime-workspace/Projektarbeit CAS/results/students_withAllValuesOhneAussreisserBinnedAndNormalized.csv", header=TRUE)
main.data$M <- main.data$M - main.data$X3_Orig
#order columns
main.data <- main.data[,c(3,1,2,4,5,6,7,8,9,10,11)]


X <- list()
X <- c(X, list(c(1, 3, 8)))
X <- c(X, list(c(1, 3, 4, 7)))
X <- c(X, list(c(1, 3, 6, 8, 9)))
X <- c(X, list(c(1, 3, 4, 6, 7, 8)))
X <- c(X, list(c(1, 3, 4, 6, 7, 8, 11)))
X <- c(X, list(c(1, 2, 3, 4, 6, 7, 8, 11)))
X <- c(X, list(c(1, 2, 3, 4, 6, 7, 8, 9, 11)))
X <- c(X, list(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 11)))
X <- c(X, list(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11)))

TIT <- array()
TIT[1] <- "Note 3. Jahr, Sicherheit"
TIT[2] <- "Note 3. Jahr, Arbeitsmarkt, Rang"
TIT[3] <- "Note 3. Jahr, Erreichbarkeit, Sicherheit, \nSteuerfuss"
TIT[4] <- "Note 3. Jahr, Arbeitsmarkt, Erreichbarkeit, Rang,\nSicherheit"
TIT[5] <- "Note 3. Jahr, Arbeitsmarkt, Erreichbarkeit, Rang,\nSicherheit, Landessprache"
TIT[6] <- "Note 3. Jahr, Arbeitsmarkt, Erreichbarkeit, Rang,\nSicherheit, Landessprache, Mathematik"
TIT[7] <- "Note 3. Jahr, Arbeitsmarkt, Erreichbarkeit, Rang,\nSicherheit, Landessprache, Mathematik, \nSteuerbelastung"
TIT[8] <- "Note 3. Jahr, Arbeitsmarkt, Erreichbarkeit, Rang,\nSicherheit, Landessprache, Mathematik, \nSteuerbelastung, Bevölkerung"
TIT[9] <- "Alle"

par(mfrow=c(3,3), cex = 0.5, mar=c(3,3,5,3))
for(idx in (1:length(X))){
  data <- main.data[, X[[idx]]]
  M <- data$M

  #Split the data into 10 groups
  set.seed(10*idx)
  folds <- createFolds(M, k=10)
  
  set.seed(1)
  ks <- 1:50
  res <- sapply(ks, function(k) {
    res.k <- sapply(seq_along(idx), function(i) {
      pred <- knn(train = data[ -folds[[i]], ], test = data[ folds[[i]], ], cl = M[ -folds[[i]] ], k = k)
      mean(M[ folds[[i]] ] != pred)
    })
  
    mean(res.k)
  })
  
  plot(ks, res, type="o", xlab = "K-Werte", ylab="10 Fold Cross-Validation Fehler", main = paste(TIT[idx]))
 }
