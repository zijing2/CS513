#  Course          : CS 513
#  First Name      : Zijing
#  Last Name       : Huang
#  Id              : 10414952
#  purpose         : apply HCluster to iris dataset

# Load the IRIS dataset
rm(list=ls())

data(iris)

# normalize the data
mmnorm<-function(x){
  z<-((x-min(x))/(max(x)-min(x)))
  return(z)  
}

data <- iris[,1:4]

data.normalized<-as.data.frame(lapply(data, mmnorm))

diris<-dist(data.normalized)
# diris<-dist(data)

# modeling
hiris<-hclust(diris)
plot(hiris)

# categorize the iris data into three (3) clusters
cut.hiris <- cutree(hiris, k=3) 
plot(cut.hiris)

# Tabulate the clustered rows against Species
table(cut.hiris, iris$Species)   

