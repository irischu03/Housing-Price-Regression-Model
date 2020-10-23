setwd("D:/Baruch/STA 9700/Project")

# Data
real_estate=read.csv("real_estate.csv")

# Scatterplot of living area against price
marks <- c(0,200000,400000,600000,800000,1000000)
format(Selling.Price,scientific=FALSE)
plot(Selling.Price~Living.Area,data=real_estate,xlab="Living area",ylab="Price",yaxt="n")
axis(2,at=marks,labels=format(marks,scientific=FALSE))
# Adding fitted line
m<-lm(Selling.Price~Living.Area,data=real_estate)
abline(m,col="red")

# Estimation of regression function
summary(m)
m$coefficients

# Confidence interval for slope
confint(m,level=0.90)

# t critical value
qt(0.95,261)

# p-value of t test
(1-pt(18.870,261))*2

# Fitted values
m$fitted.values
predict(m,data.frame(Living.Area=1850))

# PI for new observation y at an x value
predict(m,data.frame(Living.Area=1850),level=0.90,interval="prediction")

# Superimposing point-wise CI and PI on scatterplot
marks <- c(0,200000,400000,600000,800000,1000000)
format(Selling.Price,scientific=FALSE)
plot(Selling.Price~Living.Area,data=real_estate,xlab="Living area",ylab="Price",yaxt="n")
axis(2,at=marks,labels=format(marks,scientific=FALSE))
abline(m,col="red")

summary(real_estate$Living.Area)
newx=seq(500,4000,by=50)

pi90=predict(m,newdata=data.frame(Living.Area=newx),level=0.90,interval="prediction")
lines(newx,pi90[,2],lty=2); lines(newx,pi90[,3],lty=2)

# Semistudentized residuals
residuals(m)
m$residuals/summary(m)$sigma 

# Plot of residuals against fitted values
marksy <- c(-600000,-400000,-200000,0,200000,400000,600000)
marksx <- c(0,200000,400000,600000,800000,1000000)
format(residuals(m),scientific=FALSE)
format(fitted.values(m), scientific=FALSE)
plot(residuals(m)~fitted.values(m),xlab="Fitted.value",ylab="Residual",xaxt="n",yaxt="n")
axis(2,at=marksy,labels=format(marksy,scientific=FALSE))
axis(1,at=marksx,labels=format(marksx,scientific=FALSE))

# Sequence plot of residuals
plot(m$residuals,type="l",xlab="Production run",ylab="Residual")
abline(h=0)

# Normal probability plot of residuals
qqnorm(m$residuals); qqline(m$residuals, col = "dodgerblue")


# Transformations on Y- log
realestate_fit_log = lm(log10(Selling.Price) ~ Living.Area, data = real_estate)
plot(log10(Selling.Price) ~ Living.Area, data = real_estate, col = "grey", pch = 20, cex = 1.5,
     main = "After Transformation- log")
abline(realestate_fit_log, col = "red", lwd = 2)

par(mfrow = c(1, 2))

plot(fitted(realestate_fit_log), resid(realestate_fit_log), col = "grey", pch = 20,
     xlab = "Fitted", ylab = "Residuals", main = "Fitted versus Residuals")
abline(h = 0, col = "darkorange", lwd = 2)

qqnorm(resid(realestate_fit_log), main = "Normal Q-Q Plot", col = "darkgrey")
qqline(resid(realestate_fit_log), col = "dodgerblue", lwd = 2)


# Transformations on Y- sqrt
realestate_fit_sqrt = lm(sqrt(Selling.Price) ~ Living.Area, data = real_estate)
plot(sqrt(Selling.Price) ~ Living.Area, data = real_estate, col = "grey", pch = 20, cex = 1.5,
     main = "After Transformation- square root")
abline(realestate_fit_sqrt, col = "red", lwd = 2)

par(mfrow = c(1, 2))

plot(fitted(realestate_fit_sqrt), resid(realestate_fit_sqrt), col = "grey", pch = 20,
     xlab = "Fitted", ylab = "Residuals", main = "Fitted versus Residuals")
abline(h = 0, col = "darkorange", lwd = 2)

qqnorm(resid(realestate_fit_sqrt), main = "Normal Q-Q Plot", col = "darkgrey")
qqline(resid(realestate_fit_sqrt), col = "dodgerblue", lwd = 2)

# Transformations on X- log
realestate_fit_logX = lm(Selling.Price ~ log10(Living.Area), data = real_estate)
plot(Selling.Price ~ log10(Living.Area), data = real_estate, col = "grey", pch = 20, cex = 1.5,
     main = "After Transformation- log X")
abline(realestate_fit_logX, col = "red", lwd = 2)

par(mfrow = c(1, 2))

plot(fitted(realestate_fit_logX), resid(realestate_fit_logX), col = "grey", pch = 20,
     xlab = "Fitted", ylab = "Residuals", main = "Fitted versus Residuals")
abline(h = 0, col = "darkorange", lwd = 2)

qqnorm(resid(realestate_fit_logX), main = "Normal Q-Q Plot", col = "darkgrey")
qqline(resid(realestate_fit_logX), col = "dodgerblue", lwd = 2)

# Transformations on X- sqrt
realestate_fit_sqrtX = lm(Selling.Price ~ sqrt(Living.Area), data = real_estate)
plot(Selling.Price ~ sqrt(Living.Area), data = real_estate, col = "grey", pch = 20, cex = 1.5,
     main = "After Transformation- square root X")
abline(realestate_fit_sqrtX, col = "red", lwd = 2)

par(mfrow = c(1, 2))

plot(fitted(realestate_fit_sqrtX), resid(realestate_fit_sqrtX), col = "grey", pch = 20,
     xlab = "Fitted", ylab = "Residuals", main = "Fitted versus Residuals")
abline(h = 0, col = "darkorange", lwd = 2)

qqnorm(resid(realestate_fit_sqrtX), main = "Normal Q-Q Plot", col = "darkgrey")
qqline(resid(realestate_fit_sqrtX), col = "dodgerblue", lwd = 2)

# Data
real_estate=read.csv("real_estate- model1.csv")

# Scatterplot & correlation matrix
pairs(real_estate)
cor(real_estate)

# LS
m<-lm(Selling.Price~Living.Area+Bedrooms+Fireplaces,data=real_estate) 
summary(m)
#overall regression test
anova(m)
qf(0.98,df1=3,df2=259)
#overall regression test v2
anova(lm(Selling.Price~1,data=real_estate),lm(Selling.Price~Living.Area+Bedrooms+Fireplaces,data=real_estate))
# SSR(X3|X1,X2)
m1<-lm(Selling.Price~Living.Area+Bedrooms,real_estate) 
m2<-update(m1,~.+Fireplaces) 
anova(m1,m2)
library(rsq)
rsq.partial(m2,m1)

# Type III SS
library(car)
Anova(m2,type=3)

#Model 2
real_estate2=read.csv("real_estate- model2.csv")
marks <- c(0,200000,400000,600000,800000,1000000)
format(real_estate2$Selling.Price,scientific=FALSE)
scatterplot(Selling.Price~Living.Area|Central.Air,data=real_estate2,smooth=FALSE,xlab="Living Area",ylab="Selling Price",yaxt="n")
axis(2,at=marks,labels=format(marks,scientific=FALSE))

library(alr4)
X1X2=real_estate2$Living.Area*real_estate2$Central.Air
real_estate2combined=cbind(real_estate2,X1X2)
m.ins=lm(Selling.Price~Living.Area+Central.Air+X1X2,real_estate2combined); summary(m.ins)
anova(lm(Selling.Price~Living.Area,real_estate2combined),m.ins)

#Model 3
real_estate3=read.csv("real_estate- model3.csv")
m1<-lm(Price~Lot.Size+Waterfront+Age+Land.Value+New.Construct+Living.Area+Central.Air+Bedrooms+Fireplaces+Bathrooms+Rooms,real_estate3)
m.backward<-step(m1,direction="backward") 
summary(m.backward)