# Introduction {#introduction}

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
- The first person gets at least 2 Queens and at least 2 Kings.
- <span style="color:blue"> R: Use simulation (_sample_) to check the above
answers. </span>
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

- $\frac{{48}\choose{22}}{{52}\choose{26}}$
- For the simulation, let us represent cards with numbers from 1 to 52, and
let 1 through 4 represent Queens, and 5 through 8 represent Kings.
</div>\EndKnitrBlock{solution}

```r
set.seed(1)
cards <- 1:52
n     <- 10000
q4    <- vector(mode = "logical", length = n)
q2    <- vector(mode = "logical", length = n)
q2k2  <- vector(mode = "logical", length = n)
for (i in 1:n) {
  p1      <- sample(1:52, 26)
  q4[i]   <- sum(1:4 %in% p1) == 4
  q2[i]   <- sum(1:4 %in% p1) >= 2
  q2k2[i] <- (sum(1:4 %in% p1) >= 2) & (sum(5:8 %in% p1) >= 2)
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

```r
sum(q2k2) / n
```

```
## [1] 0.4711
```


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-17"><strong>(\#exr:unnamed-chunk-17) </strong></span>Let $A$ and $B$ be events with probabilities $P(A) = \frac{2}{3}$ and
$P(B) = \frac{1}{2}$.

1. Show that $\frac{1}{6} \leq P(A\cap B) \leq \frac{1}{2}$,
and give examples to show that both extremes are possible.
2. Find corresponding bounds for $P(A\cup B)$.
3. R: Draw samples from the examples and show the probability bounds of 
$P(A \cap B)$.
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}Smth


- From the properties of probability we have

\begin{equation}
  P(A \cup B) = P(A) + P(B) - P(A \cap B) \leq 1.
\end{equation}
  
From this follows

\begin{align}
  P(A \cap B) &\geq P(A) + P(B) -  1 \\
              &= \frac{2}{3} + \frac{1}{2} - 1 \\
              &= \frac{1}{6},
\end{align}
  
which is the lower bound for the intersection. Conversely, we have

\begin{equation}
  P(A \cup B) = P(A) + P(B) - P(A \cap B) \geq P(A).
\end{equation}
  
From this follows

\begin{align}
  P(A \cap B) &\leq P(B) \\
              &= \frac{1}{2},
\end{align}
  
which is the upper bound for the intersection.

For an example take a fair die. To achieve the lower bound let $A = \{1,2,3\}$
and $B = \{3,4,5,6\}$, then their intersection is $A \cap B = \{3\}$. To
achieve the upper bound take $A = \{1,2,3\}$ and $B = \{1,2,3,4\}$.


- For the bounds of the union we will use the results from the first part. 
Again from the properties of probability we have

\begin{align}
  P(A \cup B) &= P(A) + P(B) - P(A \cap B) \\
              &\geq P(A) + P(B) - \frac{1}{2} \\
              &= \frac{2}{3}.
\end{align}
  
Conversely

\begin{align}
  P(A \cup B) &= P(A) + P(B) - P(A \cap B) \\
              &\leq P(A) + P(B) - \frac{1}{6} \\
              &= 1.
\end{align}
  
Therefore $\frac{2}{3} \leq P(A \cup B) \leq 1$.


- We use _sample_ in R:
</div>\EndKnitrBlock{solution}

```r
set.seed(1)
n      <- 10000
samps  <- sample(1:6, n, replace = TRUE)

# lower bound
lb     <- vector(mode = "logical", length = n)
A      <- c(1,2,3)
B      <- c(3,4,5,6)
for (i in 1:n) {
  lb[i] <- samps[i] %in% A & samps[i] %in% B
}
sum(lb) / n
```

```
## [1] 0.1724
```

```r
# upper bound
ub     <- vector(mode = "logical", length = n)
A      <- c(1,2,3)
B      <- c(1,2,3,4)
for (i in 1:n) {
  ub[i] <- samps[i] %in% A & samps[i] %in% B
}
sum(ub) / n
```

```
## [1] 0.5047
```

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-20"><strong>(\#exr:unnamed-chunk-20) </strong></span>A fair coin is tossed repeatedly. Show that, with probability one, a head turns
up soonder or later. Show similarly that any given finite sequence of heads and
tails occurs eventually with probability one.</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}\begin{align}
P(\text{no heads}) &= \lim_{n \rightarrow \infty} P(\text{no heads in first }n 
                                 \text{ tosses}) \\
                   &= \lim_{n \rightarrow \infty} 2^{-n} \\
                   &= 0.
\end{align}

P(\text{no heads}) = \lim_{n} P(\text{no heads in first }n 
                                 \text{tosses})
<span style="color:red">TODO: Second part</span>
</div>\EndKnitrBlock{solution}


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-22"><strong>(\#exr:unnamed-chunk-22) </strong></span>

An Erdos-Renyi random graph $G(n,p)$ is a model with n nodes, where
each pair of nodes is connected with probability $p$.


- Calculate the probability that there exists a node that is not
connected to any other node in $G(4,0.6)$.
- Show that the upper bound for the probability that there exist 2 nodes that are not connected to any other node for an arbitrary $G(n,p)$ is $\binom{n}{2} (1-p)^{2n - 3}$.
- <span style="color:blue">R: Estimate the probability from the first point using simulation.</span>
  
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

- Let $A_i$ be the event that the $i$-th node is not connected to
any other node. Then our goal is to calculate $P(\cup_{i=1}^n A_i)$.
Using the inclusion-exclusion principle, we get

\begin{align}
  P(\cup_{i=1}^n A_i) &= \sum_i A_i - \sum_{i<j} P(A_i \cap A_j) +
    \sum_{i<j<k} P(A_i \cap A_j \cap A_k) - P(A_1 \cap A_2 \cap A_3 \cap A_4) \\
                      &=4 (1 - p)^3 - \binom{4}{2} (1 - p)^5 +
                        \binom{4}{3} (1 - p)^6 - (1 - p)^6 \\
                      &\approx 0.21.
\end{align}
  
- Let $A_{ij}$ be the event that nodes $i$ and $j$ are not connected to any other node. We are interested in $P(\cup_{i<j}A_{ij})$. By using Boole`s inequality, we get

\begin{align}
P(\cup_{i<j}A_{ij}) \leq \sum_{i<j} P(A_{ij}).
\end{align}

What is the probability of $A_{ij}$? There need to be no connections to the $i$-th node to the remaining nodes (excluding $j$), the same for the $j$-th node, and there can be no connection between them. Therefore

\begin{align}
P(\cup_{i<j}A_{ij}) &\leq \sum_{i<j} (1 - p)^{2(n-2) + 1} \\
                    &= \binom{n}{2} (1 - p)^{2n - 3}.
\end{align}

</div>\EndKnitrBlock{solution}

```r
set.seed(1)
n_samp <- 100000
n      <- 4
p      <- 0.6
conn_samp <- vector(mode = "logical", length = n_samp)
for (i in 1:n_samp) {
  tmp_mat                     <- matrix(data = 0, nrow = n, ncol = n)
  samp_conn                   <- sample(c(0,1), 
                                        choose(4,2), 
                                        replace = TRUE, 
                                        prob    = c(1 - p, p))
  tmp_mat[lower.tri(tmp_mat)] <- samp_conn
  tmp_mat[upper.tri(tmp_mat)] <- t(tmp_mat)[upper.tri(t(tmp_mat))]
  not_conn                    <- apply(tmp_mat, 1, sum)
  if (any(not_conn == 0)) {
    conn_samp[i] <- TRUE
  } else {
    conn_samp[i] <- FALSE
  }
}
sum(conn_samp) / n_samp
```

```
## [1] 0.20565
```


## Discrete probability spaces
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:binomialpmf"><strong>(\#exr:binomialpmf) </strong></span>Show that the standard measurable space on $\Omega = \{0,1,...,n\} equipped with binomial measure is a discrete probability space.

- Define another probability measure on this measurable space.
- Show that for $n=1$ the binomial measure is the same as the bernoulli measure.
- <span style="color:blue">R: Draw 1000 samples from the binomial distribution $p=0.5$, $n=20$ (_rbinom_) and compare relative frequencies with theoretical probabiliy measure</span>.
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}\sum_{k=0}^n \binom{n}{k} p^k (1 - p)^{n - k}$
</div>\EndKnitrBlock{solution}

```r
bin_samp <- rbinom(n = 1000, size = 20, prob = 0.5)
```


