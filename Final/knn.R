# Name: Po-Hsun Chen
# CWID: 10419083


rm(list=ls())

data <- read.csv("C:/Users/Orlando/Dropbox/513/Project/KaggleV2-May-2016.csv",sep=",", na.strings = "")
data=na.omit(data)
data<-data[60000:90000,]

mmnorm<-function(x){
  z<-((x-min(x))/(max(x)-min(x)))
  return(z)
}
mmnorm_age<-function(x){
  z<-((x-min(x))/(max(x)-min(x)))
  return(z*3)
}
data$Age = mmnorm_age(data[,6])
data$Handcap = mmnorm(data[,11])
head(data)

nrow(data)
head(data)

data$Gender <- as.character(data$Gender)
data$Gender[which(data$Gender=='F')]<-'0'
data$Gender[which(data$Gender=='M')]<-'1'
data$Gender <- as.integer(data$Gender)

d = data[,c(6,8,13,14)]

# Store every fifthrecord in a "test" dataset starting with the first record
idx=seq(from=1,to=nrow(d),by=3)
test<-d[idx,]
training<-d[-idx,]

head(training)
library(class)

# Romove the Nth record in training data set While the Nth record is being predicted
predict<-knn(training[,-grep("No.show", colnames(training))], test[,-grep("No.show", colnames(test))], training[,"No.show"],k=8)


results<-cbind(test, as.character(predict))
head(results, 100)

# Measure the performance of knn
error_list<-results[,4]!=results[,5]
error_rate<-sum(error_list)/length(error_list)
print(error_rate)