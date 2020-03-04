wbcd<-read.csv("C:/Users/Mayuri/Desktop/KNN.csv")
wbcd<-KNN[-1]#removes 1st column of ID

#table of diagnosis
table(wbcd$diagnosis)#gives number of benign and malignants

#table or proportions with some informative labels
round(prop.table(table(wbcd$diagnosis))*100,digits=1)
#create normalisation funtion
normalize<-function(x){
  return((x-min(x))/(max(x)-min(x)))
}

#normalise the wbcd data
wbcd_n<-as.data.frame(lapply(wbcd[2:31],normalize))
wbcd_nl<-cbind(wbcd_n,wbcd$diagnosis)

#create training and test data
wbcd_train<-wbcd_n[1:469,]
wbcd_test<-wbcd_n[470:569,]

#create labels for training and test data
wbcd_train_labels<-wbcd[1:469,1]
wbcd_test_labels<-wbcd[470:569,1]

#----training a model on the data---
#load the 'class' library
library(class)

wbcd_test_pred<-knn(train=wbcd_train,test=wbcd_test,cl=wbcd_train_labels,k=20)
#   evaluating model performance
#load gmodel
install.packages("gmodels")
library(gmodels)

#create the cross tabulation of predicted vs actual
CrossTable(x=wbcd_test_labels,y=wbcd_test_pred,prop.chisq=FALSE,prop.c=FALSE,prop.r=FALSE)
###############
#Improving model performance
#use scale()function to z-score standardise data frame
wbcd_z<-as.data.frame(scale(wbcd[-1]))

#confirm that transformation was applied correctly
summary(wbcd_z$area_mean)

#create training and test data set
wbcd_train<-wbcd_z[1:469,]
wbcd_test<-wbcd_z[470:569,]

#re-classify test cases
wbcd_test_pred<-knn(train=wbcd_train,test=wbcd_test,cl=wbcd_train_labels,k=21)

#create crosstable of pred vs actual
CrossTable(x=wbcd_test_labels,y=wbcd_test_pred,prop.chisq = FALSE,prop.c = FALSE,prop.r = FALSE)

#TRY several different values of k
wbcd_train<-wbcd_n[1:469,]
wbcd_test<-wbcd_n[470:569,]

wbcd_test_pred<-knn(train=wbcd_train,test=wbcd_test,cl=wbcd_train_labels,k=1)
CrossTable(x=wbcd_test_labels,y=wbcd_test_pred,prop.chisq = FALSE,prop.c = FALSE,prop.r = FALSE)


wbcd_test_pred<-knn(train=wbcd_train,test=wbcd_test,cl=wbcd_train_labels,k=5)
CrossTable(x=wbcd_test_labels,y=wbcd_test_pred,prop.chisq = FALSE,prop.c = FALSE,prop.r = FALSE)

############Neural Networks###########

concrete <- read.csv("C:/Users/Mayuri/Desktop/R/concrete.csv")
concrete_norm<-as.data.frame(lapply(concrete,normalize))

#creating training and test dataset
concrete_train<-concrete_norm[1:773,]
concrete_test<-concrete_norm[774:1030,]

#Training a model on the data
#train the neural net model
library(neuralnet)
install.packages("neuralnet")
library(neuralnet)

#simple ANN with only a single neuron
concrete_model<-neuralnet(formula=strength~cement+slag+ash+water+superplastic+coarseagg+fineagg+age,data=concrete_train)
#visualize the neural topography
windows()
plot(concrete_model)

##evaluating model performance
#obtain model results

model_results<-compute(concrete_model,concrete_test[1:8])

#obtain predicted strength values
predicted_strength<-model_results$net.result

#examine the correlation between predicted and actual values
cor(predicted_strength,concrete_test$strength)

##improving the model performance
#a more complex neural network with 5 hidden neurons
concrete_model2<-neuralnet(strength~cement+slag+ash+water+superplastic+coarseagg+fineagg+age,data=concrete_train,hidden=c(5,2))

#plot the network
windows()
plot(concrete_model2)

#evaluate the results as we did before
model_results2<-compute(concrete_model2,concrete_test[1:8])

#obtain predicted strength values
predicted_strength<-model_results2$net.result

#examine the correlation between predicted and actual values
cor(predicted_strength,concrete_test$strength)
