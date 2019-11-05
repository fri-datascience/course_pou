# Multiple random variables {#mrvs}

This chapter deals with multiple random variables and their distributions.

The students are expected to acquire the following knowledge:

**Theoretical**

- Find CDF and PDF of multiple random variables.
- Find CDF and PDF of transformed multiple random variables.
- Find conditional and marginal distributions of multiple random variables.

**R**

- Scatterplots of bivariate random variables.
- New R functions (for example, _expand.grid_).



<style>
.fold-btn { 
  float: right; 
  margin: 5px 5px 0 0;
}
.fold { 
  border: 1px solid black;
  min-height: 40px;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
  $folds = $(".fold");
  $folds.wrapInner("<div class=\"fold-blck\">"); // wrap a div container around content
  $folds.prepend("<button class=\"fold-btn\">Unfold</button>");  // add a button
  $(".fold-blck").toggle();  // fold all blocks
  $(".fold-btn").on("click", function() {  // add onClick event
    $(this).text($(this).text() === "Fold" ? "Unfold" : "Fold");  // if the text equals "Fold", change it to "Unfold"or else to "Fold" 
    $(this).next(".fold-blck").toggle("linear");  // "swing" is the default easing function. This can be further customized in its speed or the overall animation itself.
  })
});
</script>




## General
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-2"><strong>(\#exr:unnamed-chunk-2) </strong></span><span style="color:blue">Let $X \sim \text{N}(0,1)$ and $Y \sim \text{N}(0,1)$ 
be independent random
variables. Draw 1000 samples from $(X,Y)$ and plot a scatterplot.
Now let $X \sim \text{N}(0,1)$ and $Y | X = x \sim \text{N}(ax, 1)$. Draw 1000 samples
from $(X,Y)$ for $a = 1$, $a=0$, and $a=-0.5$. Plot the scatterplots.
How would you interpret parameter $a$?
Plot the marginal distribution of $Y$ for cases $a=1$, $a=0$, and $a=-0.5$.
Can you guess which distribution it is?</span>

</div>\EndKnitrBlock{exercise}

