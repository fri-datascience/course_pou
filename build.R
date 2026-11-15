# Single build entry point for  GitHub Actions and local builds.
#
# Usage:
#   Rscript build.R [latest|dev] [outdir]
#
#   latest  (default) normal build
#   dev     adds a "development version" banner and a noindex meta tag
#   outdir  output directory (default: docs, as in _bookdown.yml)
#
# Install dependencies first with: Rscript -e 'remotes::install_deps(dependencies = TRUE)'

args    <- commandArgs(trailingOnly = TRUE)
channel <- if (length(args) >= 1) args[[1]] else "latest"
outdir  <- if (length(args) >= 2) args[[2]] else "docs"

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
