set.seed(42)

library(randomForest)
library(mlbench)
library(caret)

main.data <- read.csv("~/Documents/workspaces/knime-workspace/Projektarbeit CAS/results/students_withAllValuesOhneAussreisserOnlyMBinned.csv", header=TRUE)
main.data$M <- as.factor(main.data$M)
main.data <- main.data[,c(3,1,2,4,5,6,7,8,9,10,11)]

training.samples <- main.data$M %>%
  createDataPartition(p = 0.70, list = FALSE)
x <- main.data[, -c(1)]
y <- main.data$M

# optimize random forest
seed <- 7
metric <- "Accuracy"
set.seed(seed)
mtry <- sqrt(ncol(x))
control <- trainControl(method="repeatedcv", number=10, repeats=3, search="random")
set.seed(seed)
mtry <- sqrt(ncol(x))
rf_random <- train(M~., data=main.data, method="rf", metric=metric, tuneLength=15, trControl=control)
print(rf_random)
plot(rf_random)
