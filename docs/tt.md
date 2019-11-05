# Uncountable probability spaces {#uprobspaces2}

This chapter deals with uncountable probability spaces.

The students are expected to acquire the following knowledge:

**Theoretical**

- Understand Borel sets and identify them.
- Estimate Lebesgue measure for different sets.
- Know when sets are Borel-measurable.
- Understanding of countable and uncountable sets.

**R**

- Uniform sampling.





## Borel sets

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-2"><strong>(\#exr:unnamed-chunk-2) </strong></span>
a. Prove that the intersection of two sigma algebras on $\Omega$ is a sigma 
algebra.

b. Prove that the collection of all open subsets $(a,b)$ on $(0,1]$ is not a 
sigma algebra of $(0,1]$.
</div>\EndKnitrBlock{exercise}


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-4"><strong>(\#exr:unnamed-chunk-4) </strong></span>Show that $\mathcal{C} = \sigma(\mathcal{C})$ if and only if $\mathcal{C}$ is
a sigma algebra.
</div>\EndKnitrBlock{exercise}



\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-6"><strong>(\#exr:unnamed-chunk-6) </strong></span>Let $\mathcal{C}$ and $\mathcal{D}$ be two collections of subsets on $\Omega$
such that $\mathcal{C} \subset \mathcal{D}$. Prove that
$\sigma(\mathcal{C}) \subset \sigma(\mathcal{D})$.
</div>\EndKnitrBlock{exercise}


<!-- ```{exercise} -->

<!-- <span style="color:blue">R: Simulate from the 2nd, 3rd, and 4th Cantor sets and -->
<!-- plot results in a meaningful way.</span> -->

<!-- ``` -->
<!-- ```{r, echo = togs} -->
<!-- set.seed(1) -->
<!-- nsamps <- 100 -->
<!-- cantor_n <- function (n) { -->
<!--   if (n <= 0) { -->
<!--     return (c(0, 1)) -->
<!--   } -->
<!--   cantor_prev <- cantor_n(n - 1) -->
<!--   return (c(cantor_prev / 3, 2/3 + cantor_prev / 3)) -->
<!-- } -->

<!-- sample_cantor <- function (n, nsamps) { -->
<!--   samps <- vector(mode = "numeric", length = nsamps) -->
<!--   cant  <- cantor_n(n) -->
<!--   mat   <- matrix(cant, ncol = 2, byrow = TRUE) -->
<!--   for(i in 1:nsamps) { -->
<!--     ind      <- sample(1:nrow(mat), 1) -->
<!--     bounds   <- mat[ind, ] -->
<!--     samps[i] <- runif(1, min = bounds[1], max = bounds[2]) -->
<!--   } -->
<!--   return(samps) -->
<!-- } -->

<!-- depth_2     <- sample_cantor(2, nsamps) -->
<!-- depth_3     <- sample_cantor(3, nsamps) -->
<!-- depth_4     <- sample_cantor(4, nsamps) -->
<!-- plot_data   <- data.frame(samps = c(depth_2, depth_3, depth_4), -->
<!--                           depth = c(rep(2, nsamps), rep(3, nsamps), -->
<!--                                     rep(4, nsamps))) -->
<!-- cantor_plot <- ggplot(data = plot_data, aes(x = samps)) + -->
<!--   geom_linerange(aes(ymin = 0, ymax = depth, col = factor(depth))) + -->
<!--   ylab("depth") -->
<!-- plot(cantor_plot) -->


<!-- ``` -->
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-8"><strong>(\#exr:unnamed-chunk-8) </strong></span>Prove that the following subsets of $(0,1]$ are Borel-measurable.

a. Any countable set.

b. The set of numbers in (0,1] whose decimal expansion does not contain 7.

</div>\EndKnitrBlock{exercise}



\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-10"><strong>(\#exr:unnamed-chunk-10) </strong></span>Let $\Omega = [0,1]$, and let $\mathcal{F}_3$ consist of all countable subsets
of $\Omega$, and all subsets of $\Omega$ having a countable complement.

a. Show
that $\mathcal{F}_3$ is a sigma algebra.

b. Let us define $P(A)=0$ if $A$ is
countable, and $P(A) = 1$ if $A$ has
a countable complement. Is $(\Omega, \mathcal{F}_3, P)$ a legitimate
probability space?
</div>\EndKnitrBlock{exercise}




## Lebesgue measure

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-12"><strong>(\#exr:unnamed-chunk-12) </strong></span>Show that the Lebesgue measure of rational numbers on $[0,1]$ is 0.
<span style="color:blue">R: Implement a random number generator, which
generates uniform samples of irrational numbers in $[0,1]$ by uniformly sampling
from $[0,1]$ and rejecting a sample if it is rational.</span>
</div>\EndKnitrBlock{exercise}





\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-14"><strong>(\#exr:unnamed-chunk-14) </strong></span>

a. Prove that the Lebesgue measure of $\mathbb{R}$ is infinity.

b. _Paradox_. Show that the cardinality of $\mathbb{R}$ and $(0,1)$ is the same,
while their Lebesgue measures are infinity and one respectably.

</div>\EndKnitrBlock{exercise}



\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-16"><strong>(\#exr:unnamed-chunk-16) </strong></span>
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




