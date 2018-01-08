#Name: Po-Hsun Chen
#CWID: 10419083

# Name: Po-Hsun Chen
# CWID: 10419083


rm(list=ls())
library(C50)

data <- read.csv("C:/Users/Orlando/Dropbox/513/Project/KaggleV2-May-2016.csv",sep=",", na.strings = "")
data=na.omit(data)
data = data[0:10000,]

mmnorm<-function(x){
  z<-((x-min(x))/(max(x)-min(x)))
  return(z)
}

mmnorm_age<-function(x){
  z<-((x*3)
}

data$Age = mmnorm_age(data[,6])
head(data)

nrow(data)
head(data)

data$Gender <- as.character(data$Gender)
data$Gender[which(data$Gender=='F')]<-'0'
data$Gender[which(data$Gender=='M')]<-'1'
data$Gender <- as.integer(data$Gender)

d = data[,c(6,8,9,13,14)]

# Store every fifthrecord in a "test" dataset starting with the first record
idx=seq(from=1,to=nrow(d),by=5)
test<-d[idx,]
training<-d[-idx,]

head(training)
library(class)

table(data$No.show)

set.seed(9850)
g<- runif(nrow(d))
dataa <- d[order(g),]

str(dataa)

m1 <- C5.0(dataa[,-c(1,5)], as.factor(dataa[,5]))
m1

summary(m1)

p1 <- predict(m1, dataa)
p1

# show performance
table(d[,5], Predicted = p1)
plot(m1)
wrong <- (d[,5]!=p1)
rate<-sum(wrong)/length(wrong)
rate