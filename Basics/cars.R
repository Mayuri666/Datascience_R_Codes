cr<-read.csv("C:/Users/Mayuri/Desktop/Cars.csv")

#scatter plot matrix
pairs(cars)
#correlation matrix
cor(cr)
#regression model and summary
model.car<-lm(MPG~VOL+SP+HP+WT,data=cr)
summary(model.car)




reg_vol<-lm(MPG~VOL,data=cr)
summary(reg_vol)








