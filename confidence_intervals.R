pnorm(70,60,10)
1-0.814
pnorm(60,60,10)
1-0.5
pnorm(680,711,29)
pnorm(740,711,29)-pnorm(697,711,29)
pnorm(740,711,29)
pnorm(697,711,29)
1-0.31
1990+1.645*(2500/(sqrt(140)))
1990-1.645*(2500/(sqrt(140)))
qnorm(0.975)
qnorm(0.95)
qt(0.975,139)
1990+1.98*(2833/(sqrt(140)))
1990-1.98*(2833/(sqrt(140)))
qt(0.975,15)
nycflights13[,c(6,9)]
data<-nycflights13::flights
View(data)
dep_delay<-data$dep_delay
ar_delay<-data$arr_delay


ci(dep_delay)


dep_delay1<-dep_delay[!is.na(dep_delay)]


ci(dep_delay1)

ar_delay1<-ar_delay[!is.na(ar_delay)]


ci(ar_delay1)
