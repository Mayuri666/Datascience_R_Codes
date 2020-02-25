claimants<-read.csv("C:/Users/Mayuri/Desktop/claimants.csv")
sum(is.na(claimants))# N/A values
claimants<-na.omit(claimants)#na.omit will remove the rows from the data set which has atleast one n/a values
dim(claimants)#dimensions ie no. of rows and columns
colnames(claimants)
claimants<-claimants[,-1]#removing the first column which is the index number
#preparing the linear regression
mod_lm<-lm(ATTORNEY~.,data=claimants)
pred1<-predict(mod_lm,claimants)
pred1
plot(claimants$CLMINSUR,pred1)
plot(pred1)
#GLM function uses sigmoid curve to produce desirable results
#the output of the sigmoid curve lies between 0-1
model<-glm(ATTORNEY~.,data=claimants,family="binomial")
summary(model)
#confusion matrix table
prob<-predict(model,claimants,type="response")
prob
#confusion matrix and considering the threshold value as 0.5
confusion<-table(prob>0.5,claimants$ATTORNEY)
confusion
#model accuracy
Accuracy<-sum(diag(confusion)/sum(confusion))
Accuracy#70.52
