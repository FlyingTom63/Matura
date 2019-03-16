library(randomForest)
library(caret)
library(dplyr)
library("iml")

writeLines(c(""), "~/Documents/workspaces/HSLU-ML/R/log.txt")  
#load data
main.data <- read.csv("~/Documents/workspaces/knime-workspace/Projektarbeit CAS/results/students_withAllValuesOhneAussreisserOnlyMBinned.csv", header=TRUE)
#order columns
main.data <- main.data[,c(3,1,2,4,5,6,7,8,9,10,11)]

#transform M to a vector
main.data$M <- as.factor(main.data$M)

#Split the data into train and test set
set.seed(123)
training.samples <- main.data$M %>%
  createDataPartition(p = 0.70, list = FALSE)
main.train <- main.data[training.samples, ]
main.test <- main.data[-training.samples, ]

model <- randomForest(formula = M ~ ., data = main.train, importance = TRUE, ntree = 500, mtry = 3) 

importance <- model$importance

df <- as.data.frame(importance)

par(mfrow=c(1,1),las=3, mar=c(10,3,3,3))
plot(rev(df$MeanDecreaseAccuracy), type = "h",xaxt="n", xlab = "", ylab = "Feature Importance", main = "Alle Eigenschaften")
axis(1, at=1:length(df$MeanDecreaseAccuracy), labels=rev(row.names(df)))
