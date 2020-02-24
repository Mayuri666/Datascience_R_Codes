car<-read.csv("C:/Users/Mayuri/Desktop/Cars.csv")
model.car<-lm(MPG~.,data=car)
summary(model.car)

#multi-collinearity
install.packages("car")
library(car)
car::vif(model.car)
#diagnostic plots
#residual plit, qq plot, residual vs fitted
plot(model.car)

#residual vs regressor
residualPlots(model.car)
#added variable plots
#avplots(model.car,id.n=2,id.ces=0.7)
#QQ plots of studentized residuals
qqPlot(model.car)
#deletion diagnostics
influenceIndexPlot(model.car)
###iteration 1
#remove 77th observation
cars1<-car[-77,]
model1<-lm(cars1$MPG~.,data=cars1)
car::vif(model1)
plot(model1)
residualPlots(model1)
qqPlot(model1)
influenceIndexPlot(model1)

###iteration 2
#remove 79th and 80th observation
cars2<-car[-c(79,80)]
model2<-lm(cars2$MPG~.,data=cars2)
car::vif(model2)
plot(model2)
residualPlots(model2)
qqPlot(model2)
influenceIndexPlot(model2)