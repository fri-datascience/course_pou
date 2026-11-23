# Shared setup, run before every chapter (before_chapter_script in _bookdown.yml).

# Solution visibility. Set to FALSE to build the book without solutions.
togs   <- TRUE
togs2  <- TRUE
tog_ex <- TRUE

# Order matters: MASS after dplyr, so MASS::select masks dplyr::select (as before).
suppressPackageStartupMessages({
  library(ggplot2)
  library(dplyr)
  library(reshape2)
  library(tidyr)
  library(MASS)
  library(ggforce)
  library(mixtools)
  library(ade4)
  library(ggfortify)
  library(numDeriv)
})
