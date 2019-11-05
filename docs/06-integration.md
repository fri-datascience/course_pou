# Integration {#integ}

This chapter deals with abstract and Monte Carlo integration.

The students are expected to acquire the following knowledge:

**Theoretical**

- How to calculate Lebesgue integrals for non-simple functions.

**R**

- Monte Carlo integration.



## Monte Carlo integration
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-2"><strong>(\#exr:unnamed-chunk-2) </strong></span><span style="color:blue">Let $X$ and $Y$ be continuous random variables on the unit interval and $p(x,y) = 6(x - y)^2$. Use Monte Carlo integration to estimate the probability $P(0.2 \leq X  \leq 0.5, \: 0.1 \leq Y \leq 0.2)$. Can you find the exact value?</span></div>\EndKnitrBlock{exercise}


## Lebesgue integrals
\BeginKnitrBlock{exercise}\iffalse{-91-102-114-111-109-32-74-97-103-97-110-110-97-116-104-97-110-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-4"><strong>(\#exr:unnamed-chunk-4)  \iffalse (from Jagannathan) \fi{} </strong></span>Find the Lebesgue integral of the following functions on ($\mathbb{R}$, $\mathcal{B}(\mathbb{R})$, $\lambda$).

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



\BeginKnitrBlock{exercise}\iffalse{-91-102-114-111-109-32-74-97-103-97-110-110-97-116-104-97-110-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-6"><strong>(\#exr:unnamed-chunk-6)  \iffalse (from Jagannathan) \fi{} </strong></span>Let $c \in \mathbb{R}$ be fixed and ($\mathbb{R}$, $\mathcal{B}(\mathbb{R})$) a measurable space. If for any Borel set $A$, $\delta_c (A) = 1$ if $c \in A$, and $\delta_c (A) = 0$ otherwise, then $\delta_c$ is called a _Dirac measure_. Let $g$ be a non-negative, measurable function. Show that $\int g d \delta_c = g(c)$.</div>\EndKnitrBlock{exercise}


