# load the package
source("~/Documents/workspaces/HSLU-ML/R/Simulations.R")
source("~/Documents/workspaces/HSLU-ML/R/ModelFunctions.R")
source("~/Documents/workspaces/HSLU-ML/R/FunctionUtils.R")
library(OneR)

writeLines(c(""), "~/Documents/workspaces/HSLU-ML/R/log.txt")  
td <- read.csv("~/Documents/workspaces/knime-workspace/Projektarbeit CAS/results/students_withAllValuesOhneAussreisser.csv", header=TRUE)
td <- td[,-c(1:7)]
td <- td[,-c(3)]
td <- td[,-c(4:10)]

swapCols(td, 1, 3)
maxNumIteration <- 10
td$M <- factor(td$M)
names <- colnames(td)

for(idx in 3:4){
  rf_simulation(idx)
}

td <- read.csv("~/Documents/workspaces/knime-workspace/Projektarbeit CAS/results/students_withAllValuesOhneAussreisser.csv", header=TRUE)
td <- td[,-c(1:8)]
td <- td[,-c(2,11)]

swapCols(td, 1, 2)
maxNumIteration <- 10
td$M <- factor(td$M)
names <- colnames(td)

for(idx in 3:8){
  rf_simulation(idx)
}


closeAllConnections()
