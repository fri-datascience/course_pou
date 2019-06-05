# Uncountable probability spaces {#uprobspaces}

This chapter deals with uncountable probability spaces.

The students are expected to acquire the following knowledge:

**Theoretical**

- Understand Borel sets and identify them
- Estimate Lebesgue measure for different sets.
- Know when sets are Borel-measurable.

**R**

- uniform sampling
- mean
- recursion



## Borel sets

## Lebesgue measure

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-2"><strong>(\#exr:unnamed-chunk-2) </strong></span>Show that the Lebesgue measure of rational numbers on $[0,1]$ is 0. 
<span style="color:blue">R: Implement a random number generator, which
generates uniform samples of irrational numbers in $[0,1]$ by uniformly sampling
from $[0,1]$ and rejecting a sample if it is rational.</span>
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}There are a countable number of rational numbers. Therefore, we can write
\begin{align}
  \lambda(\mathbb{Q}) &= \lambda(\cup_{i = 1}^{\infty} q_i) &\\
                      &= \sum_{i = 1}^{\infty} \lambda(q_i) &\text{ (countable additivity)} \\
                      &= \sum_{i = 1}^{\infty} 0  &\text{ (Lebesgue measure of a singleton)} \\
                      &= 0.
\end{align}</div>\EndKnitrBlock{solution}

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-4"><strong>(\#exr:unnamed-chunk-4) </strong></span>Show that $\mathcal{C} = \sigma(\mathcal{C})$ if and only if $\mathcal{C}$ is
a sigma algebra.
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}<span style="color:red">TODO</span></div>\EndKnitrBlock{solution}


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-6"><strong>(\#exr:unnamed-chunk-6) </strong></span>

a. Prove that the Lebesgue measure of $\mathbb{R}$ is infinity. 

b. _Paradox_. Show that the cardinality of $\mathbb{R}$ and $(0,1)$ is the same, 
while their Lebesgue measures are infinity and one respectably.

</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

a. Let $a_i$ be the $i$-th integer for $i \in \mathbb{Z}$. We can write
$\mathbb{R} = \cup_{-\infty}^{\infty} (a_i, a_{i + 1}]$.

\begin{align}
  \lambda(\mathbb{R}) &= \lambda(\cup_{i = -\infty}^{\infty} (a_i, a_{i + 1}]) \\
                      &= \lambda(\lim_{n \rightarrow \infty} \cup_{i = -n}^{n} (a_i, a_{i + 1}]) \\
                      &= \lim_{n \rightarrow \infty} \lambda(\cup_{i = -n}^{n} (a_i, a_{i + 1}]) \\
                      &= \lim_{n \rightarrow \infty} \sum_{i = -n}^{n} \lambda((a_i, a_{i + 1}]) \\
                      &= \lim_{n \rightarrow \infty} \sum_{i = -n}^{n} 1 \\
                      &= \lim_{n \rightarrow \infty} 2n \\
                      &= \infty.
    
\end{align}

b. We need to find a bijection between $\mathbb{R}$ and $(0,1)$. A well-known
function that maps from a bounded interval to $\mathbb{R}$ is the tangent.
To make the bijection easier to achieve, we will take the inverse, which
maps from $\mathbb{R}$ to $(-\frac{\pi}{2}, \frac{\pi}{2})$. However, we need
to change the function so it maps to $(0,1)$. First we add $\frac{\pi}{2}$, so
that we move the function above zero. Then we only have to divide by the max 
value, which in this case is $\pi$. So our bijection is

\begin{equation}
 f(x) = \frac{\tan^{-1}(x) + \frac{\pi}{2}}{\pi}.
\end{equation}


</div>\EndKnitrBlock{solution}


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-8"><strong>(\#exr:unnamed-chunk-8) </strong></span>
Take the measure space $(\Omega_1 = (0,1], B_{(0,1], \lambda})$ (we know 
that this is a probability space on $(0,1]$).

a. Define an injective map (function) from $\Omega_1$ to 
$\Omega_2 = \{1,2,3,4,5,6\}$ such that the measure space 
$(\Omega_2, 2^{\Omega_2}, \lambda(f^{-1}()))$ will be a discrete probability
space with uniform probabilities 
($P(\omega) = \frac{1}{6}, \forall \omega \in \Omega_2)$.
b. Is the map that you defined in (a) the only such map?
c. How would you in the same fashion define an injective map that would result
in a probability space that can be interpreted as a coin toss with probability
$p$ of heads?
d. <span style="color:blue">R: Use the map in (a) as a basis for a random 
generator for this fair die.</span>

</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

a. In other words, we have to assign disjunct intervals of the same size to
each element of $\Omega_2$. Therefore

\begin{equation}
  f(x) = \lceil 6x \rceil.
\end{equation}
  
b. No we could for example rearrange the order in which the intervals are 
mapped to integers. Additionally, we could have several disjoint intervals that 
mapped to the same integer, as long as the Lebesgue measure of their union 
would be $\frac{1}{6}$ and the function would remain injective. 
c. We have $\Omega_3 = \{0,1\}$, where zero represents heads and one represents
tails. Then
\begin{equation}
  f(x) = 0^{I_{A}(x)},
\end{equation}
where $A = \{y \in (0,1] : y < p\}$.

</div>\EndKnitrBlock{solution}


```r
set.seed(1)
unif_s <- runif(1000)
die_s  <- ceiling(6 * unif_s)
summary(as.factor(die_s))
```

```
##   1   2   3   4   5   6 
## 166 154 200 146 166 168
```

