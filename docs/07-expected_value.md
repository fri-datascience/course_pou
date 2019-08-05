# Expected value {#ev}

This chapter deals with expected values of random variables.

The students are expected to acquire the following knowledge:

**Theoretical**

- Calculation of the expected value.
- Calculation of variance and covariance.
- Cauchy distribution.

**R**

- Estimation of expected value.
- Estimation of variance and covariance.



## Expected values and variances of common distributions
\BeginKnitrBlock{exercise}\iffalse{-91-69-120-112-101-99-116-101-100-32-118-97-108-117-101-115-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-2"><strong>(\#exr:unnamed-chunk-2)  \iffalse (Expected values) \fi{} </strong></span>Find the formulas for the expected values of the following distributions.

a. Find $E[X]$.

b. Find $Var[X]$.

c. <span style="color:blue">R: Check your answers to a) and b) with a 
simulation.</span>
  
d. <span style="color:blue">R: Plot the density of $X$. Add a horizontal line at the expected value that touches the density curve. Shade the area within a standard deviation of the expected value. </span>
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}
</div>\EndKnitrBlock{solution}

```r
set.seed(1)
nsamps <- 1000
# c
X <- rgamma(nsamps, 10, 1)
mean(X)
```

```
## [1] 9.859184
```

```r
var(X)
```

```
## [1] 10.01599
```

## Sums, functions, conditional expectations

\BeginKnitrBlock{exercise}\iffalse{-91-83-117-109-32-111-102-32-105-110-100-101-112-101-110-100-101-110-116-32-114-97-110-100-111-109-32-118-97-114-105-97-98-108-101-115-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-5"><strong>(\#exr:unnamed-chunk-5)  \iffalse (Sum of independent random variables) \fi{} </strong></span>Let $X_1, X_2,...,X_n$ be IID random variables with expected value $E[X_i] = \mu$ and variance $Var[X_i] = \sigma^2$. Find the expected value and variance of $\bar{X} = \frac{1}{n} \sum_{i=1}^n X_i$. $\bar{X}$ is called a _statistic_ (a function of the values in a sample). It is itself a random variable. <span style="color:blue">R: Take $n = 5, 10, 100, 1000$ samples from the N($2$, $6$) distribution 10000 times. Plot the theoretical density and the densities of $\bar{X}$ statistic for each $n$. Intuitively, are the results in correspondence with your calculations? Check them numerically.</span>
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}Let us start with the expectation of $\bar{X}$.

\begin{align}
  E[\bar{X}] &= E[\frac{1}{n} \sum_{i=1}^n X_i] & \\
             &= \frac{1}{n} E[\sum_{i=1}^n X_i] & \text{ (multiplication with a scalar)} \\
             &= \frac{1}{n} \sum_{i=1}^n E[X_i] & \text{ (linearity)} \\
             &= \frac{1}{n} n \mu & \\
             &= \mu.
\end{align}
  
Now the variance
\begin{align}
  Var[\bar{X}] &= Var[\frac{1}{n} \sum_{i=1}^n X_i] & \\
             &= \frac{1}{n^2} Var[\sum_{i=1}^n X_i] & \text{ (multiplication with a scalar)} \\
             &= \frac{1}{n} \sum_{i=1}^n Var[X_i] & \text{ (independence of samples)} \\
             &= \frac{1}{n^2} n \sigma^2 & \\
             &= \frac{1}{n} \sigma^2.
\end{align}
</div>\EndKnitrBlock{solution}

```r
set.seed(1)
nsamps <- 10000
mu     <- 2
sigma  <- sqrt(6)
N      <- c(5, 10, 100, 500)
X      <- matrix(data = NA, nrow = nsamps, ncol = length(N))
ind    <- 1
for (n in N) {
  for (i in 1:nsamps) {
    X[i,ind] <- mean(rnorm(n, mu, sigma))
  }
  ind <- ind + 1
}
colnames(X) <- N
X           <- melt(as.data.frame(X))

ggplot(data = X, aes(x = value, colour = variable)) +
  geom_density() +
  stat_function(data  = data.frame(x = seq(-2, 6, by = 0.01)), aes(x = x), 
                fun   = dnorm, 
                args  = list(mean = mu, sd = sigma), 
                color = "black")
```

<img src="07-expected_value_files/figure-html/unnamed-chunk-7-1.png" width="672" />
