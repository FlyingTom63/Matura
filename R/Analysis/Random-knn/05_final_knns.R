#load data
main.data <- read.csv("~/Documents/workspaces/knime-workspace/Projektarbeit CAS/results/students_withAllValuesOhneAussreisserOnlyMBinned.csv", header=TRUE)
#order columns
main.data <- main.data[,c(3,2,4,6,7,8)]

acc <- vector()
for(seed in seq(1, 3000, by = 100)){
  set.seed(344)
  samples <- main.data$M %>% createDataPartition(p = 0.70, list = FALSE)

  main.train <- main.data[samples,]
  main.test <- main.data[-samples,]

  pred <- knn(train = main.train, test = main.test, cl = main.train$M, k = 8, prob=TRUE) 
  acc <- c(acc, 1-mean(main.test$M != pred))
}
mean(acc)


main.data <- read.csv("~/Documents/workspaces/knime-workspace/Projektarbeit CAS/results/students_withAllValuesOhneAussreisserOnlyMBinned.csv", header=TRUE)
#order columns
main.data <- main.data[,c(3,1,2,7,8,11)]

acc <- vector()
for(seed in seq(1, 3000, by = 100)){
  set.seed(344)
  samples <- main.data$M %>% createDataPartition(p = 0.70, list = FALSE)
  
  main.train <- main.data[samples,]
  main.test <- main.data[-samples,]
  
  pred <- knn(train = main.train, test = main.test, cl = main.train$M, k = 8, prob=TRUE) 
  acc <- c(acc, 1-mean(main.test$M != pred))
}
mean(acc)