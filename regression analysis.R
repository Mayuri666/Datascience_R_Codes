

#Regression analysis
#model<-lm(y variable~x variable,data=dataset name)


model<-lm(sunday~daily,data = NewspaperData)
summary(model)

#prediction for 300 daily circulations
pred<-predict(model,newdata=data.frame(daily=300))
pred
