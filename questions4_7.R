Sim.Length = 1000
X <- vector()
g <- vector()
f <- vector()

for(i in 1:Sim.Length) {
        x <- runif(2, -1, 1)
        y <- sin(pi * x)
        g <- c(g,as.vector(solve(t(x)%*%x)%*%(t(x)%*%y)))
        X <- c(X, x)
        f <- c(f, y)
}
# question 4
g_bar <- mean(g)

# question 5
bias <- mean((g_bar * X - f)^2)

# question 6
Expected.Value.D <- vector()
for(i in 1:length(g)) {
        Expected.Value.D <- c(Expected.Value.D, mean((g[i] * X - g_bar * X)^2))
}
Expected.Value.X <- mean(Expected.Value.D)
variance <- Expected.Value.X
Eout_b <- bias + variance

### question 7 ###
# option a
Sim.Length = 1000
X <- vector()
g <- vector()
f <- vector()
for(i in 1:Sim.Length) {
        x <- runif(2, -1, 1)
        y <- sin(pi*x)
        g <- c(g,(x[1]+x[2])/2)
        X <- c(X, x)
        f <- c(f, y)
}
g_bar <- mean(g)
bias <- mean((g_bar * X - f)^2)
Expected.Value.D <- vector()
for (i in 1:length(g)) {
        Expected.Value.D <- c(Expected.Value.D,mean((g[i]*X - g_bar*X)^2))
}
Expected.Value.X <- mean(Expected.Value.D)
variance = Expected.Value.X
Eout_a = bias + variance

# option C
Sim.Length = 1000
X <- vector()
g <- vector()
f <- vector()
Xt <- vector()
slope <- vector()
constant <- vector()
for(i in 1:Sim.Length){
        x <- runif(2, -1, 1)
        xt <- cbind(c(1, 1), x)
        y <- sin(pi * x)
        reg <- as.vector(solve(t(xt)%*%xt)%*%(t(xt)%*%y))
        constant <- c(constant, reg[1])
        slope <- c(slope, reg[2])
        X <- c(X, x)
        Xt<-rbind(Xt, xt)
        f <- c(f, y)
}
g_bar <- c(mean(constant),mean(slope))
bias <- mean((Xt%*%g_bar - f)^2)
Expected.Value.D <- vector()
for(i in 1:length(slope)){
        Expected.Value.D <- c(Expected.Value.D,mean((Xt%*%c(constant[i],slope[i]) - Xt%*%g_bar)^2 ))
}
Expected.Value.X <- mean(Expected.Value.D)
variance = Expected.Value.X
Eout_c = bias + variance


