# Probability spaces {#introduction}

This chapter deals with measures and probability spaces. At the end of
the chapter, we look more closely at discrete probability spaces.

The students are expected to acquire the following knowledge:

**Theoretical**

- Use properties of probability to calculate probabilities.
- Combinatorics.
- Understanding of continuity of probability.


**R**

- Vectors and vector operations.
- For loop.
- Estimating probability with simulation.
- *sample* function.
- Matrices and matrix operations.




## Measure and probability spaces
\BeginKnitrBlock{exercise}\iffalse{-91-67-111-109-112-108-101-116-105-110-103-32-97-32-115-101-116-32-116-111-32-97-32-115-105-103-109-97-32-97-108-103-101-98-114-97-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-2"><strong>(\#exr:unnamed-chunk-2)  \iffalse (Completing a set to a sigma algebra) \fi{} </strong></span>Let $\Omega = \{1,2,...,10\}$ and let $A = \{\emptyset, \{1\}, \{2\}, \Omega \}$.

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
- Find the largest sigma algebra of $\Omega$.
</div>\EndKnitrBlock{exercise}



\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-6"><strong>(\#exr:unnamed-chunk-6) </strong></span>Find all sigma algebras for $\Omega = \{0, 1, 2\}$.
</div>\EndKnitrBlock{exercise}



\BeginKnitrBlock{exercise}\iffalse{-91-68-105-102-102-101-114-101-110-99-101-32-98-101-116-119-101-101-110-32-97-108-103-101-98-114-97-32-97-110-100-32-115-105-103-109-97-32-97-108-103-101-98-114-97-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-8"><strong>(\#exr:unnamed-chunk-8)  \iffalse (Difference between algebra and sigma algebra) \fi{} </strong></span>
Let $\Omega = \mathbb{N}$ and $\mathcal{A} = \{A \subseteq \mathbb{N}: 
A \text{ is finite or } A^c \text{ is finite.} \}$. Show that 
$\mathcal{A}$ is an algebra but not a sigma algebra.

</div>\EndKnitrBlock{exercise}




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


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-12"><strong>(\#exr:unnamed-chunk-12) </strong></span>Define a probability space that could be used to model the outcome of throwing two fair 6-sided dice.
</div>\EndKnitrBlock{exercise}


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




\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-17"><strong>(\#exr:unnamed-chunk-17) </strong></span>Let $A$ and $B$ be events with probabilities $P(A) = \frac{2}{3}$ and
$P(B) = \frac{1}{2}$.

- Show that $\frac{1}{6} \leq P(A\cap B) \leq \frac{1}{2}$,
and give examples to show that both extremes are possible.
- Find corresponding bounds for $P(A\cup B)$.
- <span style="color:blue"> R: Draw samples from the examples and show the probability bounds of 
$P(A \cap B)$ </span>.
</div>\EndKnitrBlock{exercise}



\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-20"><strong>(\#exr:unnamed-chunk-20) </strong></span>A fair coin is tossed repeatedly. 

- Show that, with probability one, a head turns up sooner or later. 

- Show similarly that any given finite sequence of heads and
tails occurs eventually with probability one.</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}\begin{align}
P(\text{no heads}) &= \lim_{n \rightarrow \infty} P(\text{no heads in first }n 
                                 \text{ tosses}) \\
                   &= \lim_{n \rightarrow \infty} \frac{1}{2^n} \\
                   &= 0.
\end{align}

For the second part, let us fix the given sequence of heads and tails of length 
$k$ as $s$. A probability that this happens in $k$ tosses is $\frac{1}{2^k}$.

\begin{align}
P(s \text{ occurs}) &= \lim_{n \rightarrow \infty} P(s \text{ occurs in first } 
                                                     nk \text{ tosses})
\end{align}

The right part of the upper equation is greater than if $s$ occurs either in the
first $k$ tosses, second $k$ tosses,..., $n$-th $k$ tosses. Therefore

\begin{align}
P(s \text{ occurs}) &\geq \lim_{n \rightarrow \infty} 
                  P(s \text{ occurs in first } n \text{ disjoint sequences of length } k) \\
                  &= \lim_{n \rightarrow \infty} 
                  (1 - P(s \text{ does not occur in first } n \text{ disjoint sequences})) \\
                  &= 1 -  \lim_{n \rightarrow \infty} P(s \text{ does not occur in first } n \text{ disjoint sequences}) \\
                  &= 1 - \lim_{n \rightarrow \infty} (1 - \frac{1}{2^k})^n \\ 
                  &= 1.
\end{align}
</div>\EndKnitrBlock{solution}


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-22"><strong>(\#exr:unnamed-chunk-22) </strong></span>An Erdos-Renyi random graph $G(n,p)$ is a model with $n$ nodes, where
each pair of nodes is connected with probability $p$.


- Calculate the probability that there exists a node that is not
connected to any other node in $G(4,0.6)$.
- Show that the upper bound for the probability that there exist 2 nodes that are not connected to any other node for an arbitrary $G(n,p)$ is $\binom{n}{2} (1-p)^{2n - 3}$.
- <span style="color:blue">R: Estimate the probability from the first point using simulation.</span>
  
</div>\EndKnitrBlock{exercise}




## Discrete probability spaces
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:binomialpmf"><strong>(\#exr:binomialpmf) </strong></span>Show that the standard measurable space on $\Omega = \{0,1,...,n\}$ equipped with binomial measure is a discrete probability space.

- Define another probability measure on this measurable space.
- Show that for $n=1$ the binomial measure is the same as the Bernoulli measure.
- <span style="color:blue">R: Draw 1000 samples from the binomial distribution $p=0.5$, $n=20$ (_rbinom_) and compare relative frequencies with theoretical probability measure</span>.
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}We need to show that the terms of 
$\sum_{k=0}^n \binom{n}{k} p^k (1 - p)^{n - k}$ sum to 1. For that we use the
binomial theorem $\sum_{k=0}^n \binom{n}{k} x^k y^{n-k} = (x + y)^n$. So

\begin{equation}
  \sum_{k=0}^n \binom{n}{k} p^k (1 - p)^{n - k} = (p + 1 - p)^n = 1.
\end{equation}

- $P(\{k\}) = \frac{1}{n + 1}$.
- When $n=1$ then $k \in \{0,1\}$. Inserting $n=1$ into the binomial measure, 
we get $\binom{1}{k}p^k (1-p)^{1 - k}$. Now 
$\binom{1}{1} = \binom{1}{0} = 1$, so the measure is $p^k (1-p)^{1 - k}$, 
which is the Bernoulli measure.
</div>\EndKnitrBlock{solution}

```r
set.seed(1)
library(ggplot2)
library(dplyr)
bin_samp <- rbinom(n = 1000, size = 20, prob = 0.5)
bin_samp <- data.frame(x = bin_samp) %>%
  count(x) %>%
  mutate(n = n / 1000, type = "empirical_frequencies") %>%
  bind_rows(data.frame(x = 0:20, n = dbinom(0:20, size = 20, prob = 0.5), type = "theoretical_measure"))

bin_plot <- ggplot(data = bin_samp, aes(x = x, y = n, fill = type)) +
  geom_bar(stat="identity", position = "dodge")
plot(bin_plot)
```

<img src="01-Introduction_files/figure-html/unnamed-chunk-26-1.png" width="672" />


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:geopoispmf"><strong>(\#exr:geopoispmf) </strong></span>Show that the standard measurable space on $\Omega = \{0,1,...,\infty\}$
  
   
- equipped with geometric measure is a discrete probability space,
- equipped with Poisson measure is a discrete probability space.
- Define another probability measure on this measurable space.
- <span style="color:blue">R: Draw 1000 samples from the Poisson distribution $\lambda = 10$ (_rpois_) and compare relative frequencies with theoretical probability measure</span>.
</div>\EndKnitrBlock{exercise}




\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-29"><strong>(\#exr:unnamed-chunk-29) </strong></span>Define a probability measure on $(\Omega = \mathbb{Z}, 2^{\mathbb{Z}})$.

- Define a probability measure such that $P(\omega) > 0, \forall \omega \in \Omega$.
- <span style="color:blue">R: Implement a random generator that will generate 
samples with the relative frequency that corresponds to your probability
measure. Compare relative frequencies with theoretical probability 
measure </span>.
</div>\EndKnitrBlock{exercise}



\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-32"><strong>(\#exr:unnamed-chunk-32) </strong></span>Define a probability measure on $\Omega = \{1,2,3,4,5,6\}$ with parameter $m 
\in \{1,2,3,4,5,6\}$, so that the probability of outcome at distance $1$ from
$m$ is half of the probability at distance $0$, at distance $2$ is half of
the probability at distance $1$, etc. <span style="color:blue">R: 
Implement a random generator that will generate 
samples with the relative frequency that corresponds to your probability
measure. Compare relative frequencies with theoretical probability 
measure </span>. 
</div>\EndKnitrBlock{exercise}



