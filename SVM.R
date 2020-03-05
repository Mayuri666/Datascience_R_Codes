####support vector machine###
##optical character recognition
letterdata<-read.csv("C:/Users/Mayuri/Desktop/R/letterdata.csv")

#divide into training and test data
letters_train<-letterdata[1:16000,]
lettersdata_test<-letterdata[16001:20000,]

#training a model on the data
#begin by training a simple linear SVM
library(kernlab)
letter_classifier<-ksvm(letter~.,data=letters_train,kernel="vanilladot")

##evaluating model performance
#prediction on test data
letter_predictions<-predict(letter_classifier,lettersdata_test)
head(letter_predictions)
table(letter_predictions,lettersdata_test$letter)
agreement<-letter_predictions==lettersdata_test$letter
prop.table(table(agreement))

#improving model performance
letter_classifier_rbf<-ksvm(letter~.,data=letters_train,kernel="rbfdot")
letter_predictions_rbf<-predict(letter_classifier_rbf,lettersdata_test)
head(letter_predictions_rbf)
agreement_rbf<-letter_predictions_rbf==lettersdata_test$letter
table(agreement_rbf)
prop.table(table(agreement_rbf))
