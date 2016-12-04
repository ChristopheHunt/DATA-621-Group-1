install.packages("AER")

library(knitr)
library(AER)
library(tidyverse)
library(car)



##--------------------------------------------------------------------------------------------------------
imputedDfTr <- read.csv("https://raw.githubusercontent.com/ChristopheHunt/DATA-621-Group-1/master/Homework%205/imputed_wine-training-data.csv") %>% mutate(STARS = factor(round(STARS, 0), levels = c(1,2,3,4)))

dfTrForPoissonReg <- imputedDfTr

#Unconditional variance is slightly > unconditional mean. So, there may be some over-dispersion
mean(dfTrForPoissonReg$TARGET)
var(dfTrForPoissonReg$TARGET)

model1 <- glm(data = dfTrForPoissonReg, formula = TARGET~STARS+Alcohol+ResidualSugar, family = "poisson") 
summary(model1)
exp(cbind(coef(model1), confint(model1)))
#confidence level for ResidualSugar runs through 1 and and its P(z) value is clearly not significant. 
#Based on both info we can remove ResidualSugar from the model

# Model after removing ResidualSugar
model1 <- glm(data = dfTrForPoissonReg, formula = TARGET~STARS+Alcohol, family = "poisson") 
summary(model1)
exp(cbind(coef(model1), confint(model1)))

#Interpretation of the model

## STARS2 = Compared to STARS1, Wine case sales will be 2.28 times more
## STARS3 = Compared to STARS1, Wine case sales will be 2.90 times more
## STARS4 = Compared to STARS1, Wine case sales will be 3.42 times more
## Alcohol = For one unit increase in Alcohol, Wine sales will be 1.004 times more

#Substituting coefficients we get Y = 1.50 * 2.28(STARS="2") * 2.9(STARS="3") * 3.42(STARS="4") * 1.004Alcohol

dt <- dispersiontest(model1)
dt$estimate
#dt$estimate is very close to 1. So, we can say it is not over or under dispersed

#Another test for overdispersion is
summary(model1)$deviance/summary(model1)$df.residual
#Since this value is not greater than 1.5, we can claim that the data is not over-dispersed.
#Reference http://rcompanion.org/rcompanion/e_07.html


#Influential points in the dataset
influencePlot(model1)

#display predicted values for training dataset
dfWithPredicted <- cbind(dfTrForPoissonReg[,c("TARGET","STARS","Alcohol")],Fitted=model1$fitted.values)
head(dfWithPredicted)

#Showing the frequency table for observed vs predicted
c1 <- as.data.frame(table(dfWithPredicted$TARGET))
c2 <- sapply(sort(unique(dfWithPredicted$TARGET)),function(x) length(which(round(dfWithPredicted$Fitted,0)==x)))
c2 <- as.data.frame(c2)
dfObsVsPred <- cbind(c1,c2)
colnames(dfObsVsPred) <- c("Target","Obs","Predicted")
print(dfObsVsPred)

#var(round(dfWithPredicted$Fitted,0))

#goodness of fit test
round(pchisq(model1$deviance, df=model1$df.residual, lower.tail=FALSE),3)
#goodness of test using pearson Chisquare test shows that our model is good 

#Plots of the model
plot(model1)

#---------------------------------------------------------------------------------------------------------

dfTrForPoissonReg$LabelAppeal <- factor(dfTrForPoissonReg$LabelAppeal)

model2 <- glm(data = dfTrForPoissonReg, formula = TARGET~LabelAppeal+CitricAcid+pH, family = "poisson") 
summary(model2)
exp(cbind(coef(model2), confint(model2)))
#confidence level for CitricAcid and pH run through 1 and and their P(z) values are clearly not significant. 
#Based on both info we can remove CitricAcid and pH from the model

# Model after removing CitricAcid and pH
model2 <- glm(data = dfTrForPoissonReg, formula = TARGET~LabelAppeal, family = "poisson") 
summary(model2)
exp(cbind(coef(model2), confint(model2)))

#Interpretation of the model

## LabelAppeal-1 = Compared to LabelAppeal-2, Wine case sales will be 1.47 times more
## LabelAppeal0 = Compared to LabelAppeal-2, Wine sales will be 1.98 times more
## LabelAppeal1 = Compared to LabelAppeal-2, Wine sales will be 2.48 times more
## LabelAppeal2 = Compared to LabelAppeal-2, Wine sales will be 2.98 times more


#On substituting coefficients we get Y = 1.53 * 1.47(LabelAppeal-1) * 1.98(LabelAppeal0) * 2.48(LabelAppeal1) * 2.97(LabelAppeal2)

dt <- dispersiontest(model2)
dt$estimate
#dt$estimate is very close to 1. So, we can say it is not over or under dispersed

#Another test for overdispersion is
summary(model2)$deviance/summary(model2)$df.residual
#Since this value is greater than 1.5, We assume the data is slightly over-dispersed
#Reference http://rcompanion.org/rcompanion/e_07.html


#Influential points
influencePlot(model2)

#display predicted values for training dataset
dfWithPredicted <- cbind(dfTrForPoissonReg[,c("TARGET","LabelAppeal","Alcohol")],Fitted=model2$fitted.values)
head(dfWithPredicted)

#Showing the frequency table for observed vs predicted
c1 <- as.data.frame(table(dfWithPredicted$TARGET))
c2 <- sapply(sort(unique(dfWithPredicted$TARGET)),function(x) length(which(round(dfWithPredicted$Fitted,0)==x)))
c2 <- as.data.frame(c2)
dfObsVsPred <- cbind(c1,c2)
colnames(dfObsVsPred) <- c("Target","Obs","Predicted")



sort(unique(dfWithPredicted$TARGET))

#goodness of fit test
round(pchisq(model2$deviance, df=model2$df.residual, lower.tail=FALSE),3)
#goodness of test using pearson Chisquare test shows that our model is good and statistically significant

#Plots of the model
plot(model2)

#---------------------------------------------------------------------------------------------------------


HeteroModelValidation <- function(df, model, modelName)
{
  library(boot)
  cv.err <- cv.glm(df,model,K=10)$delta[1]  
  #model$aic
  dfOutput <- as.data.frame(cbind(model=modelName, AIC=round(model$aic,2),CVMean=round(cv.err,2)))
  return(dfOutput)
}

#HeteroModelValidation(df,model,"Poisson1")
