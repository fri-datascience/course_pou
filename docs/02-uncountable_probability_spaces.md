# Uncountable probability spaces {#uprobspaces}

This chapter deals with uncountable probability spaces.

The students are expected to acquire the following knowledge:

**Theoretical**

- Understand Borel sets and identify them.
- Estimate Lebesgue measure for different sets.
- Know when sets are Borel-measurable.
- Understanding of countable and uncountable sets.

**R**

- uniform sampling
- recursion
- Cantor sets
- factors




## Borel sets
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-2"><strong>(\#exr:unnamed-chunk-2) </strong></span>

a. Prove that the intersection of two sigma algebras on $\Omega$ is a sigma 
algebra.

b. Prove that the collection of all open subsets $(a,b)$ on $(0,1]$ is not a 
sigma algebra of $(0,1]$.
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

a. 
Empty set:
\begin{equation}
  \emptyset \in \mathcal{A} \wedge \emptyset \in \mathcal{B} 
  \Rightarrow \emptyset \in \mathcal{A} \cap \mathcal{B} 
\end{equation}
Complement:
\begin{equation}
  \text{Let } A \in \mathcal{A} \cap \mathcal{B} \Rightarrow
  A \in \mathcal{A} \wedge A \in \mathcal{B} \Rightarrow
  A^c \in \mathcal{A} \wedge A^c \in \mathcal{B} \Rightarrow
  A^c \in \mathcal{A} \cap \mathcal{B}
\end{equation}
Countable additivity: Let $\{A_i\}$ be a countable sequence of subsets in 
$\mathcal{A} \cap \mathcal{B}$.
\begin{equation}
  \forall i: A_i \in \mathcal{A} \cap \mathcal{B} \Rightarrow 
  A_i \in \mathcal{A} \wedge A_i \in \mathcal{B} \Rightarrow
  \cup A_i \in \mathcal{A} \wedge  \cup A_i \in \mathcal{B} \Rightarrow
  \cup A_i \in \mathcal{A} \cap \mathcal{B}
\end{equation}


b. Let $A$ denote the collection of all open subsets $(a,b)$ on $(0,1]$. Then
$(0,1) \in A$. But $(0,1)^c = 1 \notin A$.


</div>\EndKnitrBlock{solution}

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-4"><strong>(\#exr:unnamed-chunk-4) </strong></span>Show that $\mathcal{C} = \sigma(\mathcal{C})$ if and only if $\mathcal{C}$ is
a sigma algebra.
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

"$\Rightarrow$" This follows from the definition of a generated sigma algebra.

"$\Leftarrow$" Let $\mathcal{F} = \cap_i F_i$ be the intersection of all
sigma algebras that contain $\mathcal{C}$. Then 
$\sigma(\mathcal{C}) = \mathcal{F}$. 
Additionally, $\forall i: \mathcal{C} \in F_i$. So each $F_i$ can be written
as $F_i = \mathcal{C} \cup D$, where $D$ are the rest of the elements in the 
sigma algebra. In other words, each sigma algebra in the collection contains
at least $\mathcal{C}$, but can contain other elements. Now for some $j$,
$F_j = \mathcal{C}$ as $\{F_i\}$ contains all sigma algebras that contain 
$\mathcal{C}$
and $\mathcal{C}$ is such a sigma algebra.
Since this is the smallest subset in the intersection it follows that
$\sigma(\mathcal{C}) = \mathcal{F} = \mathcal{C}$.
</div>\EndKnitrBlock{solution}


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-6"><strong>(\#exr:unnamed-chunk-6) </strong></span>Let $\mathcal{C}$ and $\mathcal{D}$ be two collections of subsets on $\Omega$ 
such that $\mathcal{C} \subset \mathcal{D}$. Prove that 
$\sigma(\mathcal{C}) \subset \sigma(\mathcal{D})$.
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}
$\sigma(\mathcal{D})$ is a sigma algebra that contains $\mathcal{D}$. It 
follows that $\sigma(\mathcal{D})$ is a sigma algebra that contains 
$\mathcal{C}$. Let us write $\sigma(\mathcal{C}) = \cap_i F_i$, where $\{F_i\}$ 
is the collection of all sigma algebras that contain $\mathcal{C}$. Since 
$\sigma(\mathcal{D})$ is such a sigma algebra, there exists an index $j$, 
so that $F_j = \sigma(\mathcal{D})$. Then we can write

\begin{align}
  \sigma(\mathcal{C}) &= (\cap_{i \neq j} F_i) \cap \sigma(\mathcal{D}) \\
                      &\subset \sigma(\mathcal{D}).
\end{align}
  
  </div>\EndKnitrBlock{solution}

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-8"><strong>(\#exr:unnamed-chunk-8) </strong></span>
<span style="color:blue">R: Simulate from the 2nd, 3rd, and 4th Cantor sets and 
plot results in a meaningful way.</span>
</div>\EndKnitrBlock{exercise}

```r
set.seed(1)
nsamps <- 100
cantor_n <- function (n) {
  if (n <= 0) {
    return (c(0, 1))
  }
  cantor_prev <- cantor_n(n - 1)
  return (c(cantor_prev / 3, 2/3 + cantor_prev / 3))
}

sample_cantor <- function (n, nsamps) {
  samps <- vector(mode = "numeric", length = nsamps)
  cant  <- cantor_n(n)
  mat   <- matrix(cant, ncol = 2, byrow = TRUE)
  for(i in 1:nsamps) {
    ind      <- sample(1:nrow(mat), 1)
    bounds   <- mat[ind, ]
    samps[i] <- runif(1, min = bounds[1], max = bounds[2])
  }
  return(samps)
}

depth_2     <- sample_cantor(2, nsamps)
depth_3     <- sample_cantor(3, nsamps)
depth_4     <- sample_cantor(4, nsamps)
plot_data   <- data.frame(samps = c(depth_2, depth_3, depth_4), 
                          depth = c(rep(2, nsamps), rep(3, nsamps), 
                                    rep(4, nsamps)))
cantor_plot <- ggplot(data = plot_data, aes(x = samps)) +
  geom_linerange(aes(ymin = 0, ymax = depth, col = factor(depth))) +
  ylab("depth")
plot(cantor_plot)
```

<img src="02-uncountable_probability_spaces_files/figure-html/unnamed-chunk-9-1.png" width="672" />
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-10"><strong>(\#exr:unnamed-chunk-10) </strong></span>

Prove that the following subsets of $(0,1]$ are Borel-measurable.

a. Any countable set.

b. The set of numbers in (0,1] whose decimal expansion does not contain 7.

</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

a. This follows directly from the fact that every countable set is a union
of singletons, whose measure is 0.
  
b. Let us first look at numbers which have a 7 as the first decimal numbers.
Their measure is 0.1. Then we take all the numbers with a 7 as the second
decimal number (excluding those who already have it as the first). These have
the measure 0.01, and there are 9 of them, so their total measure is 0.09. We
can continue to do so infinitely many times. At each $n$, we have the measure
of the intervals which is $10^n$ and the number of those intervals is $9^{n-1}$.
Now

\begin{align}
  \lambda(A) &= 1 - \sum_{n = 0}^{\infty} \frac{9^n}{10^{n+1}} \\
             &= 1 - \frac{1}{10} \sum_{n = 0}^{\infty} (\frac{9}{10})^n \\
             &= 1 - \frac{1}{10} \frac{10}{1} \\
             &= 0.
\end{align}

Since we have shown that the measure of the set is $0$, we have also shown
that the set is measurable.
  </div>\EndKnitrBlock{solution}


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-12"><strong>(\#exr:unnamed-chunk-12) </strong></span>Let $\Omega = [0,1]$, and let $\mathcal{F}_3$ consist of all countable subsets
of $\Omega$, and all subsets of $\Omega$ having a countable complement. 

a. Show
that $\mathcal{F}_3$ is a sigma algebra. 

b. Let us define $P(A)=0$ if $A$ is
countable, and $P(A) = 1$ if $A$ has
a countable complement. Is $(\Omega, \mathcal{F}_3, P)$ a legitimate
probability space?
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

a. The empty set is countable, therefore it is in $\mathcal{F}_3$. For any
$A \in \mathcal{F}_3$. If $A$ is countable, then $A^c$ has a countable
complement and is in $\mathcal{F}_3$. If $A$ is uncountable, then it has a
countable complement $A^c$ which is therefore also in $\mathcal{F}_3$. We
are left with showing countable additivity.
  <br> Let $\{A_i\}$ be an arbitrary collection of sets in $\mathcal{F}_3$. 
We will look at two possibilities. First let all $A_i$ be countable. 
A countable union
of countable sets is countable, and therefore in $\mathcal{F}_3$. Second,
let at least one $A_i$ be uncountable. It follows that it has a countable
complement. We can write
\begin{equation}
  (\cup_{i=1}^{\infty} A_i)^c = \cap_{i=1}^{\infty} A_i^c.
\end{equation}
Since at least one $A_i^c$ on the right side is countable, the whole intersection
is countable, and therefore the union has a countable complement. It follows
that the union is in $\mathcal{F}_3$.

b. The tuple $(\Omega, \mathcal{F}_3)$ is a measurable space. Therefore, we only
need to check whether $P$ is a probability measure. The measure of the empty
set is zero as it is countable. We have to check for countable additivity.
Let us look at three situations. Let $A_i$ be disjoint sets. First, let
all $A_i$ be countable. 
\begin{equation}
  P(\cup_{i=1}^{\infty} A_i) = \sum_{i=1}^{\infty}P( A_i)) = 0.
\end{equation}
Since the union is countable, the above equation holds. Second, let exactly 
one $A_i$ be uncountable. W.L.O.G. let that be $A_1$. Then
\begin{equation}
  P(\cup_{i=1}^{\infty} A_i) = 1 + \sum_{i=2}^{\infty}P( A_i)) = 1.
\end{equation}
Since the union is uncountable, the above equation holds. Third, let at least
two $A_i$ be uncountable. We have to check whether it is possible for two
uncountable sets in $\mathcal{F}_3$ to be disjoint. If that is possible, then
their measures would sum to more than one and $P$ would not be a probability
measure. W.L.O.G. let $A_1$ and $A_2$ be uncountable. Then we have
\begin{equation}
  A_1 \cap A_2 = (A_1^c \cup A_2^c)^c.
\end{equation}
Now $A_1^c$ and $A_2^c$ are countable and their union is therefore countable.
Let $B = A_1^c \cup A_2^c$. So the intersection of $A_1$ and $A_2$ equals
the complement of $B$, which is countable. For the intersection to be the
empty set, $B$ would have to equal to $\Omega$. But $\Omega$ is uncountable and
therefore $B$ can not equal to $\Omega$. It follows that two uncountable sets
in $\mathcal{F}_3$ can not have an empty intersection. Therefore the tuple
is a legitimate probability space.
  </div>\EndKnitrBlock{solution}



## Lebesgue measure

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-14"><strong>(\#exr:unnamed-chunk-14) </strong></span>Show that the Lebesgue measure of rational numbers on $[0,1]$ is 0. 
<span style="color:blue">R: Implement a random number generator, which
generates uniform samples of irrational numbers in $[0,1]$ by uniformly sampling
from $[0,1]$ and rejecting a sample if it is rational.</span>
</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}

There are a countable number of rational numbers. Therefore, we can write
\begin{align}
  \lambda(\mathbb{Q}) &= \lambda(\cup_{i = 1}^{\infty} q_i) &\\
                      &= \sum_{i = 1}^{\infty} \lambda(q_i) &\text{ (countable additivity)} \\
                      &= \sum_{i = 1}^{\infty} 0  &\text{ (Lebesgue measure of a singleton)} \\
                      &= 0.
\end{align}
</div>\EndKnitrBlock{solution}




\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-16"><strong>(\#exr:unnamed-chunk-16) </strong></span>

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


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-18"><strong>(\#exr:unnamed-chunk-18) </strong></span>
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
  
b. No, we could for example rearrange the order in which the intervals are 
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

