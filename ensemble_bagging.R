#Bagging, we just have to add a for loop rest data partition remains same
acc<-c()
for(i in 1:500)
{
  print(i)
  #data partition
  inTraininglocal<-createDataPartition(iris$Species,p=.85,list=F)
  training<-iris[inTraininglocal,]
  testing<-iris[-inTraininglocal,]
  
  #Model building
  model<-C5.0(training$Species~.,data=training)
  
  #generate the model summary
  summary(model)
  #predict for test dataset
  pred<-predict.C5.0(model,testing[,-5])
  a<-table(testing$Species,pred)
  #accuracy
  acc<-c(acc,sum(diag(a))/sum(a))
}
summary(acc)
boxplot(acc)

#boosting

acc<-c()
for(i in 1:500)
{
  print(i)
  #data partition
  inTraininglocal<-createDataPartition(iris$Species,p=.85,list=F)
  training<-iris[inTraininglocal,]
  testing<-iris[-inTraininglocal,]
  
  #Model building
  model<-C5.0(training$Species~.,data=training,trials=25)
  
  #generate the model summary
  summary(model)
  #predict for test dataset
  pred<-predict.C5.0(model,testing[,-5])
  a<-table(testing$Species,pred)
  #accuracy
  acc<-c(acc,sum(diag(a))/sum(a))
}
summary(acc)
boxplot(acc)
