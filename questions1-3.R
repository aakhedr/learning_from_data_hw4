dvc <- 50
N <- seq(from=100, to=10000, by=10)
mH2 <- (2 * N)^dvc
mH <- N^dvc
delta <- .05

Original.VC.Bound <- sqrt(8/ N * log(4 * mH2/ delta))

Rademacher.Penalty.Bound <- sqrt(2 * log(2 * N * mH)/ N) + 
        sqrt(2/ N * log(1/ delta) + 1/ N)

# q is the quantity that has no epsilon coeficient in the quadratic equation
q <- log(6 * mH2/ delta)
Parrondo.and.Van.den.Broek <- (2 + sqrt((-2)^2 - 4 * N * -q))/ (2 * N)

# q is the quantity as in Parrondo.and.Van.den.Broek
## simplify in order not to get Inf using property of natural log ##
#q <- log(4 * N^(2 * dvc)/ delta)
#q <- log(4) + log(N^(2 * dvc)) - log(delta)
q <- log(4) + N * log(2 * dvc) - log(delta)

Devroye <- (2 + sqrt((-2)^2 - 4 * (N - 2) * -N * q))/ (2 * (N - 2))

