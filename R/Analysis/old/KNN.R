#Load libraries
library(tidyverse)
library(caret)

#Load the data
td <- read.csv("~/Documents/workspaces/knime-workspace/Projektarbeit CAS/results/students_withAllValuesOhneAussreisserBinned.csv", header=TRUE)
td <- td[,c(2,3,4)]

# Inspect the data
sample_n(td, 3)

# Split the data into training and test set
set.seed(123)
training.samples <- td$M %>% 
  createDataPartition(p = 0.8, list = FALSE)
train.data  <- td[training.samples, ]
test.data <- td[-training.samples, ]

# Fit the model on the training set
set.seed(123)
model <- train(
  M ~., data = train.data, method = "knn",
  trControl = trainControl("cv", number = 10),
  preProcess = c("center","scale"),
  tuneLength = 20
)
# Plot model accuracy vs different values of k
plot(model)

# Print the best tuning parameter k that
# maximizes model accuracy
model$bestTune

predicted.classes <- model %>% predict(test.data)
head(predicted.classes)
mean(predicted.classes == test.data$M)
