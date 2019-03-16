getAccurancy <- function (pPred, pTestData){
  result <- data.frame(pred=pPred, expec=pTestData)
  result$equal <- as.character(result$expec) == as.character(result$pred)
  as.data.frame(table(result$equal))$Freq[2] / length(pPred)
}

swapCols <- function(v,a,b){ 
  name = deparse(substitute(v))
  
  helpy = v[,a]
  v[,a] = v[,b]
  v[,b] = helpy
  
  
  name1 = colnames(v)[a] 
  name2 = colnames(v)[b] 
  
  colnames(v)[a] = name2
  colnames(v)[b] = name1
  
  assign(name,value = v , envir =.GlobalEnv)
}

# get Index of dataframe as 70% train and 30%test datasets
getIndex <- function(dataFrame){
  sample(2, nrow(dataFrame), replace=TRUE, prob=c(0.7, 0.3))
}


prepareDataFrame <- function(idx, data, colNames, labels){
  df <- subset(x = td, select=c(names[1], names[2], names[idx]))
  attribute <- bin(df[[names[idx]]], nbins = 4, labels = c("3", "4", "5","6"), method = "length")
  df[[names[idx]]] <- as.numeric(as.character(attribute))
  df
}
