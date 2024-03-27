###########################################
#
# Exercise 4
#
###########################################

library(lme4)
library(MASS)
library(nlme)

dati.GLMM <- read.csv("dati/dati.GLMM.csv")
head(dati.GLMM)
str(dati.GLMM)


## Specimen as a fixed effect
mod.glm.fixed <- glm(Egg10 ~ Noperaiepittfall + 
                  Horigano + HGrass + 
                  Origanupatchdiameter + 
                  factor(BV) + factor(BVR) + 
                  factor(BF) + factor(NB) +
                  factor(Specimen),
                data=dati.GLMM,
                family=binomial)
summary(mod.glm.fixed)




# ***********************************************************************************
# MIXED MODEL

# have a look at the glmer output
glmer.mod <- glmer(Egg10~Noperaiepittfall+Horigano+HGrass+Origanupatchdiameter+BV+BVR+BF+NB+
                   (1|Specimen),
                  family=binomial,
                  data=dati.GLMM)
summary(glmer.mod)


## have a look at the glmmPQL output
pql.mod <- glmmPQL(Egg10~Noperaiepittfall+Horigano+HGrass+Origanupatchdiameter+BV+BVR+BF+NB,
                   random = ~ 1|Specimen,
                   family=binomial,
                   data=dati.GLMM)
summary(pql.mod)




# ***********************************************************************************
# MIXED MODEL selection protocol

# base model
rs1.lme <- glmer(Egg10~Noperaiepittfall+Horigano+HGrass+Origanupatchdiameter+BV+BVR+BF+NB+
                   (1+Noperaiepittfall|Specimen),
                 family=binomial,
                 data=dati.GLMM)
summary(rs1.lme)
## Select the best model structure
# bm.mixed
bm.mixed <- glmer(Egg10~Noperaiepittfall+BVR+NB+
                   (1+Noperaiepittfall|Specimen),
                 family=binomial,
                 data=dati.GLMM)

# if your model has a random slope, use ranef to extract conditional coefficients
ranef(rs1.lme)
ranef(bm.mixed)

## A REPRESENTATION OF MODEL RESULTS
# g <- -0.38711 + 0.90922 * dati.GLMM$BVR + (-1.22435) * dati.GLMM$NB + 0.06568 * dati.GLMM$Noperaiepittfall
g <- -0.38711 + 0.90922 * 1 + (-1.22435) * 1 + 0.06568 * dati.GLMM$Noperaiepittfall
p.averageAnimal1 <- exp(g)/(1+exp(g))
I1 <- order(dati.GLMM$Noperaiepittfall)
plot(dati.GLMM$Noperaiepittfall, dati.GLMM$Egg10,
     ylab = "Oviposition probability",
     xlab = "Number of ants")
lines(dati.GLMM$Noperaiepittfall[I1],p.averageAnimal1[I1],lwd=3)

p.Upp <- exp(g+1.96*0.0385)/(1+exp(g+1.96*0.0385))
p.Low <- exp(g-1.96*0.0385)/(1+exp(g-1.96*0.0385))
lines(dati.GLMM$Noperaiepittfall[I1],p.Upp[I1])
lines(dati.GLMM$Noperaiepittfall[I1],p.Low[I1])


## Validation
## Plot the residuals vs. fitted values
names(summary(bm.mixed))
# plot((summary(bm.mixed))$residuals ~ predict(bm.mixed))
plot(bm.mixed)
boxplot((summary(bm.mixed))$residuals ~ dati.GLMM$BVR, main="BVR")
boxplot((summary(bm.mixed))$residuals ~ dati.GLMM$NB, main="NB")
plot((summary(bm.mixed))$residuals ~ dati.GLMM$Noperaiepittfall, main="Number of ants")


###########################################
#
# End of Exercise 4
#
###########################################
