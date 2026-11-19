# CI image for building the book. Built by the "image" job in bookdown.yml
# whenever this file changes (tagged by its hash). Add new R packages here.
FROM rocker/tidyverse:4.4.2

RUN install2.r --error --skipinstalled \
      bookdown reshape2 mvtnorm numDeriv mixtools ggfortify ggforce \
      ade4 gridExtra Rmisc shiny boot MASS \
 && apt-get update && apt-get install -y --no-install-recommends zip gh \
 && rm -rf /var/lib/apt/lists/*
