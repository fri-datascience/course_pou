# Conditional probability {#condprob}

This chapter deals with conditional probability.

The students are expected to acquire the following knowledge:

**Theoretical**

- identify whether variables are independent
- calculation of conditional probabilities

**R**

- simulating conditional variables



```
## Warning: package 'ggplot2' was built under R version 3.5.1
```


\BeginKnitrBlock{exercise}\iffalse{-91-77-111-110-116-121-32-72-97-108-108-32-112-114-111-98-108-101-109-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-2"><strong>(\#exr:unnamed-chunk-2)  \iffalse (Monty Hall problem) \fi{} </strong></span>Describe Monty Hall problem.

</div>\EndKnitrBlock{exercise}
\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}a
</div>\EndKnitrBlock{solution}


```r
set.seed(1)
nsamps <- 1000
ifchange <- vector(mode = "logical", length = nsamps)
ifstay   <- vector(mode = "logical", length = nsamps)
for (i in 1:nsamps) {
  where_car      <- sample(c(1:3), 1)
  where_player   <- sample(c(1:3), 1)
  open_samp      <- (1:3)[where_car != (1:3) & where_player != (1:3)]
  if (length(open_samp) == 1) {
    where_open <- open_samp
  } else {
      where_open <- sample(open_samp, 1)
  }
  ifstay[i]      <- where_car == where_player
  where_ifchange <- (1:3)[where_open != (1:3) & where_player != (1:3)]
  ifchange[i]    <- where_ifchange == where_car
}
sum(ifstay) / nsamps
```

```
## [1] 0.333
```

```r
sum(ifchange) / nsamps
```

```
## [1] 0.667
```
