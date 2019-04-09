# R programming language

## Basic characteristics


## Why R?


## Setting up


### R Studio


### Libraries for data science
* dplyr
* ggplot2

## R basics

### Variables and types
Important information and tips:
* no type declaration
* define variables with `<-` instead of `=` (although both work, there is
a slight difference, additionally most of the packages use the arrow)
* for strings use `""`
* for comments use `#`
* change types with `as.type()` functions
* no special type for single character like C++ for example



```r
n            <- 20
x            <- 2.7
m            <- n # m gets value 20
my_flag      <- TRUE
student_name <- "Luka"
typeof(n)
```

```
## [1] "double"
```

```r
typeof(student_name)
```

```
## [1] "character"
```

```r
typeof(my_flag)
```

```
## [1] "logical"
```

```r
typeof(as.integer(n))
```

```
## [1] "integer"
```

```r
typeof(as.character(n))
```

```
## [1] "character"
```


### Vectors

### Factors

### Matrices

### Arrays

### Data frames

### List


## Other tips I wish I knew sooner

### Dynamically setting working directory
To dynamically set the working directory to the parent folder of a R script
we can use


```r
setwd(dirname(rstudioapi::getSourceEditorContext()$path))
```

```
## Error: RStudio not running
```

### Apply functions
To avoid slow R loops, you can sometimes use one of the apply functions,
which decrease the execution time considerably.


### Dplyr and ggplot
Dplyr can make your data manipulation (and therefore your life) a whole lot 
easier. Instead of several nested for loops or complex apply structures, 
dpylr can do useful data
filtering, transformation, grouping, summarization,... in a matter of
only a few lines.

ggplot ...


## Further reading and references
* Cheatsheets: https://www.rstudio.com/resources/cheatsheets/
* Our literature on R, dplyr, ggplot2, and R Markdown workshop: https://github.com/bstatcomp/Rworkshop

## Learning outcomes

## Practice problems
