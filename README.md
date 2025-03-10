
<!-- README.md is generated from README.Rmd. Please edit that file -->

# geodk

<!-- badges: start -->

[![geodk status
badge](https://ropengov.r-universe.dev/badges/geodk)](https://ropengov.r-universe.dev/geodk)
[![R-CMD-check](https://github.com/rOpenGov/geodk/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/rOpenGov/geodk/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/ropengov/geodk/graph/badge.svg)](https://app.codecov.io/gh/ropengov/geodk)
[![Project Status: WIP – Development in
progress](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![rOG-badge](https://ropengov.github.io/rogtemplate/reference/figures/ropengov-badge.svg)](https://ropengov.org/)
<!-- badges: end -->

`{geodk}` provides access to Danish geospatial data.

## Installation

You can install `{geodk}` from r-universe with:

``` r
install.packages(
  "geodk",
  repos = c(
    ropengov = "https://ropengov.r-universe.dev",
    getOption("repos")
  )
)
```

You can install the latest development version of `{geodk}` from
[GitHub](https://github.com/rOpenGov/geodk) with:

``` r
# install.packages("devtools")
devtools::install_github("rOpenGov/geodk")
```

## Functions

`{geodk}` provides three main sets of functions:

- Data retrieval
- Plotting
- Enrichment of statistical data from `{dkstat}`

### Data retrieval

The package contains a few functions for retrieving data.

``` r
regions()
municipalities()
parishes()
constituencies()
```

The geographic levels not included in their own functions can be
accessed through `get_geo()`.

``` r
get_geo()
prefill_cache()
```

### Plotting

The plotting functions include `plot_denmark()` which easily plots a
basic map of Denmark and returns it as a `{ggplot2}` object for you to
edit. It also includes `plot_region()` and `plot_municipality()` which
plots a subset of Denmark with focus on provided regions or
municipalities.

``` r
library(geodk)
plot_denmark()
#> → Getting data on `regioner`. This usually takes 10.24s.
#> Fetching data from the API. This will take some time.
#> Reading data to `st`.
#> Converting map data to `sf` object
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r
region <- plot_regions(region = c("Region Nordjylland", "Region Midtjylland"))
#> → Using cached response.
#> Change this behaviour by setting cache = FALSE
```

``` r
municipality <- plot_municipalities(municipality = c("Aarhus", "Favrskov", "Vejle"))
#> → Getting data on `kommuner`. This usually takes 13.13s.
#> Fetching data from the API. This will take some time.
#> Reading data to `st`.
#> Converting map data to `sf` object
```

``` r
library(patchwork)
region + municipality
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />

### Enrichment of statistical data from `{dkstat}`

The function `geodk_enrich()` enables you to add appropriate geographic
information to statistical descriptions from the `{dkstat}` package.

``` r
dkstat::dst_get_all_data("laby01") |> 
  geodk::geodk_enrich()
```
