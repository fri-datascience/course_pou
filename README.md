# Principles of Uncertainty materials

Course materials for Principles of Uncertainty (University of Ljubljana, Faculty of Computer and Information Science).

The latest textbook version can be found [here](PoU_textbook.pdf).  
Exercise handbook:
- Latest: https://fri-datascience.github.io/course_pou/
- Dev: https://fri-datascience.github.io/course_pou/dev/


## Build the exercise handbook locally

R packages are managed with [renv](https://rstudio.github.io/renv/). From the repository root, install them with:

```sh
Rscript -e 'renv::restore()'
```

R started in the repository root or in `exercise-handbook/` activates the project library automatically (and installs renv itself if needed).

To add a package, add it to `Imports:` in [`exercise-handbook/DESCRIPTION`](exercise-handbook/DESCRIPTION), then run `Rscript -e 'renv::install("<package>"); renv::snapshot()'` and commit both files. To update all packages, run `Rscript -e 'renv::update(); renv::snapshot()'`.

Then build (from the repository root or any other directory):

```sh
Rscript exercise-handbook/build.R        # latest version, written to exercise-handbook/docs/
Rscript exercise-handbook/build.R dev    # dev version (with banner)
```

Open `exercise-handbook/docs/index.html` to view the result. In RStudio, open `bookdown_pou.Rproj` and use *Build Book*.

CI runs the same script inside a Docker image built from the same `renv.lock`, so CI and local builds use the same package versions. The image is rebuilt automatically when `renv.lock` changes. Any data file a chapter reads must be committed.

## Publish the exercise handbook

- **Check a change:** open a PR to `master`. The book is built but not deployed.
- **Update dev:** push to `master`.
- **Promote dev to latest:** publish a GitHub Release with a new tag on `master`.
- **Roll back:** mark an older release as latest, then run the workflow from the Actions tab.
