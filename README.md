# Principles of Uncertainty materials

Course materials for Principles of Uncertainty (University of Ljubljana, Faculty of Computer and Information Science).

The latest textbook version can be found [here](PoU_textbook.pdf).  
Exercise handbook:
- Latest: https://fri-datascience.github.io/course_pou/
- Dev: https://fri-datascience.github.io/course_pou/dev/


## Build the exercise handbook locally

Install the R packages listed in [`exercise-handbook/DESCRIPTION`](exercise-handbook/DESCRIPTION):

```sh
Rscript -e 'install.packages("remotes"); remotes::install_deps("exercise-handbook", dependencies = TRUE)'
```

Then build (from the repository root or any other directory):

```sh
Rscript exercise-handbook/build.R        # latest version, written to exercise-handbook/docs/
Rscript exercise-handbook/build.R dev    # dev version (with banner)
```

Open `exercise-handbook/docs/index.html` to view the result. In RStudio, open `bookdown_pou.Rproj` and use *Build Book*.

CI runs the same script inside a Docker image built from the same `DESCRIPTION`, so a new R package only needs to be added to `Imports:` in `DESCRIPTION` (the image is rebuilt automatically), and any data file a chapter reads must be committed.

## Publish the exercise handbook

- **Check a change:** open a PR to `master`. The book is built but not deployed.
- **Update dev:** push to `master`.
- **Promote dev to latest:** publish a GitHub Release with a new tag on `master`.
- **Roll back:** mark an older release as latest, then run the workflow from the Actions tab.
