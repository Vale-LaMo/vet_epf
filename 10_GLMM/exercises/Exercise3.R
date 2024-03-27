###########################################
#
# Exercise 3
#
###########################################

library(MuMIn)

dati.GLMM <- read.csv("dati/dati.GLMM.csv")
head(dati.GLMM)
str(dati.GLMM)

## Model fitting

## Specimen: 10
mod.glm1 <- glm(Egg10 ~ Noperaiepittfall + 
                 Horigano + HGrass + 
                 Origanupatchdiameter + 
                 factor(BV) + factor(BVR) + 
                 factor(BF) + factor(NB),
               data=dati.GLMM,
               subset = Specimen == 10,
               family=binomial)
summary(mod.glm1)
#  prevent fitting sub-models to different datasets
options(na.action = "na.fail")
# Use of na.action = "na.omit" (R's default) or "na.exclude" in global.model must be avoided, as it results with sub-models fitted to different data sets, if there are missing values. Error is thrown if it is detected.
dd1 <- dredge(mod.glm1)
subset(dd1, delta < 2)
# Visualize the model selection table:
op <- par(mar = c(3,5,6,4))
plot(dd1, labAsExpr = TRUE)
par(op)
# creates a graphical representation of model weights and variable relative importance. Coefficients can be extracted with coef or coefTable
#'Best' model
bm1 <- (get.models(dd1, 1)[[1]])
summary(bm1)


###########################################
#
# Fit the model for Specimen 12
#
###########################################

table(dati.GLMM$Specimen)

###########################################
#
# End of Exercise 3
#
###########################################
