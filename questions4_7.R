Sim.Length = 1000
X <- vector()
g <- vector()
f <- vector()

for(i in 1:Sim.Length) {
        x <- runif(2,-1,1)
        y <- sin(pi*x)
        g <- c(g,as.vector(solve(t(x)%*%x)%*%(t(x)%*%y)))
        X <- c(X,x)
        f <- c(f,y)
}
# question 4
g_bar <- mean(g)

# question 5
bias <- mean((g_bar * X - f)^2)

# question 6
Expected.Value.D <- vector()
for(i in 1:length(g)) {
        Expected.Value.D <- c(Expected.Value.D,mean( (g[i] * X - g_bar * X)^2 ))
}
Expected.Value.X <- mean(Expected.Value.D)
variance <- Expected.Value.X

