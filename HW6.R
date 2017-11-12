rm(list=ls())
#install.packages("neuralnet")
library("neuralnet")

bcw<-read.csv("/Users/huangzijing/Desktop/3nd\ Semester\ in\ SIT/CS513/breast-cancer-wisconsin.data.csv",sep=",",na.strings="?")
bcw=na.omit(bcw)
mmnorm<-function(x){
  z<-((x-min(x))/(max(x)-min(x)))
  return(z)  
}

norm_bcw<-data.frame()
# 0:2 1:4
norm_bcw<-cbind(bcw$Sample,ifelse(bcw$Class==4,1,0))

for(i in(2:(length(bcw)-1))){
  norm_bcw<-cbind(norm_bcw,mmnorm(bcw[,i]))
}

colnames(norm_bcw) <- c("id","Output","F1","F2","F3","F4","F5","F6","F7","F8","F9")

indx<-seq(1,nrow(norm_bcw),5)
trainingdata<-norm_bcw[-indx,]
test<-norm_bcw[indx, ]

bcw_ann <- neuralnet(Output~F1+F2+F3+F4+F5+F6+F7+F8+F9, trainingdata, hidden=5, threshold=0.01)
print(bcw_ann)
plot(bcw_ann)

#trainning
trainning_ann <- as.data.frame(compute(bcw_ann, trainingdata[,c(-1,-2)] ))
training_resutls<-as.data.frame(cbind(ann=trainning_ann[,17],actual=trainingdata[,2]))
#confusion matrix
tbl<-table(Predict=training_resutls[,1],Acutal=training_resutls[,2])

attach(training_resutls)
training_resutls2<-training_resutls[order(ann),]
detach(training_resutls) 

#validation
net.results <- as.data.frame(compute(bcw_ann, test[,c(-1,-2)]))

diag<-ifelse(net.results[,17]>=.12,1,0)

resutls<-as.data.frame(cbind(net.results[,17],ann=diag,actual=norm_bcw[indx,2]))
wrong<- (resutls$ann!=resutls$actual )
error_rate<-sum(wrong)/length(wrong)
table(ann=resutls$ann,actual=resutls$actual)



