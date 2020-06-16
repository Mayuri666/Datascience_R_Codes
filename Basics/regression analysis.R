
#load data
Nd<-read.csv("C:/Users/Mayuri/Desktop/NewspaperData.csv")

#visualisation
library("lattice")
dotplot(Nd$sunday,main="dot plot of sunday circulations",col="blue")
dotplot(Nd$daily,main="dot plot of daily circulations",col="blue")
boxplot(Nd$sunday,col="red")
boxplot(Nd$daily,col="red")

#Regression equation
#syntax model<-lm(y variable~x variable,data=dataset name)

model<-lm(sunday~daily,data = Nd)
summary(model)
new<-data.frame(daily=c(200,250,300))#prediction for 200,250,300 daily circulations
pred<-predict(model,newdata=new)

pred<-predict(model)
finaldata<-data.frame(Nd,pred,"Error"=Nd$sunday-pred)






