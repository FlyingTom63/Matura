#Load Libraries
library("Hmisc")
library("PerformanceAnalytics")
library("dplyr")
library("ggpubr")

projPath <- rprojroot::find_rstudio_root_file()
DataPath <- paste(projPath,"/data/output/students_withAllValuesOhneAussreisser.csv", sep="")

#load data
td <- read.csv(DataPath, header=TRUE)
td$M <- td$M - td$X3
#divide data in noten and gemeindedaten
noten <- td[,c(3,1,2,11)]
gemeinde <- td[,c(3:10)]
cor.test(noten$M,noten$Mathematik, method = "kendall")
cor.test(noten$M,noten$X3, method = "kendall")
cor.test(noten$M,noten$Landessprache, method = "kendall")

cor.test(gemeinde$M,gemeinde$ARBEITSMARKT, method = "kendall")
cor.test(gemeinde$M,gemeinde$BEVÖLKERUNG, method = "kendall")
cor.test(gemeinde$M,gemeinde$ERREICHBARKEIT, method = "kendall") 
cor.test(gemeinde$M,gemeinde$RANG, method = "kendall") 
cor.test(gemeinde$M,gemeinde$SICHERHEIT, method = "kendall") 
cor.test(gemeinde$M,gemeinde$STEUERBELASTUNG, method = "kendall") 
cor.test(gemeinde$M,gemeinde$VERSORGUNG, method = "kendall") 


chart.Correlation(noten, histogram=TRUE, pch=19,method = "kendall")
chart.Correlation(gemeinde, histogram=TRUE, pch=19, "kendall")

a1 <- ggdensity(td$M, main = "Density plot von Maturanote", xlab = "Note")
a2 <- ggdensity(td$Mathematik, main = "Density plot von Mathematik", xlab = "Note")
a3 <- ggdensity(td$X3, main = "Density plot von Note 3.Jahres", xlab = "Note")
a4 <- ggdensity(td$Landessprache, main = "Density plot von Landessprache", xlab = "Note")
ggarrange(a1, a2, a3, a4, ncol = 2, nrow = 2)

a1 <- ggdensity(noten$M, main = "Density plot von Maturanote", xlab = "Note")
b1 <- ggqqplot(noten$M, title = "Maturanote")
a2 <- ggdensity(noten$Mathematik, main = "Density plot von Mathematiknote", xlab = "Note")
b2 <- ggqqplot(noten$Mathematik, title = "Mathematik")
a3 <- ggdensity(noten$X3, main = "Density plot von Note 3 Jahres", xlab = "Note")
b3 <- ggqqplot(noten$X3, title = "Note 3. Jahres")
a4 <- ggdensity(noten$Landessprache, main = "Density plot von Landessprache", xlab = "Note")
b4 <- ggqqplot(noten$Landessprache, title = "Landessprache")

ggarrange(a1, b1, a2, b2, a3, b3, a4, b4, ncol = 2, nrow = 4)

a1 <- ggdensity(gemeinde$ARBEITSMARKT, title = "Arbeitsmarkt")
a2 <- ggdensity(gemeinde$BEVÖLKERUNG, title = "Bevölkerung")
a3 <- ggdensity(gemeinde$ERREICHBARKEIT, title = "Erreichbarkeit")
a4 <- ggdensity(gemeinde$RANG, title = "Rang")
a5 <- ggdensity(gemeinde$SICHERHEIT, title = "Sicherheit")
a6 <- ggdensity(gemeinde$STEUERBELASTUNG, title = "Steuerbelastung")
a7 <- ggdensity(gemeinde$VERSORGUNG, title = "Versorgung")
b1 <- ggqqplot(gemeinde$ARBEITSMARKT, title = "Arbeitsmarkt")
b2 <- ggqqplot(gemeinde$BEVÖLKERUNG, title = "Bevölkerung")
b3 <- ggqqplot(gemeinde$ERREICHBARKEIT, title = "Erreichbarkeit")
b4 <- ggqqplot(gemeinde$RANG, title = "Rang")
b5 <- ggqqplot(gemeinde$SICHERHEIT, title = "Sicherheit")
b6 <- ggqqplot(gemeinde$STEUERBELASTUNG, title = "Steuerbelastung")
b7 <- ggqqplot(gemeinde$VERSORGUNG, title = "Versorgung")

ggarrange(a1, b1, a2, b2, a3, b3, a4, b4, ncol = 2, nrow = 4)
ggarrange(a5, b5, a6, b6, a7, b7, ncol = 2, nrow = 3)

library(fitdistrplus)
qqplot(rbinom(n=100, size=100, p=0.05), noten$Mathematik)

a1
y <- rbinom(gemeinde$ARBEITSMARKT, size = 3795, 0.01)
ggdensity(y, title = "Arbeitsmarkt")

a <- ggqqplot(noten2$M, title = "Maturanote")
b <- ggqqplot(noten2$X3, title = "Note 3. Jahres")
c <- ggqqplot(noten2$Mathematik, title = "Mathematik")
d <- ggqqplot(noten2$Landessprache, title = "Landessprache")
ggarrange(b5, b6, b7, ncol = 2, nrow = 2)

ggqqplot(noten$Landessprache)
ggqqplot(noten$Mathematik)
ggqqplot(noten$X3-mean(noten$X3))

noten$Landessprache <- as.numeric(as.character(noten$Landessprache))

shapiro.test(gemeinde$STEUERBELASTUNG)
shapiro.test(noten$Landessprache)
shapiro.test(noten$Mathematik)
shapiro.test(noten$X3-mean(noten$X3))

summary(noten)
x <- rnorm(1000, mean = 305, sd = 150)
shapiro.test(x)
ggdensity(x)
