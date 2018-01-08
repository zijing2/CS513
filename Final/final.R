rm(list=ls())

MedicalAppointment<-read.csv(file="/Users/huangzijing/Desktop/3nd\ Semester\ in\ SIT/CS513/git/Final/KaggleV2-May-2016.csv")

# DATASET ANALYSIS

# DATASET NOMALIZATION FUNCTION
mmnorm<-function(x){
  z<-((x-min(x))/(max(x)-min(x)))
  return(z)  
}

# CLEANNING DATASET
Gender = factor(MedicalAppointment[,3])
Interval = as.integer(as.Date(MedicalAppointment[,5])-as.Date(MedicalAppointment[,4])) 
Age <- MedicalAppointment[,6]
Scholarship <- MedicalAppointment[,8]
Hipertension <- MedicalAppointment[,9]
Diabetes <- MedicalAppointment[,10]
Alcoholism <- MedicalAppointment[,11]
Handcap <- MedicalAppointment[,12]
SMS_received <- MedicalAppointment[,13]
No_show <- factor(MedicalAppointment[,14])

data <- cbind(Gender,Interval,Age,Scholarship,Hipertension,Diabetes,Alcoholism,Handcap,SMS_received,No_show)
## age>0 and nomalize age
data <- data[data[,3]>0,]
data <- data[data[,1]>0,]
## nomalize age and Handcap
data[,1] <- mmnorm(data[,1])
data[,2] <- mmnorm(data[,2])
data[,3] <- mmnorm(data[,3])
data[,8] <- mmnorm(data[,8])
data[,10] <- mmnorm(data[,10])

write.csv(data,file="/Users/huangzijing/Desktop/3nd\ Semester\ in\ SIT/CS513/git/Final/data.csv")

set.seed(511)
## split the training set and test set
n = nrow(data)
trainindex <- sample(1:n,0.7*n)
training <- data[trainindex,]
test <- data[-trainindex,]

# KNN error_rate: 0.23
library(class)
predict<-knn(training[,-10],test[,-10],training[,10],k=3)
error<-test[,10]!=predict
error_rate<-sum(error)/length(error)


# KKNN
library(kknn)
install.packages("kknn")
kknn_model <- kknn(No_show~., as.data.frame(training[0:500]), as.data.frame(test[0:500]), distance = 1,
                  kernel = "triangular")



# Cart
library('C50')
training[,10]<-factor(training[,10])
mytree<-C5.0(factor(training[,10])~.,data=data.frame(training))
plot(mytree)

# feature selection (reference: https://machinelearningmastery.com/feature-selection-with-the-caret-r-package/)
# install.packages("mlbench")
# install.packages("caret")
library(lattice)
library(ggplot2)
library(mlbench)
library(caret)


