# One-off migration: split a chapter's exercises into separate child files.
#
# Usage (from exercise-handbook/):
#   Rscript _dev/split_exercises.R <chapter.Rmd> <slug1> <slug2> ...
#
# Writes chapters/<chapter>/<slug>.Rmd for each exercise (in order of
# appearance) and rewrites <chapter.Rmd> to include them via knitr child chunks.
#
# An exercise is its ```{exercise ...} chunk plus the code chunks, <div> blocks
# and ::: fenced divs directly after it (blank lines in between allowed), which
# covers given code, figures and folded solutions. Everything else (headings,
# prose, setup) stays in the chapter file, and each exercise is replaced by a
# one-line child chunk.

args <- commandArgs(trailingOnly = TRUE)
chapter_file <- args[[1]]
slugs <- args[-1]

lines <- readLines(chapter_file, warn = FALSE, encoding = "UTF-8")
n <- length(lines)
is_blank <- function(i) i <= n && grepl("^\\s*$", lines[i])

# Index of the closing ``` of the chunk opening at line i.
chunk_end <- function(i) {
  j <- i + 1
  while (j <= n && !grepl("^\\s*```\\s*$", lines[j])) j <- j + 1
  if (j > n) stop("Unclosed chunk starting at line ", i)
  j
}

# Index of the </div> matching the <div at line i, ignoring lines inside chunks.
div_end <- function(i) {
  depth <- 0
  in_chunk <- FALSE
  for (j in i:n) {
    if (grepl("^\\s*```", lines[j])) in_chunk <- !in_chunk
    if (in_chunk) next
    depth <- depth + lengths(regmatches(lines[j], gregexpr("<div\\b", lines[j])))
    depth <- depth - lengths(regmatches(lines[j], gregexpr("</div>", lines[j])))
    if (depth == 0) return(j)
  }
  stop("Unclosed <div> starting at line ", i)
}

starts <- grep("^```\\{exercise", lines)
if (length(starts) != length(slugs)) {
  stop(sprintf("%s has %d exercises but %d slugs were given",
               chapter_file, length(starts), length(slugs)))
}
if (anyDuplicated(slugs)) stop("Duplicate slugs: ", paste(slugs[duplicated(slugs)], collapse = ", "))

# Index of the ::: closing the pandoc fenced div opened at line i.
fenced_div_end <- function(i) {
  depth <- 0
  in_chunk <- FALSE
  for (j in i:n) {
    if (grepl("^\\s*```", lines[j])) in_chunk <- !in_chunk
    if (in_chunk) next
    if (grepl("^\\s*:::+\\s*\\S", lines[j])) depth <- depth + 1
    else if (grepl("^\\s*:::+\\s*$", lines[j])) depth <- depth - 1
    if (depth == 0) return(j)
  }
  stop("Unclosed ::: div starting at line ", i)
}

# Exercise = exercise chunk + the run of code chunks, <div> blocks and :::
# blocks that follows it (blank lines in between allowed). Stops at the first
# other line (prose, heading) or at the next exercise.
blocks <- lapply(starts, function(s) {
  e <- chunk_end(s)
  repeat {
    k <- e + 1
    while (is_blank(k)) k <- k + 1
    if (k > n || grepl("^```\\{exercise", lines[k])) break
    if (grepl("^\\s*```", lines[k])) e <- chunk_end(k)
    else if (grepl("^\\s*<div\\b", lines[k])) e <- div_end(k)
    else if (grepl("^\\s*:::+\\s*\\S", lines[k])) e <- fenced_div_end(k)
    else break
  }
  c(start = s, end = e)
})

chapter_name <- tools::file_path_sans_ext(basename(chapter_file))
out_dir <- file.path(dirname(chapter_file), "chapters", chapter_name)
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

# Write exercise files.
for (b in seq_along(blocks)) {
  s <- blocks[[b]][["start"]]; e <- blocks[[b]][["end"]]
  writeLines(enc2utf8(lines[s:e]), file.path(out_dir, paste0(slugs[b], ".Rmd")), useBytes = TRUE)
}

# Rebuild chapter file: each exercise becomes one single-line child chunk
# (knitr requires the whole chunk header on one line).
out <- character(0)
pos <- 1
for (b in seq_along(blocks)) {
  s <- blocks[[b]][["start"]]; e <- blocks[[b]][["end"]]
  if (s > pos) out <- c(out, lines[pos:(s - 1)])
  out <- c(out, sprintf('```{r, child = "chapters/%s/%s.Rmd"}', chapter_name, slugs[b]), "```")
  pos <- e + 1
}
if (pos <= n) out <- c(out, lines[pos:n])
writeLines(enc2utf8(out), chapter_file, useBytes = TRUE)

message(sprintf("%s: %d exercises -> %s", chapter_file, length(blocks), out_dir))
