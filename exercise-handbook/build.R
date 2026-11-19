# Single build entry point for  GitHub Actions and local builds.
#
# Usage (from any directory):
#   Rscript exercise-handbook/build.R [latest|dev] [outdir]
#
#   latest  (default) normal build
#   dev     adds a "development version" banner and a noindex meta tag
#   outdir  output directory, relative to the current directory
#           (default: docs/ next to this script, as in _bookdown.yml)
#
# Install dependencies first, from this directory:
#   Rscript -e 'remotes::install_deps(dependencies = TRUE)'

# Directory of this script, so the book renders no matter where it is called from.
file_arg <- grep("^--file=", commandArgs(trailingOnly = FALSE), value = TRUE)
book_dir <- if (length(file_arg)) dirname(normalizePath(sub("^--file=", "", file_arg[[1]]))) else getwd()

args    <- commandArgs(trailingOnly = TRUE)
channel <- if (length(args) >= 1) args[[1]] else "latest"
outdir  <- if (length(args) >= 2) args[[2]] else file.path(book_dir, "docs")
# Make outdir absolute before changing directory. normalizePath() alone is not
# enough: on Linux it returns non-existent paths unchanged (still relative).
if (!grepl("^(/|[A-Za-z]:[/\\\\]|~)", outdir)) outdir <- file.path(getwd(), outdir)
outdir  <- normalizePath(outdir, mustWork = FALSE)

setwd(book_dir)

if (!channel %in% c("latest", "dev")) {
  stop("channel must be 'latest' or 'dev', got: ", channel)
}

output_options <- list()
if (channel == "dev") {
  output_options$includes <- list(
    in_header   = "_dev/head.html",
    before_body = "_dev/banner.html"
  )
}

# Clean build, so local output matches CI.
unlink(outdir, recursive = TRUE)

bookdown::render_book(
  "index.Rmd",
  output_format  = "bookdown::gitbook",
  output_dir     = outdir,
  output_options = output_options,
  envir          = new.env()
)

# Serve files as-is on GitHub Pages (no Jekyll processing).
file.create(file.path(outdir, ".nojekyll"))

message("Built '", channel, "' version into ", normalizePath(outdir))
