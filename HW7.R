# Zijing Huang
# 10414952

rm(list=ls())
#install.packages("randomForest")
library(randomForest)
#?randomForest

# load data into memory
bcw<-read.csv("/Users/huangzijing/Desktop/3nd\ Semester\ in\ SIT/CS513/midterm/breast-cancer-wisconsin.data.csv")

# factorize the Class column
bcw$Class <- as.factor(bcw$Class)

# make sure the classification is the same the next time
set.seed(123)

# sperate the training and test dataa
index <- seq (1,nrow(bcw),by=5)
test<-bcw[index,]
training<-bcw[-index,]

# training the data
fit <- randomForest( Class~., data=training[,-1], importance=TRUE, ntree=2000)
importance(fit)
varImpPlot(fit)
getTree(fit, 500, labelVar=TRUE)

# validation and compute the performance
# prediction <- predict(fit, test, "prob")
prediction <- predict(fit, test)
# confusion matrix
table(actual=test[,11],prediction)
error<- (test[,11]!=prediction )
error_rate<-sum(error)/length(error)
error_rate 

