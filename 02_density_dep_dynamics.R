## ---- Demographic analysis of an animal population ----
## including density dependence

# Deer matrix
# Jensen, A. L. (1995). Simple density-dependent matrix model for population projection. Ecological Modelling 77, 43–48.

B <- matrix(c(0.426, 1.290, 1.296, 1.120, 1.126, 1.554, 0,
              0.713, -1, 0, 0, 0, 0, 0,
              0, 0.645, -1, 0, 0, 0, 0,
              0, 0, 0.648, -1, 0, 0, 0,
              0, 0, 0, 0.560, -1, 0, 0,
              0, 0, 0, 0, 0.563, -1, 0,
              0, 0, 0, 0, 0, 0.777, -1), 
            nr = 7, byrow = TRUE)

B
# B <- A
stages <- c("Newborns", "Yearlings", "Juveniles", "Adult1", "Adult2", "Adult3", "Adult3")

# Determinate lambda. Spiegate cosa ci indica riguardo alla dinamica della popolazione
eigs.B <- eigen(B)
lambda <- Re(eigs.B[["values"]][1])
lambda

# Partendo da una popolazione iniziale con N = (0 10 10 10 10 10 10) plottate la 
# dinamica per 20 anni
N0 <- matrix(c(0, 4, 0, 0, 0, 0, 0), ncol = 1)
N0
years <- 20
N.projections <- matrix(0, nrow = nrow(B), ncol = years + 1)
N.projections[, 1] <- N0

for (i in 1:years) N.projections[, i + 1] <- N.projections[,+ i] + 
  matrix(((110-N.projections[,+ i])/110),nr=7) %*% (-lambda) * (N.projections[,+ i])
matplot(0:years, rowSums(t(N.projections)), type = "l", ylab="Total no. of individuals",
        xlab="Years")


