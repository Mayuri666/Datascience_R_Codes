install.packages("survival")
library(survival)

survival_unemployment1 <- read.csv("C:/Users/Mayuri/Desktop/R/survival_unemployment1.csv")
attach(survival_unemployment1)

# Define variables 
time <- spell
event <- event
X <- cbind(logwage, ui, age)
group <- ui
# Kaplan-Meier non-parametric analysis
kmsurvival <- survfit(Surv(time,event) ~ 1)#~1 means just means one group
summary(kmsurvival)
plot(kmsurvival, xlab="Time", ylab="Survival Probability")
# Kaplan-Meier non-parametric analysis by group
kmsurvival1 <- survfit(Surv(time, event) ~ group)
summary(kmsurvival1)
plot(kmsurvival1, xlab="Time", ylab="Survival Probability")
