
data<-nycflights13::flights
View(data)
dep_delay<-data$dep_delay
ar_delay<-data$arr_delay


ci(dep_delay)


dep_delay1<-dep_delay[!is.na(dep_delay)]


ci(dep_delay1)

ar_delay1<-ar_delay[!is.na(ar_delay)]


ci(ar_delay1)
