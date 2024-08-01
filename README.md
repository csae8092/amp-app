[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.10718378.svg)](https://doi.org/10.5281/zenodo.10718378)
[![Build and publish](https://github.com/Auden-Musulin-Papers/amp-app/actions/workflows/build.yml/badge.svg)](https://github.com/Auden-Musulin-Papers/amp-app/actions/workflows/build.yml)

# amp-app

- built with [DSE-Static-Cookiecutter](https://github.com/acdh-oeaw/dse-static-cookiecutter)

- TEI/XML data from [amp-data](https://github.com/Auden-Musulin-Papers/amp-data) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.13149400.svg)](https://doi.org/10.5281/zenodo.13149400)

# Build

- run `./build_app/shell/build-local.sh` to build the app locally
- use the `.github/workflows/build.yml` workflow to build the app on GitHub

## Dependencies

- Python 3.10
- Apache Ant [ant-contrib-1.0b3](https://github.com/Auden-Musulin-Papers/amp-app/blob/master/.github/workflows/build.yml#L42C77-L43)
- Java [openjdk-11-jre](https://github.com/Auden-Musulin-Papers/amp-app/blob/master/.github/workflows/build.yml#L38)
- Typesense [search index](https://github.com/Auden-Musulin-Papers/amp-app/blob/master/.github/workflows/build.yml#L68)
