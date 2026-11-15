# Principles of Uncertainty

- Latest: https://fri-datascience.github.io/course_pou/
- Dev (current `master`): https://fri-datascience.github.io/course_pou/dev/

## Build locally

```sh
Rscript -e 'remotes::install_deps(dependencies = TRUE)'   # install packages from DESCRIPTION
Rscript build.R        # latest version, written to docs/
Rscript build.R dev    # dev version (with banner)
```

Open `docs/index.html` to view the result. CI runs the same script, so new packages must be added to `DESCRIPTION` and any data files a chapter reads must be committed.

## Publish

- **Update dev:** push to `master`.
- **Promote dev to latest:** publish a GitHub Release with a new tag on `master`.
- **Roll back:** mark an older release as latest, then run the workflow from the Actions tab.
