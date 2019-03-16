





CrossTable(x = main.test$M, y = main.singlernn, prop.chisq=FALSE) 
main.rnn <- rknn(data=main.train, newdata=main.test, y=main.train$M, r=200, mtry=numberOfAttributes, seed=20081029)
getAccurancy(fitted(main.rnn), main.test$M)




length(varNotUsed(main.rnn))
varUsed<- varUsed(main.rnn)
varUsed
summary(varUsed)
hist(varUsed, xlab="Multiplicity", main="")
trunc(sqrt(ncol(main.train)))
set.seed(20081031)

noten.beg<- rknnBeg(main.data, main.data$M, r=200, mtry=3, k=100)
plot(noten.beg)




noten.data <- td[,c(3,1,2,4,11)]
set.seed(123)
training.samples <- noten.data$M %>%
  createDataPartition(p = 0.8, list = FALSE)

noten.train  <- noten.data[training.samples, ]
noten.test <- noten.data[-training.samples, ]
noten.cl <- noten.train$M
noten.rnn <- rknn(data=noten.train, newdata=noten.test, y=noten.train$M, r=500, mtry=5, seed=20081029)
confusion(noten.test$M, fitted(noten.rnn))

length(varNotUsed(noten.rnn))
varUsed<- varUsed(noten.rnn)
summary(varUsed)
hist(varUsed, xlab="Multiplicity", main="")
noten.class <- knn(noten.train, noten.test, noten.cl, k=1)
confusion(noten.test$M, noten.class)
(2+83+204+174+138+61+19+10+1)/721
rknnSupport(data = noten.train, y = noten.cl, k = 111)



