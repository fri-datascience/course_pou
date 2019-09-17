# Concentration inequalities {#ci}

This chapter deals with concentration inequalities.

The students are expected to acquire the following knowledge:

**Theoretical**

- ?


**R**

- ?



## Comparison
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-2"><strong>(\#exr:unnamed-chunk-2) </strong></span>Let $X \sim \text{Geometric(0.7)}$. Calculate the  <span style="color:blue">R: Let $X$ be a sum of three Poisson distributions with $\lambda_i \in {2, 5.2, 10}$. Take 1000 samples and plot the three distributions and the sum. Then take 1000 samples from the theoretical distribution of $X$ and compare them to the sum.</span>
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}Let
</div>\EndKnitrBlock{solution}

```r
bound_chernoff <- function (t, p, a) {
  return ((p / (1 - exp(t) + p * exp(t))) / exp(a * t))
}

set.seed(1)
p <- 0.7
a <- seq(1, 15, by = 1)
ci_markov   <- (1 - p) / p / a
t <- optimize(bound_chernoff, interval = c(0, log(1 / (1 - p))), p = p, a = 2)$minimum
ci_chernoff <- (p / (1 - exp(t) + p * exp(t))) / exp(a * t)
actual      <- 1 - pgeom(a, 0.7)
plot_df     <- rbind(
  data.frame(x = a, y = ci_markov, type = "Markov"),
  data.frame(x = a, y = ci_chernoff, type = "Chernoff"),
  data.frame(x = a, y = actual, type = "Actual")
)
ggplot(plot_df, aes(x = x, y = y, color = type)) +
  geom_line()
```

<img src="10-concentration_inequalities_files/figure-html/unnamed-chunk-4-1.png" width="672" />


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-5"><strong>(\#exr:unnamed-chunk-5) </strong></span>Let $X \sim \text{Geometric(0.7)}$. Calculate the  <span style="color:blue">R: Let $X$ be a sum of three Poisson distributions with $\lambda_i \in {2, 5.2, 10}$. Take 1000 samples and plot the three distributions and the sum. Then take 1000 samples from the theoretical distribution of $X$ and compare them to the sum.</span>
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}Let
</div>\EndKnitrBlock{solution}

```r
set.seed(1)
alpha1  <- 1
beta1   <- 1
alpha2  <- 4
beta2   <- 2
X1      <- rbeta(1000, alpha1, beta1)
X2      <- rbeta(1000, alpha2, beta2)
Sn_mean <- alpha1 / (alpha1 + beta1) + alpha2 / (alpha2 + beta2)
Sn_var  <- alpha1 * beta1 / ((alpha1 + beta1)^2 * (alpha1 + beta1 + 1)) +
  alpha2 * beta2 / ((alpha2 + beta2)^2 * (alpha2 + beta2 + 1))
mean(X1 + X2)
```

```
## [1] 1.172595
```

```r
Sn_mean
```

```
## [1] 1.166667
```

```r
var(X1 + X2)
```

```
## [1] 0.1173397
```

```r
Sn_var
```

```
## [1] 0.1150794
```

```r
a <- seq(0.1, 2, by = 0.1)
b <- a / sqrt(Sn_var)

ci_chebyshev <- 1 / b^2
# ci_chebyshev <- 1 / a^2
ci_hoeffding <- 2 * exp(- 2 * a^2 / (2))
empirical    <- NULL
for (i in 1:length(a)) {
  empirical[i] <- sum(abs((X1 + X2) - Sn_mean) >= a[i])/ length(X1)
}

plot_df     <- rbind(
  data.frame(x = a, y = ci_chebyshev, type = "Chebyshev"),
  data.frame(x = a, y = ci_hoeffding, type = "Hoeffding"),
  data.frame(x = a, y = empirical, type = "Empirical")
)

ggplot(plot_df, aes(x = x, y = y, color = type)) +
  geom_line()
```

<img src="10-concentration_inequalities_files/figure-html/unnamed-chunk-7-1.png" width="672" />

## Practical
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-8"><strong>(\#exr:unnamed-chunk-8) </strong></span>FROM BINDER. Let $X_i$, $i = 1,...n$, be a random sample of size $n$ of a random variable $X$. Let $X$ have mean $\mu$ and variance $\sigma^2$. Find the size of the sample $n$ required so that the probability that the difference between sample mean and true mean is smaller than $\frac{\sigma}{10}$ is at least 0.95. Hint: Derive a version of the Chebyshev inequality for $P(|X - \mu| \geq a)$ using Markov inequality.
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}Let $\bar{X} = \sum_{i=1}^n X_i$. Then $E[\bar{X}] = \mu$ and $Var[\bar{X}] = \frac{\sigma^2}{n}$. Let us first derive another representation of Chebyshev inequality.
\begin{align}
  P(|X - \mu| \geq a) = P(|X - \mu|^2 \geq a^2) \leq \frac{E[|X - \mu|^2]}{a^2} = \frac{Var[X]}{a^2}.
\end{align}
Let us use that on our sampling distribution:
\begin{align}
  P(|\bar{X} - \mu| \geq \frac{\sigma}{10}) \leq \frac{100 Var[\bar{X}]}{\sigma^2} = \frac{100 Var[X]}{n \sigma^2} = \frac{100}{n}.
\end{align}
We are interested in the difference being smaller, therefore
\begin{align}
P(|\bar{X} - \mu| < \frac{\sigma}{10}) = 1 - P(|\bar{X} - \mu| \geq \frac{\sigma}{10}) \geq 1 - \frac{100}{n} \geq 0.95.
\end{align}
It follows that we need a sample size of $n \geq \frac{100}{0.05} = 2000$.

</div>\EndKnitrBlock{solution}