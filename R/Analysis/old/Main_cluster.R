# load the package
source("~/Documents/workspaces/HSLU-ML/R/Simulations.R")
source("~/Documents/workspaces/HSLU-ML/R/FunctionUtils.R")

td <- read.csv("~/Documents/workspaces/knime-workspace/Projektarbeit CAS/results/students_withAllValuesOhneAussreisser.csv", header=TRUE)
td <- td[,-c(1:8)]
td <- td[,-c(2,11)]

swapCols(td, 1, 2)
maxNumIteration <- 1
td$M <- factor(td$M)
names <- colnames(td)

writeLines(c(""), "~/Documents/workspaces/HSLU-ML/R/log.txt")  

numCores <- detectCores()-1
cl <- makeCluster(numCores)
clusterExport(cl, c("maxNumIteration","td","names"))
clusterEvalQ(cl, {
  library(OneR)
  library(tidyverse)
  
  source("~/Documents/workspaces/HSLU-ML/R/Simulations.R")
  source("~/Documents/workspaces/HSLU-ML/R/ModelFunctions.R")
  source("~/Documents/workspaces/HSLU-ML/R/FunctionUtils.R")
})

# accurancies$NN <- parLapply(cl, 3:length(td), 0, nn_simulation)
p <- matrix(ncol = 2)
p[1] <- c(3:length(td))
p[2] <- 0
accurancies$KNN <- parLapply(cl, p , function(p){
  knn_simulation(p[1], p[2])
})

stopCluster(cl)

