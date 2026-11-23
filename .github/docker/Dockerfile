# CI image for building the book. Built by the "image" job in bookdown.yml
# whenever this file or renv.lock changes (tagged by their hash).
# R packages are pinned in exercise-handbook/renv.lock, not here.
# Build context is the repository root (see .dockerignore).
FROM rocker/tidyverse:4.6.2

# Packages go into the image's site library, so build.R must not switch to
# the (empty) renv project library of the checked-out repository.
ENV RENV_ACTIVATE_PROJECT=FALSE

COPY exercise-handbook/renv.lock /tmp/book/renv.lock

RUN Rscript -e 'install.packages("renv"); renv::restore(project = "/tmp/book", library = .libPaths()[1], prompt = FALSE)' \
 && Rscript -e 'p <- names(jsonlite::read_json("/tmp/book/renv.lock")$Packages); miss <- p[!vapply(p, requireNamespace, TRUE, quietly = TRUE)]; if (length(miss)) stop("Failed to install: ", toString(miss))' \
 && apt-get update && apt-get install -y --no-install-recommends zip gh \
 && rm -rf /var/lib/apt/lists/* /tmp/book
