rm(list=ls())
{
  library(randomForest)
  MedicalAppointment<-read.csv(file="/Users/ben/Dropbox/Stevens/CS513 Data Mining/Project/KaggleV2-May-2016.csv")
  
  # DATASET ANALYSIS
  
  # DATASET NOMALIZATION FUNCTION
  mmnorm<-function(x){
    z<-((x-min(x))/(max(x)-min(x)))
    return(z)  
  }
  
  # CLEANNING DATASET
  Gender <- as.character(MedicalAppointment[,"Gender"])
  Gender[which(Gender=='F')]<-'0'
  Gender[which(Gender=='M')]<-'1'
  Gender <- as.factor(Gender)
  Interval = as.integer(as.Date(MedicalAppointment[,5])-as.Date(MedicalAppointment[,4])) 
  Age <- MedicalAppointment[,6]
  Neighbourhood <- as.factor(MedicalAppointment[,7])
  Scholarship <- MedicalAppointment[,8]
  Hipertension <- MedicalAppointment[,9]
  Diabetes <- MedicalAppointment[,10]
  Alcoholism <- MedicalAppointment[,11]
  Handcap <- MedicalAppointment[,12]
  SMS_received <- MedicalAppointment[,13]
  No_show <- factor(MedicalAppointment[,14])
  

  # data <- cbind(Gender,Interval,Age,Scholarship,Hipertension,Diabetes,Alcoholism,Handcap,SMS_received,No_show)
  data <- data.frame(Gender, Interval, Age, Scholarship, Hipertension, 
                     Diabetes, Alcoholism, Handcap, SMS_received, No_show)
  ## exclude age<=0
  data <- data[data[,"Age"]>0,]
  ## nomalize age Handcap, Interval
  data[,"Age"] <- mmnorm(data[,"Age"])
  data[,"Handcap"] <- mmnorm(data[,"Handcap"])
  data[,"Interval"] <- mmnorm(data[,"Interval"])
  # Neighbourhood
  #data.temp<-cbind(Neighbourhood)
  #data[,"Neighbourhood"] <- mmnorm(data.temp[,"Neighbourhood"])
}
{
  idx<-sample(nrow(data)*0.7,as.integer(.70*nrow(data)*0.7))
  training<-data[idx,]
  test<-data[-idx,]
  
  rfm<-randomForest(No_show~., data=training, importance=TRUE, ntree=2000)
  prediction <- predict(rfm, test)
  importance(rfm) # !!!importances of each feature!!!
  mean(test[,"No_show"]==prediction)
  varImpPlot(rfm)
  # plot(rfm)
  
  error<-(test[,"No_show"]!=prediction )
  error.rate<-sum(error)/length(error)
  error.rate 
  table(test[,"No_show"], prediction)
}
