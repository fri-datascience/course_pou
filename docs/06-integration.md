# Integration {#integ}

This chapter deals with abstract and Monte Carlo integration.

The students are expected to acquire the following knowledge:

**Theoretical**

- How to calculate Lebesgue integrals for non-simple functions.

**R**

- Monte Carlo integration.



## Monte Carlo integration
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-2"><strong>(\#exr:unnamed-chunk-2) </strong></span><span style="color:blue">Let $X \sim \text{Gamma}(3,2)$ and $Y = \log(X)$. Use Monte Carlo integration to estimate the probability $P(-1 \leq Y  \leq 1)$. Can you find the exact value?</span></div>\EndKnitrBlock{exercise}

```r
set.seed(1)
nsamps <- 1000
x      <- rgamma(nsamps, 3, 2)
y      <- log(x)
sum(y > -1 & y < 1) / nsamps
```

```
## [1] 0.86
```

## Lebesgue integrals
\BeginKnitrBlock{exercise}\iffalse{-91-98-111-114-114-111-119-101-100-32-102-114-111-109-32-66-105-110-100-101-114-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-4"><strong>(\#exr:unnamed-chunk-4)  \iffalse (borrowed from Binder) \fi{} </strong></span>Find the Lebesgue integral of the following functions on ($\mathbb{R}$, $\mathcal{B}(\mathbb{R})$, $\lambda$).

a.
\begin{align}
  f(\omega) = 
    \begin{cases}
      \omega, & \text{for } \omega = 0,1,...,n \\
      0, & \text{elsewhere}
    \end{cases}
\end{align}
  
b.
\begin{align}
  f(\omega) = 
    \begin{cases}
      1, & \text{for } \omega = \mathbb{Q}^c \cap [0,1] \\
      0, & \text{elsewhere}
    \end{cases}
\end{align}
  
c.
\begin{align}
  f(\omega) = 
    \begin{cases}
      n, & \text{for } \omega = \mathbb{Q}^c \cap [0,n] \\
      0, & \text{elsewhere}
    \end{cases}
\end{align}</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

a.
\begin{align}
  \int f(\omega) d\lambda = \sum_{\omega = 0}^n \omega \lambda(\omega) = 0.
\end{align}

b.
\begin{align}
  \int f(\omega) d\lambda = 1 \times \lambda(\mathbb{Q}^c \cap [0,1]) = 1.
\end{align}

c.
\begin{align}
  \int f(\omega) d\lambda = n \times \lambda(\mathbb{Q}^c \cap [0,n]) = n^2.
\end{align}</div>\EndKnitrBlock{solution}


\BeginKnitrBlock{exercise}\iffalse{-91-98-111-114-114-111-119-101-100-32-102-114-111-109-32-66-105-110-100-101-114-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-6"><strong>(\#exr:unnamed-chunk-6)  \iffalse (borrowed from Binder) \fi{} </strong></span>Let $c \in \mathbb{R}$ be fixed and ($\mathbb{R}$, $\mathcal{B}(\mathbb{R})$) a measurable space. If for any Borel set $A$, $\delta_c (A) = 1$ if $c \in A$, and $\delta_c (A) = 0$ otherwise, then $\delta_c$ is called a _Dirac measure_. Let $g$ be a non-negative, measurable function. Show that $\int g d \delta_c = g(c)$.</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}\begin{align}
  \int g d \delta_c &= \sup_{q \in S(g)} \int q d \delta_c \\
                    &= \sup_{q \in S(g)} \sum_{i = 1}^n a_i \delta_c(A_i) \\
                    &= \sup_{q \in S(g)} \sum_{i = 1}^n a_i \text{I}_{A_i}(c) \\
                    &= \sup_{q \in S(g)} q(c) \\
                    &= g(c)
\end{align}
<span style="color:red">TODO: Check with Erik.</span></div>\EndKnitrBlock{solution}

