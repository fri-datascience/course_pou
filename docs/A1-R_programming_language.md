# R programming language

## Basic characteristics
R is free software for statistical computing and graphics. It is widely used by statisticians, scientists, and other professionals for software development and data analysis. It is an interpreted language and therefore the programs do not need compilation. 

## Why R?
R is one of the main two languages used for statistics and machine learning (the other being Python).

**Pros**

* **Libraries.** Comprehensive collection of statistical and machine learning packages.
* Easy to code.
* **Open source.** Anyone can access R and develop new methods. Additionally, it is relatively simple to get source code of established methods.
* **Large community.** The use of R has been rising for some time, in industry and academia. Therefore a large collection of blogs and tutorials exists, along with people offering help on pages like StackExchange and CrossValidated.
* Integration with other languages and LaTeX.
* **New methods.** Many researchers develop R packages based on their research, therefore new methods are available soon after development.


**Cons**

* **Slow.** Programs run slower than in other programming languages, however this can be somewhat ammended by effective coding or integration with other languages.
* **Memory intensive.** This can become a problem with large data sets, as they need to be stored in the memory, along with all the information the models produce.
* Some packages are not as good as they should be, or have poor documentation.
* Object oriented programming in R can be very confusing and complex.


## Setting up
https://www.r-project.org/


### RStudio
RStudio is the most widely used IDE for R. It is completely free

### Libraries for data science

* **dplyr** efficient data manipulation
* **ggplot2** plotting
* **stats** several statistical models
* **rstan** Bayesian inference.
* **MCMCpack**
* **rmarkdown** and **knitr** Dynamic reports.
* **devtools** Package development.


## R basics

### Variables and types
Important information and tips:

* no type declaration
* define variables with `<-` instead of `=` (although both work, there is a slight difference, additionally most of the packages use the arrow)
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

### Basic operations

```r
n + x
```

```
## [1] 22.7
```

```r
n - x
```

```
## [1] 17.3
```

```r
diff <- n - x # variable diff gets the difference between n and x
diff
```

```
## [1] 17.3
```

```r
n * x
```

```
## [1] 54
```

```r
n / x
```

```
## [1] 7.407407
```

```r
x^2
```

```
## [1] 7.29
```

```r
sqrt(x)
```

```
## [1] 1.643168
```

```r
n > 2 * n
```

```
## [1] FALSE
```

```r
n == n
```

```
## [1] TRUE
```

```r
n == 2 * n
```

```
## [1] FALSE
```

```r
n != n
```

```
## [1] FALSE
```

```r
paste(student_name, "is", n, "years old")
```

```
## [1] "Luka is 20 years old"
```

### Vectors

* use `c()` to combine elements into vectors
* can only contain one type of variable
* if different types are provided, all are transformed to the most basic type in the vector
* access elements by indexes or logical vectors of the same length
* a scalar value is regarded as a vector of length 1



```r
1:4 # creates a vector of integers from 1 to 4
```

```
## [1] 1 2 3 4
```

```r
student_ages  <- c(20, 23, 21)
student_names <- c("Luke", "Jen", "Mike")
passed        <- c(TRUE, TRUE, FALSE)
length(student_ages)
```

```
## [1] 3
```

```r
# access by index
student_ages[2] 
```

```
## [1] 23
```

```r
student_ages[1:2]
```

```
## [1] 20 23
```

```r
student_ages[2] <- 24 # change values

# access by logical vectors
student_ages[passed == TRUE] # same as student_ages[passed]
```

```
## [1] 20 24
```

```r
student_ages[student_names %in% c("Luke", "Mike")]
```

```
## [1] 20 21
```

```r
student_names[student_ages > 20]
```

```
## [1] "Jen"  "Mike"
```

#### Operations with vectors
* most operations are element-wise
* if we operate on vectors of different lengths, the shorter vector periodically repeats its elements until it reaches the length of the longer one


```r
a <- c(1, 3, 5)
b <- c(2, 2, 1)
d <- c(6, 7)
a + b
```

```
## [1] 3 5 6
```

```r
a * b
```

```
## [1] 2 6 5
```

```r
a + d
```

```
## Warning in a + d: longer object length is not a multiple of shorter object
## length
```

```
## [1]  7 10 11
```

```r
a + 2 * b
```

```
## [1] 5 7 7
```

```r
a > b
```

```
## [1] FALSE  TRUE  TRUE
```

```r
b == a
```

```
## [1] FALSE FALSE FALSE
```

```r
a %*% b # vector multiplication, not element-wise
```

```
##      [,1]
## [1,]   13
```



### Factors

* vectors of finite predetermined classes
* suitable for categorical variables
* ordinal (ordered) or nominal (unordered)


```r
car_brand <- factor(c("Audi", "BMW", "Mercedes", "BMW"), ordered = FALSE)
car_brand
```

```
## [1] Audi     BMW      Mercedes BMW     
## Levels: Audi BMW Mercedes
```

```r
freq      <- factor(x       = NA,
                    levels  = c("never","rarely","sometimes","often","always"),
                    ordered = TRUE)
freq[1:3] <- c("rarely", "sometimes", "rarely")
freq
```

```
## [1] rarely    sometimes rarely   
## Levels: never < rarely < sometimes < often < always
```

```r
freq[4]   <- "quite_often" # non-existing level, returns NA
```

```
## Warning in `[<-.factor`(`*tmp*`, 4, value = "quite_often"): invalid factor
## level, NA generated
```

```r
freq
```

```
## [1] rarely    sometimes rarely    <NA>     
## Levels: never < rarely < sometimes < often < always
```


### Matrices

* two-dimensional generalizations of vectors


```r
my_matrix <- matrix(c(1, 2, 1,
                      5, 4, 2),
                    nrow  = 2,
                    byrow = TRUE)
my_matrix
```

```
##      [,1] [,2] [,3]
## [1,]    1    2    1
## [2,]    5    4    2
```

```r
my_square_matrix <- matrix(c(1, 3,
                             2, 3),
                           nrow  = 2)
my_square_matrix
```

```
##      [,1] [,2]
## [1,]    1    2
## [2,]    3    3
```

```r
my_matrix[1,2] # first row, second column
```

```
## [1] 2
```

```r
my_matrix[2, ] # second row
```

```
## [1] 5 4 2
```

```r
my_matrix[ ,3] # third column
```

```
## [1] 1 2
```



#### Matrix functions and operations

* most operation element-wise
* mind the dimensions when using matrix multiplication `%*%`


```r
nrow(my_matrix) # number of matrix rows
```

```
## [1] 2
```

```r
ncol(my_matrix) # number of matrix columns
```

```
## [1] 3
```

```r
dim(my_matrix) # matrix dimension
```

```
## [1] 2 3
```

```r
t(my_matrix) # transpose
```

```
##      [,1] [,2]
## [1,]    1    5
## [2,]    2    4
## [3,]    1    2
```

```r
diag(my_matrix) # the diagonal of the matrix as vector
```

```
## [1] 1 4
```

```r
diag(1, nrow = 3) # creates a diagonal matrix
```

```
##      [,1] [,2] [,3]
## [1,]    1    0    0
## [2,]    0    1    0
## [3,]    0    0    1
```

```r
det(my_square_matrix) # matrix determinant
```

```
## [1] -3
```

```r
my_matrix + 2 * my_matrix
```

```
##      [,1] [,2] [,3]
## [1,]    3    6    3
## [2,]   15   12    6
```

```r
my_matrix * my_matrix # element-wise multiplication
```

```
##      [,1] [,2] [,3]
## [1,]    1    4    1
## [2,]   25   16    4
```

```r
my_matrix %*% t(my_matrix) # matrix multiplication
```

```
##      [,1] [,2]
## [1,]    6   15
## [2,]   15   45
```

```r
my_vec <- as.vector(my_matrix) # transform to vector
my_vec
```

```
## [1] 1 5 2 4 1 2
```

### Arrays

* multi-dimensional generalizations of matrices


```r
my_array <- array(c(1, 2, 3, 4, 5, 6, 7, 8), dim = c(2, 2, 2))
my_array[1, 1, 1]
```

```
## [1] 1
```

```r
my_array[2, 2, 1]
```

```
## [1] 4
```

```r
my_array[1, , ]
```

```
##      [,1] [,2]
## [1,]    1    5
## [2,]    3    7
```

```r
dim(my_array)
```

```
## [1] 2 2 2
```


### Data frames

* basic data structure for analysis
* differ from matrices as columns can be of different types



```r
student_data <- data.frame("Name" = student_names, 
                           "Age"  = student_ages, 
                           "Pass" = passed)
student_data
```

```
##   Name Age  Pass
## 1 Luke  20  TRUE
## 2  Jen  24  TRUE
## 3 Mike  21 FALSE
```

```r
colnames(student_data) <- c("name", "age", "pass") # change column names
student_data[1, ]
```

```
##   name age pass
## 1 Luke  20 TRUE
```

```r
student_data[ ,colnames(student_data) %in% c("name", "pass")]
```

```
##   name  pass
## 1 Luke  TRUE
## 2  Jen  TRUE
## 3 Mike FALSE
```

```r
student_data$pass # access column by name
```

```
## [1]  TRUE  TRUE FALSE
```

```r
student_data[student_data$pass == TRUE, ]
```

```
##   name age pass
## 1 Luke  20 TRUE
## 2  Jen  24 TRUE
```


### Lists

* useful for storing different data structures
* access elements with double square brackets
* elements can be named


```r
first_list  <- list(student_ages, my_matrix, student_data)
second_list <- list(student_ages, my_matrix, student_data, first_list)
first_list[[1]]
```

```
## [1] 20 24 21
```

```r
second_list[[4]]
```

```
## [[1]]
## [1] 20 24 21
## 
## [[2]]
##      [,1] [,2] [,3]
## [1,]    1    2    1
## [2,]    5    4    2
## 
## [[3]]
##   name age  pass
## 1 Luke  20  TRUE
## 2  Jen  24  TRUE
## 3 Mike  21 FALSE
```

```r
second_list[[4]][[1]] # first element of the fourth element of second_list
```

```
## [1] 20 24 21
```

```r
length(second_list)
```

```
## [1] 4
```

```r
second_list[[length(second_list) + 1]] <- "add_me" # append an element
names(first_list) <- c("Age", "Matrix", "Data")
first_list$Age
```

```
## [1] 20 24 21
```


### Loops

* mostly for loop
* for loop can iterate over an arbitrary vector


```r
# iterate over consecutive natural numbers
my_sum <- 0
for (i in 1:10) {
  my_sum <- my_sum + i
}
my_sum
```

```
## [1] 55
```

```r
# iterate over an arbirary vector
my_sum       <- 0
some_numbers <- c(2, 3.5, 6, 100)
for (i in some_numbers) {
  my_sum <- my_sum + i
}
my_sum
```

```
## [1] 111.5
```

## Functions

* for help use `?function_name`

### Writing functions
We can write our own functions with `function()`. In the brackets, we
define the parameters the function gets, and in curly brackets we define what
the function does. We use `return()` to return values.


```r
sum_first_n_elements <- function (n) {
  my_sum <- 0
  for (i in 1:n) {
    my_sum <- my_sum + i
  }
  return (my_sum)
}
sum_first_n_elements(10)
```

```
## [1] 55
```



## Other tips

* Use `set.seed(arbitrary_number)` at the beginning of a script to set the seed and ensure replication.
* To dynamically set the working directory in R Studio to the parent folder of a R script use `setwd(dirname(rstudioapi::getSourceEditorContext()$path))`.
* To avoid slow R loops use the apply family of functions. See `?apply` and `?lapply`.
* To make your data manipulation (and therefore your life) a whole lot easier, use the **dplyr** package.
* Use `getAnywhere(function_name)` to get the source code of any function.
* Use browser for debugging. See `?browser`.

<!-- ### Dynamically setting working directory -->
<!-- To set the working directory use the `setwd()` function. -->
<!-- To dynamically set the working directory to the parent folder of a R script -->
<!-- we can use -->

<!-- ```{r, error=TRUE, eval=FALSE} -->
<!-- setwd(dirname(rstudioapi::getSourceEditorContext()$path)) -->
<!-- ``` -->


<!-- ### Apply functions -->
<!-- To avoid slow R loops, you can sometimes use one of the apply functions, -->
<!-- which decrease the execution time considerably. For details see -->
<!-- `?apply` and `?lapply`, or check one of the tutorials on apply function -->
<!-- on the internet. -->


<!-- ### Dplyr and ggplot -->
<!-- Dplyr can make your data manipulation (and therefore your life) a whole lot  -->
<!-- easier. Instead of several nested for loops or complex apply structures,  -->
<!-- dpylr can do useful data -->
<!-- filtering, transformation, grouping, summarization,... in a matter of -->
<!-- only a few lines. -->

<!-- ggplot ... -->


<!-- ### Browser and debugging -->
<!-- The browser function is used for debugging. By writing the line `browser()` -->
<!-- inside a loop or a function, the function pauses and you can evaluate the -->
<!-- variables currently stored in the environment and go through next calls  -->
<!-- step-wise. For more information on the browser function see `?browser()`. -->


<!-- ### Getting function code -->
<!-- Use `getAnywhere(function_name)` to see the code of the function. -->


## Further reading and references
* Getting started with R Studio: https://www.youtube.com/watch?v=lVKMsaWju8w
* Official R manuals: https://cran.r-project.org/manuals.html
* Cheatsheets: https://www.rstudio.com/resources/cheatsheets/
* Workshop on R, dplyr, ggplot2, and R Markdown: https://github.com/bstatcomp/Rworkshop

## Learning outcomes

Data science students should work towards obtaining the knowledge and the skills that enable them to:

* Use the R programming language for common programming tasks, data manipulation, file I/0, etc.
* Find suitable R packages for the task at hand and use them.
* Recognize when R is and when it is not a suitable language to use.


<!-- ## Practice problems -->
<!-- For each problem use a separate R script. Name the scripts as Problem#_Surname_Name.R. Make sure your results are reproducible. -->


<!-- ### Problem 1 -- Matrices -->
<!-- Use the normal random number generator to create: -->

<!-- * 4x4 matrix $A$, -->
<!-- * 2x5 matrix $B$, -->
<!-- * 5x4 matrix $C$. -->

<!-- Calculate: -->

<!-- * the mean of values in $A$, -->
<!-- * the variance of values in $A$, -->
<!-- * the max value in all of the matrices, -->
<!-- * the sum of $A$ and its transpose, -->
<!-- * the element-wise product of $A$ and its transpose, -->
<!-- * the scalar product of $B$ and $C$, -->
<!-- * the determinant of $B^TB$. -->

<!-- Tip: see `rnorm()`. -->


<!-- ### Problem 2 -- Data -->

<!-- ### Problem 3 -- Functions -->
