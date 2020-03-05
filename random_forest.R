install.packages("caret",dependencies=TRUE)
install.packages("randomforest")
library(randomForest)


model<-randomForest(iris$Species~.,data=iris,ntre=1000)
#view the forest results
print(model)
#importance of the variable-lower gini
print(importance(model))
#prediction
pred<-predict(model,iris[,-5])
table(pred,iris$Species)
