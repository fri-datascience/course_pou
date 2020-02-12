thetas <- seq(0, 1, by = 0.01)
n <- 100
beta_t <- 1 - pbinom(60, size = n, prob = thetas) + pbinom(39, size = n, prob = thetas)
plot(beta_t)
