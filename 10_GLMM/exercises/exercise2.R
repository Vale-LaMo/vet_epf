###########################################
#
# Exercise 2
#
###########################################

dati.glm <- read.csv("dati/dati.glm.csv")
head(dati.glm)
str(dati.glm)

## Model fitting: base model
# names(dati.glm)
mod.glm <- glm(Egg10 ~ Noperaiepittfall + 
                 Horigano + HGrass + 
                 Origanupatchdiameter + 
                 factor(BV) + factor(BVR) + 
                 factor(BF) + factor(NB),
               data=dati.glm,
               family=binomial)
summary(mod.glm)

  
## Model fitting: model averaging
library(MuMIn)
#  prevent fitting sub-models to different datasets
options(na.action = "na.fail")
# Use of na.action = "na.omit" (R's default) or "na.exclude" in global.model must be avoided, as it results with sub-models fitted to different data sets, if there are missing values. Error is thrown if it is detected.
dd <- dredge(mod.glm)
subset(dd, delta < 2)
# Visualize the model selection table:
op <- par(mar = c(3,5,6,4))
plot(dd, labAsExpr = TRUE)
par(op)
# creates a graphical representation of model weights and variable relative importance. Coefficients can be extracted with coef or coefTable

# Model average models with delta AICc < 2
model.avg(dd, subset = delta < 2)$coefficients[,c(1:4)]
model.avg(dd, subset = delta < 2)$coefficients[,c(5:7)]
model.avg(dd, subset = delta < 2)$coefficients[,c(8:9)]
#or as a 95% confidence set:
# model.avg(dd, subset = cumsum(weight) <= .95) # get averaged coefficients


#'Best' model
summary(get.models(dd, 1)[[1]])
# Diagnostics - best model
op <- par(mfrow=c(2,2))
plot(get.models(dd, 1)[[1]])
par(op)

###########################################
#
# End of Exercise 2
#
###########################################