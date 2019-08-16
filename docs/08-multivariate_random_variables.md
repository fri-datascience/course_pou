# Multivariate random variables {#mrv}

This chapter deals with multivariate random variables.

The students are expected to acquire the following knowledge:

**Theoretical**

- Multivariate normal distribution.


**R**

- Sampling from the multivariate normal distribution.



## Multinomial random variables
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:mnompdf"><strong>(\#exr:mnompdf) </strong></span>Let $X_i$, $i = 1,...,k$ represent $k$ events, and $p_i$ the probabilities
of these events happening in a trial. Let $n$ be the number of trials, and
$X$ a multivariate random variable, the collection of $X_i$. 
Then $p(x) = \frac{n!}{x_1!x_2!...x_k!} p_1^{x_1} p_2^{x_2}...p_k^{x_k}$
is the PMF of a multinomial distribution.

a. Show that the marginal distribution of $X_i$ is a binomial distribution.

b. Take 1000 samples from the multinomial distribution with $n=4$ and
probabilities $p = (0.2, 0.2, 0.5, 0.1)$. Then take 1000 samples from 
four binomial distributions with the same parameters. Inspect the results
visually.

</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

a. We will approach this proof from the probabilistic point of view.
W.L.O.G. let $x_1$ be the marginal distribution we are interested in.
The term $p^{x_1}$ denotes the probability that event 1 happened $x_1$ times.
For this event not to happen, one of the other events needs to happen. So
for each of the remaining trials, the probability of another event is
$\sum_{i=2}^k p_i = 1 - p_1$, and there were $n - x_1$ such trials.
What is left to do is to calculate the number of permutations of event 1
happening and event 1 not happening. We choose $x_1$ trials, from $n$ trials.
Therefore $p(x_1) = \binom{n}{x_1} p_1^{x_1} (1 - p_1)^{n - x_1}$, which is
the binomial PMF. Interested students are encouraged to prove this 
mathematically.</div>\EndKnitrBlock{solution}

```r
set.seed(1)
nsamps      <- 1000
samps_mult  <- rmultinom(nsamps, 4, prob = c(0.2, 0.2, 0.5, 0.1))
samps_mult  <- as_tibble(t(samps_mult)) %>%
  gather()
samps       <- tibble(
  V1 = rbinom(nsamps, 4, 0.2),
  V2 = rbinom(nsamps, 4, 0.2),
  V3 = rbinom(nsamps, 4, 0.5),
  V4 = rbinom(nsamps, 4, 0.1)
) %>%
  gather() %>%
  bind_rows(samps_mult) %>%
  bind_cols("dist" = c(rep("binomial", 4*nsamps), rep("multinomial", 4*nsamps)))

ggplot(samps, aes(x = value, fill = dist)) +
  geom_bar(position = "dodge") +
  facet_wrap(~ key)
```

<img src="08-multivariate_random_variables_files/figure-html/unnamed-chunk-3-1.png" width="672" />


\BeginKnitrBlock{exercise}\iffalse{-91-77-117-108-116-105-110-111-109-105-97-108-32-101-120-112-101-99-116-101-100-32-118-97-108-117-101-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:mnomev"><strong>(\#exr:mnomev)  \iffalse (Multinomial expected value) \fi{} </strong></span>Find the expected value, variance and covariance of the multinomial distribution.

</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}The expected value... Use the differentiation trick.
</div>\EndKnitrBlock{solution}

## Multivariate normal random variables
\BeginKnitrBlock{exercise}\iffalse{-91-67-104-111-108-101-115-107-121-32-100-101-99-111-109-112-111-115-105-116-105-111-110-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:mvnchol"><strong>(\#exr:mvnchol)  \iffalse (Cholesky decomposition) \fi{} </strong></span>Let $X$ be a random vector of length $k$ with $X_i \sim \text{N}(0, 1)$ and $LL^*$ the Cholesky decomposition of a Hermitian positive-definite matrix $A$. Let $\mu$ be a vector of length $k$.

a. Find the distribution of the random vector $Y = \mu + L X$. 

b. Find the Cholesky decomposition of $A = 
\begin{bmatrix} 
  2 & 1.2 \\
  1.2 & 1 
\end{bmatrix}$.

c. <span style="color:blue">R: Use the results from a) and b) to sample from the MVN distribution $\text{N}(\mu, A)$, where $\mu = [1.5, -1]^T$. Plot a scatterplot and compare it to direct samples from the multivariate normal distribution (_rmvnorm_). </span>
  
d. <span style="color:blue">R: $L$ is a linear map$. Plot 10 points from $X$ and 10 points from the transformation $L X$ (Hint: use color or shapes). Compare and discuss the results.</span></div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

a. $X$ has an independent normal distribution of dimension $k$. Then
\begin{align}
  Y = \mu + L X &\sim \text{N}(\mu, LL^T) \\
                &\sim \text{N}(\mu, A).
\end{align}
  
  
b.
\begin{align}
  \begin{bmatrix} 
    a & 0 \\
    b & c 
  \end{bmatrix}
  \begin{bmatrix} 
    a & b \\
    0 & c 
  \end{bmatrix} =
  \begin{bmatrix} 
    2 & 1.2 \\
    1.2 & 1 
  \end{bmatrix}
\end{align}


</div>\EndKnitrBlock{solution}

```r
# a
set.seed(1)
nsamps <- 1000
X      <- matrix(data = rnorm(nsamps * 2), ncol = 2)
mu     <- c(1.5, -1)
L      <- matrix(data = c(sqrt(2), 0,
                          1.2 / sqrt(2), sqrt(1 - 1.2^2/2)),
                 ncol  = 2,
                 byrow = TRUE)
Y      <- t(mu + L %*% t(X))
plot_df <- data.frame(rbind(X, Y), c(rep("X", nsamps), rep("Y", nsamps)))
colnames(plot_df) <- c("D1", "D2", "var")
ggplot(data = plot_df, aes(x = D1, y = D2, colour = as.factor(var))) +
  geom_point()
```

<img src="08-multivariate_random_variables_files/figure-html/unnamed-chunk-6-1.png" width="672" />

```r
# b
nsamps <- 10
X      <- matrix(data = rnorm(nsamps * 2), ncol = 2)
L      <- matrix(data = c(sqrt(2), 0,
                          1.2 / sqrt(2), sqrt(1 - 1.2^2/2)),
                 ncol  = 2,
                 byrow = TRUE)
Y      <- t(L %*% t(X))
plot_df <- data.frame(rbind(X, Y), 
                      c(rep("X", nsamps), rep("Y", nsamps)), 
                      c(1:nsamps, 1:nsamps))
colnames(plot_df) <- c("D1", "D2", "var", "samp")
ggplot(data = plot_df, aes(x = D1, 
                           y = D2, 
                           color = as.factor(var), 
                           shape = as.factor(samp))) +
  geom_point() +
  scale_shape_manual(values=1:10)
```

<img src="08-multivariate_random_variables_files/figure-html/unnamed-chunk-6-2.png" width="672" />


\BeginKnitrBlock{exercise}\iffalse{-91-69-105-103-101-110-100-101-99-111-109-112-111-115-105-116-105-111-110-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:mvneigen"><strong>(\#exr:mvneigen)  \iffalse (Eigendecomposition) \fi{} </strong></span><span style="color:blue">R: Let $\Sigma = U \Lambda U^T$ be the eigendecomposition of covariance matrix $\sigma$. Follow the procdeure below, to sample from a multivariate normal with $\mu = [-2, 1]^T$ and $\Sigma =
\begin{bmatrix} 
  0.3, -0.5 \\
  -0.5, 1.6 
\end{bmatrix}$:</span>

1. <span style="color:blue">Sample from two independent standardized normal distributions to get $X$.</span>
  
2. <span style="color:blue">Find the eigen decomposition of $X$ (_eigen_).</span>

3. <span style="color:blue">Multiply $X$ by $\Lambda^{\frac{1}{2}}$ to get $X2$. Consider how the eigendecomposition for $X2$ changes compared to $X$. </span>
    
4. <span style="color:blue">Multiply $X2$ by $U$ to get $X3$. Consider how the eigendecomposition for $X3$ changes compared to $X2$. </span>
    
5. <span style="color:blue">Add $\mu$ to $X3$. Consider how the eigendecomposition for $X4$ changes compared to $X3$. </span>
    
6. <span style="color:blue">Plot the data and the eigenvectors (scaled with $\Lambda^{\frac{1}{2}}$) at each step. Hint: Use _geom_segment_ for the eigenvectors. </span>
</div>\EndKnitrBlock{exercise}

```r
# a
set.seed(1)
sigma <- matrix(data = c(0.3, -0.5,
                         -0.5, 1.6),
                nrow  = 2,
                byrow = TRUE)
ed    <- eigen(sigma)
e_val  <- ed$values
e_vec  <- ed$vectors



# b
set.seed(1)
nsamps <- 1000
X      <- matrix(data = rnorm(nsamps * 2), ncol = 2)
vec1   <- matrix(c(1,0,0,1), nrow = 2)

X2     <- t(sqrt(diag(e_val)) %*% t(X))
vec2   <- sqrt(diag(e_val)) %*% vec1

X3     <- t(e_vec %*% t(X2))
vec3   <- e_vec %*% vec2

X4     <- t(c(-2, 1) + t(X3))
vec4   <- c(-2, 1) + vec3

vec_mat <- data.frame(matrix(c(0,0,0,0,0,0,0,0,0,0,0,0,-2,1,-2,1), ncol = 2, byrow = TRUE),
                      t(cbind(vec1, vec2, vec3, vec4)),
                      c(1,1,2,2,3,3,4,4))


df     <- data.frame(rbind(X, X2, X3, X4), c(rep(1, nsamps),
                                             rep(2, nsamps),
                                             rep(3, nsamps),
                                             rep(4, nsamps)))


colnames(df) <- c("D1", "D2", "wh")
colnames(vec_mat) <- c("D1", "D2", "E1", "E2", "wh")
ggplot(data = df, aes(x = D1, y = D2)) +
  geom_point() +
  geom_segment(data = vec_mat, aes(xend = E1, yend = E2), color = "red") +
  facet_wrap(~ wh) +
  coord_fixed()
```

<img src="08-multivariate_random_variables_files/figure-html/unnamed-chunk-7-1.png" width="672" />

\BeginKnitrBlock{exercise}\iffalse{-91-77-97-114-103-105-110-97-108-32-97-110-100-32-99-111-110-100-105-116-105-111-110-97-108-32-100-105-115-116-114-105-98-117-116-105-111-110-115-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:mvncond"><strong>(\#exr:mvncond)  \iffalse (Marginal and conditional distributions) \fi{} </strong></span>Let $X \sim \text{N}(\mu, \Sigma)$, where $\mu = [2, 0, -1]^T and $\Sigma =
\begin{bmatrix} 
  1 & -0.2 & 0.5 \\
  -0.2 & 1.4 & 0 \\
  0.5 & 0 & 2 \\
\end{bmatrix}$. <span style="color:blue">R: For the calculation in the following points, you can use R.</span>
  
a. Find the distribution of $\Sigma_A$.

b. Find the distribution of $\Sigma_A | Sigma_B$.

c. Find the distribution of.

d. Find the distribution of.

e. Find the distribution of.

f.  <span style="color:blue">R: Visually compare the distributions of a) and b), and c), d) and e) at different conditional values.</span></div>\EndKnitrBlock{exercise}

```r
mu    <- c(2, 0, -1)
Sigma <- matrix(c(1, -0.2, 0.5,
                  -0.2, 1.4, -1.2,
                  0.5, -1.2, 2),
                nrow = 3,
                byrow = TRUE)
mu_A     <- c(2, 0)
mu_B     <- -1
Sigma_A  <- Sigma[1:2, 1:2]
Sigma_B  <- Sigma[3, 3]
Sigma_AB <- Sigma[1:2, 3]


# b
tmp_b   <- Sigma_AB * (1 / Sigma_B)
mu_b    <- mu_A - tmp_b * mu_B
Sigma_b <- Sigma_B - t(Sigma_AB) %*% solve(Sigma_A) %*% Sigma_AB

tmp_b
```

```
## [1]  0.25 -0.60
```

```r
mu_b
```

```
## [1]  2.25 -0.60
```

```r
Sigma_b
```

```
##           [,1]
## [1,] 0.8602941
```

```r
# d
Sigma_d <- Sigma_A - (Sigma_AB * (1 / Sigma_B)) %*% t(Sigma_AB)
Sigma_d
```

```
##       [,1] [,2]
## [1,] 0.875 0.10
## [2,] 0.100 0.68
```

```r
Sigma_d
```

```
##       [,1] [,2]
## [1,] 0.875 0.10
## [2,] 0.100 0.68
```
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

a. $\mu_A = [2, 0, -1]^T$ and $\Sigma_A =
\begin{bmatrix} 
  1 & -0.2 & \\
  -0.2 & 1.4 \\
\end{bmatrix}$. 
  
b. 
\begin{align}
  X_A | X_B &= b \sim \text{N}(\mu_t, \Sigma_t), \\
  \mu_t     &= [2.25, -0.6]^T + [2.25, -0.6]^T b, \\
  \Sigma_t  &= 
  \begin{bmatrix} 
  0.875 & 0.1 \\
  0.1 & 0.68 \\
\end{bmatrix}
\end{align}
</div>\EndKnitrBlock{solution}

## Transformations
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-10"><strong>(\#exr:unnamed-chunk-10) </strong></span>Let $(U,V)$ be a random variable with PDF $p(u,v) = \frac{1}{8 \sqrt{u}}$,
$U \in [0,4]$ and $V \in [\sqrt{U}, \sqrt{U} - 1]$. Let $X = \sqrt{U}$ and
$Y = V - \sqrt{U}$.

a. Find PDF of $(X,Y)$. What can you tell about distributions of $X$ and $Y$?
This exercise shows how we can simplify a probabilistic problem with a
clever use of transformations.

b. <span style="color:blue">R: Take 1000 samples from $(X,Y)$ and transform
them with inverses of the above functions to get samples from $(U,V)$.
Plot both sets of samples.</span>

</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

a. First we need to find the inverse functions. Since $x = \sqrt{u}$ it
follows that $u = x^2$, and that $x \in [-2,2]$. Similarly
$v = y + x$ and $y \in [0,1]$. Let us first find the Jacobian.
\[\renewcommand\arraystretch{1.6}
J(x,y) =
\begin{bmatrix}
  \frac{\partial u}{\partial x} &
  \frac{\partial v}{\partial x} \\%[1ex] % <-- 1ex more space between rows of matrix
  \frac{\partial u}{\partial y} &
  \frac{\partial v}{\partial y}
\end{bmatrix} =
  \begin{bmatrix}
  2x &
  1 \\%[1ex] % <-- 1ex more space between rows of matrix
  0 &
  1
\end{bmatrix},
\]
and the determinant is $|J(x,y)| = 2x$. Putting everything together, we get
\begin{align}
  p_{X,Y}(x,y) = p_{U,V}(x^2, y + x) |J(x,y)| = \frac{1}{8 \sqrt{x^2}} 2x = \frac{1}{4}.
\end{align}
This reminds us of the Uniform distribution. Indeed we can see that 
$p_X(x) = \frac{1}{4}$ and $p_Y(y) = 1$. So instead of dealing with an
awkward PDF of $(U,V)$ and the corresponding dynamic bounds, we are now
looking at two independent Uniform random variables. In practice, this could
make modeling much easier.


</div>\EndKnitrBlock{solution}

```r
set.seed(1)
nsamps <- 1000
x      <- runif(nsamps, min = -2, max = 2)
y      <- runif(nsamps)
orig   <- tibble(x = x, y = y, vrs = "original")
u      <- x^2
v      <- y + x
transf <- tibble(x = u, y = v, vrs = "transformed")
df     <- bind_rows(orig, transf)
ggplot(df, aes(x = x, y = y, color = vrs)) +
  geom_point(alpha = 0.3)
```

<img src="08-multivariate_random_variables_files/figure-html/unnamed-chunk-12-1.png" width="672" />

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-13"><strong>(\#exr:unnamed-chunk-13) </strong></span><span style="color:blue">R: Write a function that will calculate the probability density of an arbitraty multivariate normal distribution, based on independent standardized normal PDFs. Compare?</span> <span style="color:red">Compare?</span>

</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}TODO: Inverse of the transformation (exists, because the inverse of Q exists). Jacobi (simplified?).</div>\EndKnitrBlock{solution}

```r
set.seed(1)
```
