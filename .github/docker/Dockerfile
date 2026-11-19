# CI image for building the book. Built by the "image" job in bookdown.yml
# whenever this file or DESCRIPTION changes (tagged by their hash).
# R packages are listed in exercise-handbook/DESCRIPTION, not here.
# Build context is the repository root (see .dockerignore).
FROM rocker/tidyverse:4.4.2

COPY exercise-handbook/DESCRIPTION /tmp/book/DESCRIPTION

RUN Rscript -e 'remotes::install_deps("/tmp/book", dependencies = TRUE, upgrade = "never")' \
 && Rscript -e 'p <- trimws(strsplit(read.dcf("/tmp/book/DESCRIPTION", "Imports"), ",")[[1]]); miss <- p[!vapply(p, requireNamespace, TRUE, quietly = TRUE)]; if (length(miss)) stop("Failed to install: ", toString(miss))' \
 && apt-get update && apt-get install -y --no-install-recommends zip gh \
 && rm -rf /var/lib/apt/lists/* /tmp/book
