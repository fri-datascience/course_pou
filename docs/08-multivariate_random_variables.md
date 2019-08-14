# Multivariate random variables {#mrv}

This chapter deals with multivariate random variables.

The students are expected to acquire the following knowledge:

**Theoretical**

- Multivariate normal distribution.


**R**

- Sampling from the multivariate normal distribution.



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

<img src="08-multivariate_random_variables_files/figure-html/unnamed-chunk-3-1.png" width="672" />

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

<img src="08-multivariate_random_variables_files/figure-html/unnamed-chunk-3-2.png" width="672" />


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

<img src="08-multivariate_random_variables_files/figure-html/unnamed-chunk-4-1.png" width="672" />

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

