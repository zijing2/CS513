#  Course          : CS 513
#  First Name      : Zijing
#  Last Name       : Huang
#  Id              : 10414952
#  purpose         : apply knn to iris dataset

# Load the IRIS dataset
rm(list=ls())

data(iris)
#View(iris)


idx<-seq(from=1,to=nrow(iris),by=5)

# Store every fifth record in a “test” dataset starting with the first record
test<-iris[idx,]
# Store the rest in the “training” dataset
training<-iris[-idx,]



library(class)

# Use knn with k=1 and classify the test dataset
predict1<-knn(training[,-5],test[,-5],training[,5],k=1)

correct1<-test[,5]==predict1
correct_rate1<-sum(correct1)/length(correct1)
correct_rate1

# Repeat the above steps with k=2, k=5, k=10.
table(Prediction=predict1,Actual=test[,5] )

# Use knn with k=2 and classify the test dataset
predict2<-knn(training[,-5],test[,-5],training[,5],k=2)
table(Prediction=predict2,Actual=test[,5] )

correct2<-test[,5]==predict2
correct_rate2<-sum(correct2)/length(correct2)
correct_rate2


# Use knn with k=5 and classify the test dataset
predict5<-knn(training[,-5],test[,-5],training[,5],k=2)
table(Prediction=predict5,Actual=test[,5] )

correct5<-test[,5]==predict5
correct_rate5<-sum(correct5)/length(correct5)
correct_rate5

# Use knn with k=10 and classify the test dataset
predict10<-knn(training[,-5],test[,-5],training[,5],k=2)
table(Prediction=predict10,Actual=test[,5] )

correct10<-test[,5]==predict10
correct_rate10<-sum(correct10)/length(correct10)
correct_rate10






