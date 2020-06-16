toy<-read.csv("C:/Users/Mayuri/Desktop/Toyoto_Corrola.csv")
toyoto<-toy[,-c(1,2,9)]

#scatter plot matrix
pairs(toyoto)
#correlation matrix
cor(toyoto)
#regression model and summary
model.toyoto<-lm(Price~.,data=toyoto)
summary(model.toyoto)

#multi-collinearity

library(car)
car::vif(model.toyoto)# chk if it is above 20, if so problem wid multicollinearity

#diagnostic plots
#residual plit, qq plot, residual vs fitted
plot(model.toyoto)

#residual vs regressor
residualPlots(model.toyoto)
#added variable plots
#avplots(model.car,id.n=2,id.ces=0.7)
#QQ plots of studentized residuals
qqPlot(model.toyoto)
#deletion diagnostics
influenceIndexPlot(model.toyoto)
###iteration 1
#remove 222th observation
toyoto1<-toyoto[-222,]
model.toyoto1<-lm(Price~.,data=toyoto1)
summary(model.toyoto1)
car::vif(model.toyoto1)
plot(model.toyoto1)
residualPlots(model.toyoto1)
qqPlot(model.toyoto1)
influenceIndexPlot(model.toyoto1)


###iteration 2
#remove 602nd observation
toyoto2<-toyoto[-602,]
model.toyoto2<-lm(Price~.,data=toyoto2)
summary(model.toyoto2)
car::vif(model.toyoto2)
plot(model.toyoto2)
residualPlots(model.toyoto2)
qqPlot(model.toyoto2)
influenceIndexPlot(model.toyoto1)
