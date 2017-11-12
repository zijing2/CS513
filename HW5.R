rm(list=ls())
#install.packages("C50")

library('C50')

?C5.0
?system

bcw<-read.csv("/Users/huangzijing/Desktop/3nd\ Semester\ in\ SIT/CS513/breast-cancer-wisconsin.data.csv")
#bcw=na.omit(bcw)
categories<-factor(bcw[,11])
bcw<-cbind(bcw[,2:10],categories)
attach(bcw)
mytree<-C5.0(categories~.,data=bcw)
summary(mytree)
mytree
plot(mytree)
