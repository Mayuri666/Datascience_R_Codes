install.packages("plyr")
library(plyr)
x<-runif(50)#generating 50 random nos from the uniform distribution(0,1)
y<-runif(50)
data<-cbind(x,y)
plot(data)
#get the reference value of k for
#the experiment in elbow plt-4 clusters
##use the above k value as reference and run the below for loo to find optimum k value

wss<-c()
for(i in 2:15) wss[i]<-sum(kmeans(data,centers=i)$withinss)
plot(1:15,wss,type="b",xlab="No of clusters",ylab="Avg distance")



###Cluster algorithm building
km<-kmeans(data,8)
km$centers
km$cluster


##
install.packages("animation")
library(animation)
windows()
km<-kmeans.ani(data,8)
######
#whenever windows()is there run the two programs together




