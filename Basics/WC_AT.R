wc<-read.csv("C:/Users/Mayuri/Desktop/WC_AT.csv")

#visualisation
library("lattice")
dotplot(wc$Waist,main="dot plot of waist circumferences",col="blue")
dotplot(wc$AT,main="dot plot of adipose tissue",col="blue")
boxplot(wc$Waist,col="green")
boxplot(wc$AT,col="green")

#Regression equation
#syntax model<-lm(y variable~x variable,data=dataset name)

model<-lm(AT~Waist,data=wc)
summary(model)


new<-data.frame(Waist=c(60,70))#prediction for waist of 60,70
pred<-predict(model,newdata=new)




pred<-predict(model)
finaldata<-data.frame(wc,pred,"Error"=wc$AT-pred)
