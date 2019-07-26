# Integration {#integ}

This chapter deals with abstract and Monte Carlo integration.

The students are expected to acquire the following knowledge:

**Theoretical**

- How to calculate Lebesgue integrals for non-simple functions.

**R**

- Monte Carlo integration.



## Monte Carlo integration
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-2"><strong>(\#exr:unnamed-chunk-2) </strong></span><span style="color:blue">Let $X \sim \text{Gamma}(3,2)$ and $Y = \log(X)$. Use Monte Carlo integration to estimate the probability $P(-1 \leq Y  \leq 1). Can you find the exact value?</span></div>\EndKnitrBlock{exercise}

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

