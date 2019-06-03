# Probability spaces {#introduction}

This chapter deals with measures and probability spaces. At the end of
the chapter, we look more closely at discrete probability spaces.

The students are expected to acquire the following knowledge:

**Theoretical**

1. Use properties of probability to calculate probabilities.
2. Combinatorics.
3. Understanding of continuity of probability.

**R**

- vectors
- for loop
- estimating probability with simulation
- sample function
- matrices



## Measure and probability spaces
\BeginKnitrBlock{exercise}\iffalse{-91-67-111-109-112-108-101-116-105-110-103-32-97-32-115-101-116-32-116-111-32-97-32-83-105-103-109-97-32-97-108-103-101-98-114-97-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-2"><strong>(\#exr:unnamed-chunk-2)  \iffalse (Completing a set to a Sigma algebra) \fi{} </strong></span>Let $\Omega = \{1,2,...,10\}$. Let $A = [\{ \}, \{1\}, \{2\}, \Omega]$.

- Show that $A$ is not a sigma algebra of $\Omega$.
- Find the minimum number of elements to complete A to a sigma algebra of
$\Omega$.
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

- $1^c = \{2,3,...,10\} \notin A \implies$ $A$ is not sigma algebra.
- First we need the complements of all elements, so we need to add sets
$\{2,3,...,10\}$ and $\{1,3,4,...,10\}$. Next we need unions of all sets --
we add the set $\{1,2\}$. Again we need the complement of this set, so we add
$\{3,4,...,10\}$. So the minimum number of elements we need to add is 4.
</div>\EndKnitrBlock{solution}


\BeginKnitrBlock{exercise}\iffalse{-91-68-105-118-101-114-115-105-116-121-32-111-102-32-115-105-103-109-97-32-97-108-103-101-98-114-97-115-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-4"><strong>(\#exr:unnamed-chunk-4)  \iffalse (Diversity of sigma algebras) \fi{} </strong></span>Let $\Omega$ be a set.

- Show that $2^{\Omega}$ is a sigma algebra.
- Find the smallest sigma algebra of $\Omega$.
- Find the largest Sigma algebra of $\Omega$.
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

- <span style="color:red">TODO</span>
- $A = \{\emptyset, \Omega\}$
- $2^{\Omega}$
</div>\EndKnitrBlock{solution}


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-6"><strong>(\#exr:unnamed-chunk-6) </strong></span>Find all sigma algebras for $\Omega = \{0, 1, 2\}$.
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

- $A = \{\emptyset, \Omega\}$
- $A = 2^{\Omega}$
- $A = \{\emptyset, \{0\}, \{1,2\}, \Omega\}$
- $A = \{\emptyset, \{1\}, \{0,2\}, \Omega\}$
- $A = \{\emptyset, \{2\}, \{0,1\}, \Omega\}$
</div>\EndKnitrBlock{solution}


\BeginKnitrBlock{exercise}\iffalse{-91-68-105-102-102-101-114-101-110-99-101-32-98-101-116-119-101-101-110-32-97-108-103-101-98-114-97-32-97-110-100-32-115-105-103-109-97-32-97-108-103-101-98-114-97-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-8"><strong>(\#exr:unnamed-chunk-8)  \iffalse (Difference between algebra and sigma algebra) \fi{} </strong></span>
<span style="color:red">TODO</span>
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}
<span style="color:red">TODO</span>
</div>\EndKnitrBlock{solution}



\BeginKnitrBlock{exercise}\iffalse{-91-73-110-116-114-111-32-116-111-32-109-101-97-115-117-114-101-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-10"><strong>(\#exr:unnamed-chunk-10)  \iffalse (Intro to measure) \fi{} </strong></span>
Take the measurable space $\Omega = \{1,2\}$, $F = 2^{\Omega}$. Which of the
following is a measure? Which is a probability measure?

- $\mu(\emptyset) = 0$, $\mu(\{1\}) = 5$, $\mu(\{2\}) = 6$, $\mu(\{1,2\}) = 11$
- $\mu(\emptyset) = 0$, $\mu(\{1\}) = 0$, $\mu(\{2\}) = 0$, $\mu(\{1,2\}) = 1$
- $\mu(\emptyset) = 0$, $\mu(\{1\}) = 0$, $\mu(\{2\}) = 0$, $\mu(\{1,2\}) = 0$
- $\mu(\emptyset) = 0$, $\mu(\{1\}) = 0$, $\mu(\{2\}) = 1$, $\mu(\{1,2\}) = 1$
- $\mu(\emptyset)=0$, $\mu(\{1\})=0$, $\mu(\{2\})=\infty$, $\mu(\{1,2\})=\infty$
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

  - Measure. Not probability measure since $\mu(\Omega) > 1$.
  - Neither due to countable additivity.
  - Measure. Not probability measure since $\mu(\Omega) = 0$.
  - Probability measure.
  - Measure. Not probability measure since $\mu(\Omega) > 1$.
</div>\EndKnitrBlock{solution}


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-12"><strong>(\#exr:unnamed-chunk-12) </strong></span>
Define a probability space that could be used to model a fair 6-sided die.
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

- $\Omega = \{1,2,3,4,5,6\}$
- $F = 2^{\Omega}$
- $\forall \omega \in \Omega$, $P(\omega) = \frac{1}{6}$
</div>\EndKnitrBlock{solution}

## Properties of probability measures

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-14"><strong>(\#exr:unnamed-chunk-14) </strong></span>
A standard deck (52 cards) is distributed to two persons: 26 cards to each
person. All partitions are equally likely. Find the probability that:
  
- The first person gets 4 Queens.
- The first person gets at least 2 Queens.
# - The first person gets at least 2 Queens and at least 2 Kings.
- <span style="color:blue"> R: Use simulation (sample) to check the above
answers. </span>
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

- $\frac{{48}\choose{22}}{{52}\choose{26}}$
- $1 - \frac{{48}\choose{26}}{{52}\choose{26}} - 
  4 \frac{{48}\choose{25}}{{52}\choose{26}}$
- For the simulation, let us represent cards with numbers from 1 to 52, and
let 1 through 4 represent Queens, and 5 through 8 represent Kings.
</div>\EndKnitrBlock{solution}

```r
set.seed(1)
cards <- 1:52
n     <- 10000
q4    <- vector(mode = "logical", length = n)
q2    <- vector(mode = "logical", length = n)
for (i in 1:n) {
  p1      <- sample(1:52, 26)
  q4[i]   <- sum(1:4 %in% p1) == 4
  q2[i]   <- sum(1:4 %in% p1) >= 2
}
sum(q4) / n
```

```
## [1] 0.0556
```

```r
sum(q2) / n
```

```
## [1] 0.6995
```


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-17"><strong>(\#exr:unnamed-chunk-17) </strong></span>Let $A$ and $B$ be events with probabilities $P(A) = \frac{5}{6}$ and
$P(B) = \frac{1}{4}$.

1. Show that $\frac{1}{12} \leq P(A\cap B) \leq \frac{1}{4}$,
and give examples to show that both extremes are possible.
2. Find corresponding bounds for $P(A\cup B)$.
3. R: Draw samples from the examples and estimate the probability of 
$P(A\cap B)$.
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}Smth


- From the properties of probability we have

\begin{equation}
  P(A \cup B) = P(A) + P(B) - P(A \cap B) \leq 1.
\end{equation}
  
From this follows
\begin{align}
  P(A \cap B) \geq P(A) + P(B) - 1
              = \frac{5}{6} + \frac{1}{4} - 1
              = \frac{1}{12}.
\end{align}
  
On the other hand
\begin{equation}
  P(A \cup B) = P(A) + P(B) - P(A \cap B) \geq 0.
\end{equation}
  
The maximum probability of the union can be 1, for example if we take a 12-sided
dice, and $A$ corresponds to throwing 1 through 10 and $B$ corresponds to
throwing 9 through 12. So

\begin{equation}
  P(A \cap B) = \frac{5}{6} + \frac{1}{4} - 1 = \frac{1}{12}.
\end{equation}
  
Therefore, the lower bound for the probability of intersection is 
$\frac{1}{12}$.
  
Conversely, the minimum probability of union can be $\frac{5}{6}$, so
  
\begin{equation}
  P(A \cap B) = \frac{5}{6} + \frac{1}{4} - \frac{5}{6} = \frac{1}{4}.
\end{equation}
  
Therefore, the upper bound for the probability of intersection is $\frac{1}{4}$.

- We use the ...
- We use _sample_ in R:
</div>\EndKnitrBlock{solution}

```r
a <- sample(1000, 1:6, replace = TRUE)
mean(a)
```

```
## [1] 437
```


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:Poispmf"><strong>(\#exr:Poispmf) </strong></span>Something with Poisson.
</div>\EndKnitrBlock{exercise}

This is \@ref(exr:Poispmf).
