#Load libraries
library(tidyverse)
library(caret)
theme_set(theme_classic())

#Load the data
td <- read.csv("~/Documents/workspaces/knime-workspace/Projektarbeit CAS/results/students_withAllValuesOhneAussreisser.csv", header=TRUE)
td$var <- td$M - td$X3
#Split the data into train and test set
set.seed(123)
training.samples <- td$M %>%
  createDataPartition(p = 0.8, list = FALSE)

train.data  <- td[training.samples, ]
test.data <- td[-training.samples, ]

ggplot(td, aes(td$RANG, td$var) ) + geom_point() + stat_smooth()
