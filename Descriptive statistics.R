airquality<-datasets::airquality
head(airquality)
tail(airquality)
airquality[,c(1,2)]
summary(airquality$Ozone)
summary(airquality$Wind)
plot(airquality$Ozone)
plot(airquality$Ozone, airquality$Temp)
plot(airquality)
summary(airquality)
#points and lines
plot(airquality$Ozone,xlab='ozone concentration',ylab='No of Instances',main='Ozone levels in NY City',col='blue')


#Horizontal barplot
barplot(airquality$Ozone,main='Ozone concentration in air',xlab='ozone levels',col='green',horiz=FALSE)
hist(airquality$Solar.R)
hist(airquality$Solar.R,main='Solar radiation values in air',xlab='solar rad',col='red')


#single boxplot
boxplot(airquality$Solar.R)

#Multiple boxplot
boxplot(airquality[,1:4],main='Multiple')


par(mfrow=c(3,3),mar=c(2,5,2,1),las=0,bty="n")
plot(airquality$Ozone)
plot(airquality$Ozone,airquality$Wind)
plot(airquality$Ozone, type="c")
plot(airquality$Ozone,type='s')
plot(airquality$Ozone,type="h")
barplot(airquality$Ozone,main='Ozone concentration in air',xlab='ozone levels',col='green',horiz=FALSE)
hist(airquality$Solar.R)
hist(airquality$Solar.R,main='Solar radiation values in air',xlab='solar rad',col='red')
boxplot(airquality$Solar.R)
boxplot(airquality[,1:4],main='Multiple')