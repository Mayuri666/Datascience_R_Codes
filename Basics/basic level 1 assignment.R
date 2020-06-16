Q7 <- read.csv("C:/Users/Mayuri/Downloads/Q7.csv")

summary(Q7)#gives mean,median, min,max
summary(Q7$Points)#gives mean,median, min,max of column points
max(Q7$Score)-min(Q7$Score)
max(Q7$Weigh)-min(Q7$Weigh)
max(Q7$Points)-min(Q7$Points)#range

sd(Q7$Score)#std dev
sd(Q7$Points)
sd(Q7$Weigh)
var(Q7$Points)#variance
var(Q7$Score)
var(Q7$Weigh)
sort1<-sort(Q7$Points)#to find mode
table(sort1)
x<-sort(Q7$Score)
table(x)
y<-sort(Q7$Weigh)
table(y)


Q9_a <- read.csv("C:/Users/Mayuri/Downloads/Q9_a.csv")
install.packages("moments")
library(moments)
skewness(Q9_a$speed)
kurtosis(Q9_a$speed)

skewness(Q9_a$dist)
kurtosis(Q9_a$dist)


Cars <- read.csv("C:/Users/Mayuri/Downloads/Cars.csv")

MPG <- Cars$MPG
mean(MPG)
sd(MPG)
pnorm(38,34.4,9.13)#(MPG>38)
1-0.65
pnorm(40,34.4,9.13)#(MPG<40)
pnorm(50,34.4,9.13)-pnorm(20,34.4,9.13)#c.	(20<MPG<50)



#for z score 90%,100-90=10,divide 10 by2=5,
#add this 5 to 90%=95,ie0.95
qnorm(0.95)

#for z score 94%,100-94=6,divide 10 by2=3,
#add this 3 to 94%=97,ie0.97
qnorm(0.97)


#for z score 60%,100-60=40,divide 40 by2=20,
#add this 20 to 60%=80,ie0.80
qnorm(0.80)

#t scores
#for T-score 95%,100-95=5,divide 5 by2=2.5,
#add this 2.5 to 95%=97.5,ie0.975
qt(0.975,24)#95% CI
qt(0.98,24)#96% CI
qt(0.995,24)#99% CI


#t score = (x bar - µ)/(s/sqrt(n))
#=(260 - 270)/(90/sqrt(18))
#=-10/21.23
#=-0.47

sqrt(18)
9/4.24
1/2.12
pt(-0.471,17)


qt(0.95,1999)
200+(1.64)*30/(sqrt(2000))
200-(1.64)*30/(sqrt(2000))

x<-c(34,36,36,38,38,39,39,40,40,41,41,41,41,42,42,45,49,56)
summary(x)
x1<-sort(x)
table(x1)
names(table(x))[table(x)==max(table(x))]#mode function
var(x)
sd(x)
max(x)
min(x)
max(x)-min(x)#range
skewness(x)

qt(0.94,1999)
200+(1.55)*30/(sqrt(2000))
200-(1.55)*30/(sqrt(2000))

qt(0.96,1999)
200+(1.75)*30/(sqrt(2000))
200-(1.75)*30/(sqrt(2000))

qt(0.98,1999)
200+(2.05)*30/(sqrt(2000))
200-(2.05)*30/(sqrt(2000))

sqrt(18)
90/4.24
qt(0.95,17)
10/21.22
pt(0.471,17)
1-0.67


wc.at <- read.csv("C:/Users/Mayuri/Downloads/wc-at.csv")
qqplot(wc.at)

x<- read.csv("C:/Users/Mayuri/Downloads/Q9_b (1).csv")
co(x)
library(moments)
skewness(x$SP)
skewness(x$WT)
kurtosis(x$SP)
kurtosis(x$WT)