## ---- Demographic analysis of an animal population ----
## including density dependence

# Deer matrix

B <- matrix(c(0.426, 1.290, 1.296, 1.120, 1.126, 1.554, 0,
              0.713, 0, 0, 0, 0, 0, 0,
              0, 0.645, 0, 0, 0, 0, 0,
              0, 0, 0.648, 0, 0, 0, 0,
              0, 0, 0, 0.560, 0, 0, 0,
              0, 0, 0, 0, 0.563, 0, 0,
              0, 0, 0, 0, 0, 0.777, 0), 
            nr = 7, byrow = TRUE)
years <- 20

Identita <- matrix(c(-1, 0, 0, 0, 0, 0, 0,
                     0, -1, 0, 0, 0, 0, 0,
                     0, 0, -1, 0, 0, 0, 0,
                     0, 0, 0, -1, 0, 0, 0,
                     0, 0, 0, 0, -1, 0, 0,
                     0, 0, 0, 0, 0, -1, 0,
                     0, 0, 0, 0, 0, 0, -1), 
                   nr = 7, byrow = TRUE)

i=1
eigs.B <- eigen(B)
w <- Re(eigs.B[["vectors"]][, 1]) # più semplice, questa è la SSD
lambda <- Re(eigs.B[["values"]][1])
wtot <- w/sum(w)

N0 <- matrix(c(0, 4, 0, 0, 0, 0, 0), ncol = 1)
N.projections <- matrix(0, nrow = nrow(B), ncol = years + 1)
N.projections[, 1] <- N0
# for (i in 1:years) N.projections[, i + 1] <- B %*% N.projections[,+ i] +
#   (matrix(((110 - B %*% N.projections[,+ i])/110),nr=7)) * (-lambda)
for (i in 1:years) N.projections[, i + 1] <- B %*% N.projections[,+ i] +
  ((matrix((((110*wtot) - B %*% N.projections[,+ i])/(110*wtot)),nr=7))) * (B %*% (N.projections[,+ i])) * (-lambda) * wtot
matplot(0:years, t(N.projections), type = "l", lty = 1:7,
        ylab = "Stage Abund", xlab = "Year", col = 1:7)
stages <- c("Newborns", "Yearlings", "Juveniles", "Adult1", "Adult2", "Adult3", "Adult3")
legend("topleft", legend = stages,
       lty = 1:6, bty = "n", col = 1:7)

matplot(0:years, (colSums(N.projections)), type = "l", lty = 1,
        ylab = "Stage Abund", xlab = "Year", col = 1)


