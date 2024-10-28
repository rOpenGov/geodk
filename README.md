
<!-- README.md is generated from README.Rmd. Please edit that file -->

# geodk

<!-- badges: start -->

[![R-CMD-check](https://github.com/aleksanderbl29/geodk/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/aleksanderbl29/geodk/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/aleksanderbl29/geodk/graph/badge.svg)](https://app.codecov.io/gh/aleksanderbl29/geodk)
<!-- badges: end -->

`{geodk}` provides access to Danish geospatial data.

## Installation

You can install the development version of geodk from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("aleksanderbl29/geodk")
```

## Functions

`{geodk}` provides to main sets of functions:

- Data retrieval
- Plotting

### Plotting

The plotting functions include `plot_denmark()` which easily plots a
basic map of Denmark and returns it as a `{ggplot2}` object for you to
edit. It also includes `plot_region` and `plot_municipality` which plots
a subset of Denmark with focus on provided regions or municipalities.

``` r
library(geodk)
plot_denmark()
#> → Getting data on `regioner`. This usually takes 10.24s.
#> Fetching data from the API. This will take some time.
#> Reading data to `st`.
#> Converting map data to `sf` object
```

<img src="man/figures/README-example-1.png" width="100%" />
