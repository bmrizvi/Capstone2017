getwd()
setwd('C:/Users/bmriz/Google Drive/Big Data, Data Analytics and Predictive Analysis/CIND 136-Data Analytics Capstone')
getwd()

library(readxl)
dataset <- read_excel("dataset.xlsx")
View(dataset)

#fixing data tYpes
dataset$Year<-as.integer(dataset$Year)
dataset$Jurisdiction<-as.factor(dataset$Jurisdiction)
dataset$Sector<-as.factor(dataset$Sector)
dataset$UseOfFunds<-as.factor(dataset$UseOfFunds)
dataset$CurrentDollars<-as.numeric(dataset$CurrentDollars)
dataset$CurrentDollarsPerCapita<-as.numeric(dataset$CurrentDollarsPerCapita)
#dataset$Constant1997dollars<-as.numeric(dataset$Constant1997dollars) #eliminated due to high NAs
#dataset$Constant1997dollarspercapita<-as.numeric(dataset$Constant1997dollarspercapita) #eliminated due to high NAs
str(dataset)
summary(dataset)

#deleting the unwanted variables to reduce NAs/redundance
dataset$ForecastCategory<-NULL
#dataset$constant1997<-Null
#datset$constant1997PerCapita<-Null

str(dataset)
summary(dataset)

#Missing Values
sum(is.na(dataset))
sapply(dataset, function(x) sum(is.na(x))) # 684 in current$ and percapita each after cleaning

#length(dataset$Constant1997dollars)#17640
#sum(is.na(dataset$Constant1997dollars))#15948
#  15948/17640*100= 90.4% NAs

#length(dataset$Constant1997dollarspercapita)#17640
#sum(is.na(dataset$Constant1997dollarspercapita))#15948
#  15948/17640*100= 90.4% NAs


# change scientific to million in numeric var
dataset$CurrentDollars> options("scipen"=-1000, "digits"=6)# converts to scientific notation
dataset$CurrentDollars
dataset$CurrentDollars> options("scipen"=100, "digits"=6)# converts to standard notation

summary(dataset$CurrentDollars)
summary(dataset$CurrentDollarsPerCapita)

#hist of numeric 
hist(dataset$CurrentDollars, breaks = 5, main="Histogram of Current Dollars", xlab='Current Dollars', ylab=' Frequency', col= 'dark red')
hist(dataset$CurrentDollarsPerCapita, breaks = 25, main = "Histogram of Current Dollars Per Capita", xlab='Current Dollars Per Capita', ylab=' Frequency', col= 'dark red')

#freq graphs for nominal variables
#install.packages("ggplot2")
#library("ggplot2")
plot(dataset, col="dark blue")

#Summary of numeric variables
M<-mean(dataset$CurrentDollars, na.rm=T)
V<-var(dataset$CurrentDollars, na.rm=T)      
SD<-sd(dataset$CurrentDollars, na.rm=T)
summary(dataset$CurrentDollars)
plot(pnorm(dataset$CurrentDollars,mean=M,sd=SD))




a<-mean(dataset$CurrentDollarsPerCapita, na.rm=T)
b<-var(dataset$CurrentDollarsPerCapita, na.rm=T)      
c<-sd(dataset$CurrentDollarsPerCapita, na.rm=T)
summary(dataset$CurrentDollarsPerCapita)
plot(pnorm(dataset$CurrentDollarsPerCapita,mean=a,sd=c))

#boxplot
boxplot(CurrentDollarsPerCapita~Jurisdiction, data = dataset, main="Boxplot for Jurisdiction vs. Current Dollars Per Capita", xlab="Jurisdiction", ylab="Current Dollars Per Capita", col="darkgreen")
boxplot(CurrentDollars~Jurisdiction, data=dataset, main="Boxplot for Jurisdiction vs. Current Dollars", xlab="Jurisdiction", ylab="Current Dollars", col="darkgreen")



#plots for dataset
plot(dataset$Jurisdiction, dataset$Year)

plot(dataset$UseOfFunds, dataset$CurrentDollars, main="Use of Funds vs Current Dollars", xlab= "USe of Funds", ylab= "Current Dollars", col=heat.colors(3))

plot(dataset$UseOfFunds, dataset$CurrentDollarsPerCapita, main="Use of Funds vs Current Dollars", xlab= "USe of Funds", ylab= "Current Dollars Per Capita", col=heat.colors(3))


hist(dataset$CurrentDollars)
hist(dataset$CurrentDollarsPerCapita)
cor.test(dataset$CurrentDollars, dataset$CurrentDollarsPerCapita)


dataset$Year<-as.numeric(dataset$Year)
dataset$Jurisdiction<-as.numeric(dataset$Jurisdiction)
dataset$Sector<-as.numeric(dataset$Sector)
dataset$UseOfFunds<-as.numeric(dataset$UseOfFunds)
dataset$CurrentDollars<-as.numeric(dataset$CurrentDollars)
dataset$CurrentDollarsPerCapita<-as.numeric(dataset$CurrentDollarsPerCapita)

#install.packages("corrplot")
library(corrplot)
correlations<-cor(dataset)
corrplot(correlations)

hist(dataset$CurrentDollars,prob=T,main="Current Dollars")

