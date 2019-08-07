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



## Discrete random variables
\BeginKnitrBlock{exercise}\iffalse{-91-66-101-114-110-111-117-108-108-105-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:Bernev"><strong>(\#exr:Bernev)  \iffalse (Bernoulli) \fi{} </strong></span>Let $X \sim \text{Bernoulli}(p)$. 

a. Find $E[X]$.

b. Find $Var[X]$.

c. <span style="color:blue">R: Let $p = 0.4$. Check your answers to a) and b) with a simulation.</span></div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

a. 
\begin{align*}
  E[X] = \sum_{k=0}^1 p^k (1-p)^{1-k} k = p.
\end{align*}
  
b.
\begin{align*}
  Var[X] = E[X^2] - E[X]^2 = \sum_{k=0}^1 (p^k (1-p)^{1-k} k^2) - p^2 = p(1-p).
\end{align*}
</div>\EndKnitrBlock{solution}

```r
set.seed(1)
nsamps <- 1000
x      <- rbinom(nsamps, 1, 0.4)
mean(x)
```

```
## [1] 0.394
```

```r
var(x)
```

```
## [1] 0.239003
```

```r
0.4 * (1 - 0.4)
```

```
## [1] 0.24
```

\BeginKnitrBlock{exercise}\iffalse{-91-66-105-110-111-109-105-97-108-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:binomev"><strong>(\#exr:binomev)  \iffalse (Binomial) \fi{} </strong></span>Let $X \sim \text{Binomial}(n,p)$. 

a. Find $E[X]$.

b. Find $Var[X]$.
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

a. Let $X = \sum_{i=0}^n X_i$, where $X_i \sim \text{Bernoulli}(p)$. Then, due to linearity of expectation
\begin{align*}
  E[X] = E[\sum_{i=0}^n X_i] = \sum_{i=0}^n E[X_i] = np.
\end{align*}
  
b. Again let $X = \sum_{i=0}^n X_i$, where $X_i \sim \text{Bernoulli}(p)$. Since the Bernoulli variables $X_i$ are independent we have
\begin{align*}
  Var[X] = Var[\sum_{i=0}^n X_i] = \sum_{i=0}^n Var[X_i] = np(1-p).
\end{align*}
</div>\EndKnitrBlock{solution}

\BeginKnitrBlock{exercise}\iffalse{-91-80-111-105-115-115-111-110-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:poisev"><strong>(\#exr:poisev)  \iffalse (Poisson) \fi{} </strong></span>Let $X \sim \text{Poisson}(\lambda)$. 

a. Find $E[X]$.

b. Find $Var[X]$.
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

a.
\begin{align*}
  E[X] &= \sum_{k=0}^\infty \frac{\lambda^k e^{-\lambda}}{k!} k & \\
       &= e^{-\lambda} \lambda \sum_{k=0}^\infty \frac{\lambda^{k-1}}{(k - 1)!} & \\
       &= e^{-\lambda} \lambda \sum_{k=1}^\infty \frac{\lambda^{k-1}}{(k - 1)!} & \text{term at $k=0$ is 0} \\
       &= e^{-\lambda} \lambda \sum_{k=0}^\infty \frac{\lambda^{k}}{k!} & \\
       &= e^{-\lambda} \lambda e^\lambda & \\
       &= \lambda.
\end{align*}
  
b. 
\begin{align*}
  Var[X] &= E[X^2] - E[X]^2 & \\
         &= e^{-\lambda} \lambda \sum_{k=1}^\infty k \frac{\lambda^{k-1}}{(k - 1)!} - \lambda^2 & \\
         &= e^{-\lambda} \lambda \sum_{k=1}^\infty (k - 1) + 1) \frac{\lambda^{k-1}}{(k - 1)!} - \lambda^2 & \\
         &= e^{-\lambda} \lambda \big(\sum_{k=1}^\infty (k - 1) \frac{\lambda^{k-1}}{(k - 1)!} + \sum_{k=1}^\infty \frac{\lambda^{k-1}}{(k - 1)!}\Big) - \lambda^2 & \\
         &= e^{-\lambda} \lambda \big(\lambda\sum_{k=2}^\infty \frac{\lambda^{k-2}}{(k - 2)!} + e^\lambda\Big) - \lambda^2 & \\
         &= e^{-\lambda} \lambda \big(\lambda e^\lambda + e^\lambda\Big) - \lambda^2 & \\
         &= \lambda^2 + \lambda - \lambda^2 & \\
         &= \lambda.
\end{align*}</div>\EndKnitrBlock{solution}


\BeginKnitrBlock{exercise}\iffalse{-91-71-101-111-109-101-116-114-105-99-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:geoev"><strong>(\#exr:geoev)  \iffalse (Geometric) \fi{} </strong></span>Let $X \sim \text{Geometric}(p)$. 

a. Find $E[X]$. Hint: $\frac{d}{dx} x^k = k x^(k - 1)$.

</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

a.
\begin{align*}
  E[X] &= \sum_{k=0}^\infty (1 - p)^k p k & \\
       &= p (1 - p) \sum_{k=0}^\infty (1 - p)^{k-1} k & \\
       &= p (1 - p) \sum_{k=0}^\infty -\frac{d}{dp}(1 - p)^k & \\
       &= p (1 - p) \Big(-\frac{d}{dp}\Big) \sum_{k=0}^\infty (1 - p)^k & \\
       &= p (1 - p) \Big(-\frac{d}{dp}\Big) \frac{1}{1 - (1 - p)} & \text{geometric series} \\
       &= \frac{1 - p}{p}
\end{align*}
</div>\EndKnitrBlock{solution}

## Continuous random variables
\BeginKnitrBlock{exercise}\iffalse{-91-71-97-109-109-97-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:gammaev"><strong>(\#exr:gammaev)  \iffalse (Gamma) \fi{} </strong></span>Let $X \sim \text{Gamma}(\alpha, \beta)$. Hint: $\Gamma(z) = \int_0^\infty t^{z-1}e^{-t} dt$ and $\Gamma(z + 1) = z \Gamma(z)$.


a. Find $E[X]$.

b. Find $Var[X]$.
  
c. <span style="color:blue">R: Let $\alpha = 10$ and $\beta = 2$. Plot the density of $X$. Add a horizontal line at the expected value that touches the density curve (_geom_segment_). Shade the area within a standard deviation of the expected value. </span>
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

a.
\begin{align*}
  E[X] &= \int_0^\infty \frac{\beta^\alpha}{\Gamma(\alpha)}x^\alpha e^{-\beta x} dx & \\
       &= \frac{\beta^\alpha}{\Gamma(\alpha) \int_0^\infty }x^\alpha e^{-\beta x} dx & \text{ (let $t = \beta x$)} \\
       &= \frac{\beta^\alpha}{\Gamma(\alpha) \int_0^\infty }\frac{t^\alpha}{\beta^\alpha} e^{-t} \frac{dt}{\beta} & \\
       &= \frac{1}{\beta \Gamma(\alpha) \int_0^\infty }t^\alpha e^{-t} dt & \\
       &= \frac{\Gamma(\alpha + 1)}{\beta \Gamma(\alpha)} & \\
       &= \frac{\alpha \Gamma(\alpha)}{\beta \Gamma(\alpha)} & \\
       &= \frac{\alpha}{\beta}. &
\end{align*}

  
b.
\begin{align*}
 Var[X] &= E[X^2] - E[X]^2 \\
        &= \int_0^\infty \frac{\beta^\alpha}{\Gamma(\alpha)}x^{\alpha+1} e^{-\beta x} dx - \frac{\alpha^2}{\beta^2} \\
        &= \frac{\Gamma(\alpha + 2)}{\beta^2 \Gamma(\alpha)} - \frac{\alpha^2}{\beta^2} \\
        &= \frac{(\alpha + 1)\alpha\Gamma(\alpha)}{\beta^2 \Gamma(\alpha)} - \frac{\alpha^2}{\beta^2} \\
        &= \frac{\alpha^2 + \alpha}{\beta^2} - \frac{\alpha^2}{\beta^2} \\
        &= \frac{\alpha}{\beta^2}.
\end{align*}

</div>\EndKnitrBlock{solution}

```r
set.seed(1)
x  <- seq(0, 25, by = 0.01)
y  <- dgamma(x, shape = 10, rate = 2)
df <- data.frame(x = x, y = y)
ggplot(df, aes(x = x, y = y)) +
  geom_line() +
  geom_segment(aes(x = 5, y = 0, xend = 5,
                   yend = dgamma(5, shape = 10, rate = 2)),
               color = "red") +
  stat_function(fun = dgamma, args = list(shape = 10, rate = 2), 
                xlim = c(5 - sqrt(10/4), 5 + sqrt(10/4)), geom = "area", fill = "gray", alpha = 0.4)
```

<img src="07-expected_value_files/figure-html/unnamed-chunk-8-1.png" width="672" />

\BeginKnitrBlock{exercise}\iffalse{-91-66-101-116-97-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:betaev"><strong>(\#exr:betaev)  \iffalse (Beta) \fi{} </strong></span>Let $X \sim \text{Beta}(\alpha, \beta)$.


a. Find $E[X]$. Hint 1: $\text{B}(x,y) = \int_0^1 t^{x-1} (1 - t)^{y-1} dt$. Hint 2: $\text{B}(x + 1, y) = \text{B}(x,y)\frac{x}{x + y}$. 

b. Find $Var[X]$.

</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

a.
\begin{align*}
  E[X] &= \int_0^1 \frac{x^{\alpha - 1} (1 - x)^{\beta - 1}}{\text{B}(\alpha, \beta)} x dx \\
       &= \frac{1}{\text{B}(\alpha, \beta)}\int_0^1 x^{\alpha} (1 - x)^{\beta - 1} dx \\
       &= \frac{1}{\text{B}(\alpha, \beta)} \text{B}(\alpha + 1, \beta) \\
       &= \frac{1}{\text{B}(\alpha, \beta)} \text{B}(\alpha, \beta) \frac{\alpha}{\alpha + \beta} \\
       &= \frac{\alpha}{\alpha + \beta}. \\
\end{align*}

  
b.
\begin{align*}
  Var[X] &= E[X^2] - E[X]^2 \\
       &= \int_0^1 \frac{x^{\alpha - 1} (1 - x)^{\beta - 1}}{\text{B}(\alpha, \beta)} x^2 dx - \frac{\alpha^2}{(\alpha + \beta)^2} \\
       &= \frac{1}{\text{B}(\alpha, \beta)}\int_0^1 x^{\alpha + 1} (1 - x)^{\beta - 1} dx - \frac{\alpha^2}{(\alpha + \beta)^2} \\
       &= \frac{1}{\text{B}(\alpha, \beta)} \text{B}(\alpha + 2, \beta) - \frac{\alpha^2}{(\alpha + \beta)^2} \\
       &= \frac{1}{\text{B}(\alpha, \beta)} \text{B}(\alpha + 1, \beta) \frac{\alpha + 1}{\alpha + \beta + 1} - \frac{\alpha^2}{(\alpha + \beta)^2} \\
       &= \frac{\alpha + 1}{\alpha + \beta + 1} \frac{\alpha}{\alpha + \beta} - \frac{\alpha^2}{(\alpha + \beta)^2}\\
       &= \frac{\alpha \beta}{(\alpha + \beta)^2(\alpha + \beta + 1)}.
\end{align*}

</div>\EndKnitrBlock{solution}


\BeginKnitrBlock{exercise}\iffalse{-91-69-120-112-111-110-101-110-116-105-97-108-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:expev"><strong>(\#exr:expev)  \iffalse (Exponential) \fi{} </strong></span>Let $X \sim \text{Exp}(\lambda)$.


a. Find $E[X]$. Hint: $\Gamma(z + 1) = z\Gamma(z)$ and $\Gamma(1) = 1$.

b. Find $Var[X]$.

</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

a.
\begin{align*}
  E[X] &= \int_0^\infty \lambda e^{-\lambda x} x dx & \\
       &= \lambda \int_0^\infty x e^{-\lambda x} dx & \\
       &= \lambda \int_0^\infty \frac{t}{\lambda} e^{-t} \frac{dt}{\lambda} & \text{$t = \lambda x$}\\
       &= \lambda \lambda^{-2} \Gamma(2) & \text{definition of gamma function}  \\
       &= \lambda^{-1}.
\end{align*}


b.
\begin{align*}
  Var[X] &= E[X^2] - E[X]^2  & \\
         &= \int_0^\infty \lambda e^{-\lambda x} x^2 dx - \lambda^{-2} & \\
         &= \lambda \int_0^\infty \frac{t^2}{\lambda^2} e^{-t} \frac{dt}{\lambda} - \lambda^{-2} &  \text{$t = \lambda x$} \\
         &= \lambda \lambda^{-3} \Gamma(3) - \lambda^{-2} &  \text{definition of gamma function} &  \\
         &= \lambda^{-2} 2 \Gamma(2) - \lambda^{-2} & \\
         &= 2 \lambda^{-2} - \lambda^{-2} & \\
         &= \lambda^{-2}. & \\
\end{align*}

</div>\EndKnitrBlock{solution}


\BeginKnitrBlock{exercise}\iffalse{-91-78-111-114-109-97-108-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:normev"><strong>(\#exr:normev)  \iffalse (Normal) \fi{} </strong></span>Let $X \sim \text{N}(\mu, \sigma)$.


a. Show that $E[X] = \mu$. Hint: Use the error function $\text{erf}(x) = \frac{1}{\sqrt(\pi)} \int_{-x}^x e^{-t^2} dt$. The statistical interpretation of this function is that if $Y \sim \text{N}(0, 0.5)$, then the error function describes the probability of $Y$ falling between $-x$ and $x$.

b. Show that $Var[X] = \sigma^2$. Hint: Start with the definition of variance.

</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

a.
\begin{align*}
  E[X] &= \int_{-\infty}^\infty \frac{1}{\sqrt{2\pi \sigma^2}} e^{-\frac{(x - \mu)^2}{2\sigma^2}} x dx & \\
       &= \frac{1}{\sqrt{2\pi \sigma^2}} \int_{-\infty}^\infty x e^{-\frac{(x - \mu)^2}{2\sigma^2}} dx & \\
       &= \frac{1}{\sqrt{2\pi \sigma^2}} \int_{-\infty}^\infty \Big(t \sqrt{2\sigma^2} + \mu\Big)e^{-t^2} \sqrt{2 \sigma^2} dt & t = \frac{x - \mu}{\sqrt{2\sigma}} \\
       &= \frac{\sqrt{2\sigma^2}}{\sqrt{\pi}} \int_{-\infty}^\infty t  e^{-t^2} dt + \frac{1}{\sqrt{\pi}} \int_{-\infty}^\infty \mu e^{-t^2} dt & \\
\end{align*}

Let us calculate these integrals separately.
\begin{align*}
  \int t e^{-t^2} dt &= -\frac{1}{2}\int e^{s} ds & s = -t^2 \\
                     &= -\frac{e^s}{2} + C \\
                     &= -\frac{e^{-t^2}}{2} + C & \text{undoing substitution}.
\end{align*}
Inserting the integration limits we get 
\begin{align*}
  \int_{-\infty}^\infty t e^{-t^2} dt &= 0,
\end{align*}
due to the integrated function being symmetric.

Reordering the second integral we get
\begin{align*}
  \mu \frac{1}{\sqrt{\pi}} \int_{-\infty}^\infty e^{-t^2} dt &= \mu \text{erf}(\infty) & \text{definition of error function} \\
                                                             &= \mu & \text{probability of $Y$ falling between $-\infty$ and $\infty$}.
\end{align*} 
Combining all of the above we get
\begin{align*}
  E[X] &= \frac{\sqrt{2\sigma^2}}{\sqrt{\pi}} \times 0 + \mu 
       &= \mu.\\
\end{align*}


b. 
\begin{align*}
  Var[X] &= E[(X - E[X])^2] \\
         &= E[(X - \mu)^2] \\
         &= \frac{1}{\sqrt{2\pi \sigma^2}} \int_{-\infty}^\infty (x - \mu)^2 e^{-\frac{(x - \mu)^2}{2\sigma^2}} dx \\
         &= \frac{\sigma^2}{\sqrt{2\pi}} \int_{-\infty}^\infty t^2 e^{-\frac{t^2}{2}} dt \\
         &= \frac{\sigma^2}{\sqrt{2\pi}} \bigg(\Big(- t e^{-\frac{t^2}{2}} |_{-\infty}^\infty \Big) + \int_{-\infty}^\infty e^{-\frac{t^2}{2}} \bigg) dt & \text{integration by parts} \\
         &= \frac{\sigma^2}{\sqrt{2\pi}} \sqrt{2 \pi} \int_{-\infty}^\infty  \frac{1}{\sqrt(\pi)}e^{-s^2} \bigg) & s = \frac{t}{\sqrt{2}} \text{ and evaluating the left expression at the bounds} \\
         &= \frac{\sigma^2}{\sqrt{2\pi}} \sqrt{2 \pi} \Big(\text{erf}(\infty) & \text{definition of error function} \\
         &= \sigma^2.
\end{align*}

</div>\EndKnitrBlock{solution}

## Sums, functions, conditional expectations

\BeginKnitrBlock{exercise}\iffalse{-91-83-117-109-32-111-102-32-105-110-100-101-112-101-110-100-101-110-116-32-114-97-110-100-111-109-32-118-97-114-105-97-98-108-101-115-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-12"><strong>(\#exr:unnamed-chunk-12)  \iffalse (Sum of independent random variables) \fi{} </strong></span>Let $X_1, X_2,...,X_n$ be IID random variables with expected value $E[X_i] = \mu$ and variance $Var[X_i] = \sigma^2$. Find the expected value and variance of $\bar{X} = \frac{1}{n} \sum_{i=1}^n X_i$. $\bar{X}$ is called a _statistic_ (a function of the values in a sample). It is itself a random variable. <span style="color:blue">R: Take $n = 5, 10, 100, 1000$ samples from the N($2$, $6$) distribution 10000 times. Plot the theoretical density and the densities of $\bar{X}$ statistic for each $n$. Intuitively, are the results in correspondence with your calculations? Check them numerically.</span>
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

<img src="07-expected_value_files/figure-html/unnamed-chunk-14-1.png" width="672" />
