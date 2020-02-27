mydata<-read.csv("C:/Users/Mayuri/Desktop/Universities.csv")


#####
mydata<-scale(mydata[,2:7])
d<-dist(mydata,method="euclidean")#computing the distance matrix
fit<-hclust(d,method="average")#building thealgorithm
plot(fit)#display dendogram
groups<-cutree(fit,k=4)#cut tree into four clusters
#draw dendrogram with red borders around the five clusters
rect.hclust(fit,k=4,border="red")
#attach the cluster numbers to Uni
clusters=data.frame('Uni'=mydata[,1],'cluster'=groups)



#building algorithm using 'centroid'
d1<-dist(mydata,method="euclidean")
fit<-hclust(d,method="centroid")#building algorithm using 'centroid'
plot(fit)
groups<-cutree(fit,k=4)
rect.hclust(fit,k=4,border="red")
