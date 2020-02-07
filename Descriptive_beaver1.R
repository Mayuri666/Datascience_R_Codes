beaver1<-datasets::beaver1
head(beaver1)
tail(beaver1)
beaver1[,c(2,3)]
summary(beaver1$time)
summary(beaver1$temp)
summary(beaver1)
plot(beaver1$temp)
plot(beaver1$time,beaver1$temp)
plot(beaver1)


#points and lines
plot(beaver1$time,xlab='Temperature changes',ylab='Frequency',main='Temperature dynamics in beaver1',col='red')


#Horizontal barplot
barplot(beaver1$temp,main='Temperature changes over time',xlab='Temperature',col='red',horiz=FALSE)
hist(beaver1$time)
hist(beaver1$time,main='Time dynamics',xlab='Time',col='blue')


#single boxplot
boxplot(beaver1$time)


#Multiple boxplot
boxplot(beaver1[,1:4],main='Multiple')


par(mfrow=c(3,3),mar=c(2,5,2,1),las=0,bty="n")
plot(beaver1$temp)
plot(beaver1$time,beaver1$temp)
plot(beaver1$temp, type="c")
plot(beaver1$temp,type='s')
plot(beaver1$temp,type="h")
barplot(beaver1$temp,main='Temperature changes over time',xlab='Temperature',col='red',horiz=FALSE)
hist(beaver1$time)
hist(beaver1$time,main='Time dynamics',xlab='Time',col='blue')
boxplot(beaver1$time)
boxplot(beaver1[,1:4],main='Multiple')