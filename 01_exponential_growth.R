## ---- Demographic analysis of an animal population ----

# Deer matrix

## ---- parametri da impostare

# la matrice di transizione è:
A <- matrix(c(0.426, 1.290, 1.296, 1.120, 1.126, 1.554, 0,
              0.713, 0, 0, 0, 0, 0, 0,
              0, 0.645, 0, 0, 0, 0, 0,
              0, 0, 0.648, 0, 0, 0, 0,
              0, 0, 0, 0.560, 0, 0, 0,
              0, 0, 0, 0, 0.563, 0, 0,
              0, 0, 0, 0, 0, 0.777, 0), 
            nr = 7, byrow = TRUE)
A

# Partendo da una popolazione iniziale con
N0 <- matrix(c(0, 4, 0, 0, 0, 0, 0), ncol = 1)
N0
years <- 6

stages <- c("Newborns", "Yearlings", "Juveniles", "Adult1", "Adult2", "Adult3", "Adult4")


## ---- domande ----

# Disegnate il grafo del ciclo vitale della popolazione, includendo gli elementi 
# associati con ciascuna transizione


N.projections <- matrix(0, nrow = nrow(A), ncol = years + 1)
N.projections[, 1] <- N0
for (i in 1:years) N.projections[, i + 1] <- A %*% N.projections[,+ i]
N.projections
# plottate la 
# dinamica di tutti gli stadi per 6 anni
# matplot(0:years, rowSums(t(N.projections)), type = "l", ylab="Total no. of individuals",
#         xlab="Years")
matplot(0:years, colSums(N.projections), type = "l", ylab="Total no. of individuals",
        xlab="Years")
# Determinate la distribuzione stabile di età
eigs.A <- eigen(A)
# dom.pos <- which.max(eigs.A[["values"]])
# w <- Re(eigs.A[["vectors"]][, dom.pos]) # nb Re returns the real part of a number
w <- Re(eigs.A[["vectors"]][, 1]) # più semplice, questa è la SSD
ssd <- w/sum(w)
round(ssd, 3) # espressa in termini relativi
## plottiamo i risultati
matplot(0:years, t(N.projections), type = "l", lty = 1:7,
        ylab = "Stage Abund", xlab = "Year", col = 1:7)
legend("topleft", legend = stages,
       lty = 1:6, bty = "n", col = 1:7) 

# Determinate lambda. Spiegate cosa ci indica riguardo alla dinamica della popolazione
lambda <- Re(eigs.A[["values"]][1])
lambda

# Determinate le elasticità. Quali transizioni influiscono di più sul tasso di crescita?
M <- eigen(t(A)) # autoanalisi sulla trasposta, per
(v <- Re(M$vectors[,which.max(Re(M$values))])) # identificare i valori riproduttivi
(vw.s <- v %*% t(w)) # numeratore: moltiplico valori riproduttivi per la trasposta della SSD
(dotproduct <- v %*% w) # denominatore: valori riproduttivi per SSD
(S <- vw.s/as.numeric(dotproduct)) # divido e ottengo le sensitività
(elas <- (A/lambda) * S)






