###########################################
#
# Exercise 1
#
###########################################

dati.glm <- read.csv("dati/dati.glm.csv")
head(dati.glm)
str(dati.glm)

#-----------------------------------------
# Protocol for data exploration
# Do it by your own!

# Step 1: Are there outliers in Y and X?
# Is this step relevant in this case? for which variables?
# summary
summary(dati.glm)[,c(3,4,5)]
# boxplot
boxplot(dati.glm[,c("Noperaiepittfall",
                    "Horigano","HGrass",
                    "Origanupatchdiameter")])
# Cleveland plot/dotchart
op <- par(mfrow=c(1,4))
dotchart(dati.glm$Noperaiepittfall, main="Noperaiepittfall")
dotchart(dati.glm$Horigano, main="Horigano")
dotchart(dati.glm$HGrass, main="HGrass")
dotchart(dati.glm$Origanupatchdiameter, main="Origanupatchdiameter")
par(op)
# Identify the outlier
plot(x=dati.glm$Noperaiepittfall, y=dati.glm$id)
identify(x=dati.glm$Noperaiepittfall, y=dati.glm$id)
# Press escape to stop the identify stuff
# Check the outliers and decide what to do
dati.glm[c(168,200),]
# remove row 
# dati.glm1 <- dati.glm[-c(168,200)]

# Step 4: Are there lots of zeros in the data?
table(dati.glm$Egg10)

# Step 5: Is there collinearity among the covariates?
library(ggcorrplot)
corr <- round(cor(dati.glm[,-c(1,2)],method="spearman"), 2)
corr
# Visualize the correlation matrix
# --------------------------------
# method = "square" (default)
ggcorrplot(corr)
# Add correlation coefficients > 0.5
# --------------------------------
p.mat <- cor(dati.glm[,-c(1,2)],method="spearman")
ggcorrplot(corr, type = "lower", sig.level = 0.5, p.mat=p.mat)

## standard code
pairs(dati.glm[c("Noperaiepittfall","Horigano","HGrass","Origanupatchdiameter")])
cor(dati.glm[,-c(1,2)],method="spearman")
cor(dati.glm[,-c(1,2)],method="spearman")>0.5
# exclude BR and one of Noperaiepittfall/MyrmicaYN




# Step 6: What are the relationships between Y
# and X variables?
# Plot every covariate versus Y
# My.xy.plot <- function(AllY, AllX, ID) {
#   library(lattice)
#   library(mgcv)
#   Z <- xyplot(AllY ~ AllX|ID, col = 1,
#               xlab = "Explanatory variables",
#               ylab = "Response variable",
#               strip = function(bg='white', ...)
#                 strip.default(bg='white', ...),
#               scales = list(alternating = T,
#                             x = list(relation = "free"),
#                             y = list(relation = "free")),
#               panel=function(x, y){
#                 panel.grid(h=-1, v= 2)
#                 panel.abline(0,0)
#                 panel.points(x, y, col = 1)
#                 panel.loess(x, y, col = 1, lwd = 2)
#               })
#   print(Z)
# }
# 
# Y    <- dati.glm$Egg10
# MyX  <- names(dati.glm[,-c(1,2)])
# X    <- dati.glm[, MyX]
# 
# # keep it as it is
# AllX <- as.vector(as.matrix(X))
# ID   <- rep(MyX, each = length(Y))
# AllY <- rep(Y, length(MyX))
# My.xy.plot(AllY, AllX, factor(ID))     #call the function created above


# Step 7: Should we consider interactions?
# I'll skip this step!

###########################################
#
# End of Exercise 1
#
###########################################