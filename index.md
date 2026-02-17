# geodk

[geodk](https://ropengov.github.io/geodk/) provides access to Danish
geospatial data.

## Installation

You can install [geodk](https://ropengov.github.io/geodk/) from
r-universe with:

``` r
install.packages(
  "geodk",
  repos = c(
    ropengov = "https://ropengov.r-universe.dev",
    getOption("repos")
  )
)
```

You can install the latest development version of
[geodk](https://ropengov.github.io/geodk/) from
[GitHub](https://github.com/rOpenGov/geodk) with:

``` r
# install.packages("devtools")
devtools::install_github("rOpenGov/geodk")
```

## Functions

[geodk](https://ropengov.github.io/geodk/) provides three main sets of
functions:

- Data retrieval
- Plotting
- Enrichment of statistical data from
  [dkstat](https://ropengov.github.io/dkstat/)

### Data retrieval

The package contains a few functions for retrieving data.

``` r
regions()
municipalities()
parishes()
constituencies()
```

The geographic levels not included in their own functions can be
accessed through
[`get_geo()`](https://ropengov.github.io/geodk/reference/get_geo.md).

``` r
get_geo()
prefill_cache()
```

### Plotting

The plotting functions include
[`plot_denmark()`](https://ropengov.github.io/geodk/reference/plot_denmark.md)
which easily plots a basic map of Denmark and returns it as a
[ggplot2](https://ggplot2.tidyverse.org) object for you to edit. It also
includes `plot_region()` and `plot_municipality()` which plots a subset
of Denmark with focus on provided regions or municipalities.

``` r
library(geodk)
plot_denmark()
#> → Getting data on `regioner`. This usually takes 10.24s.
#> Fetching data from the API. This will take some time.
#> Reading data to `st`.
#> Converting map data to `sf` object
```

![](reference/figures/README-example-1.png)

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

![](reference/figures/README-unnamed-chunk-6-1.png)

### Enrichment of statistical data from `{dkstat}`

The function
[`geodk_enrich()`](https://ropengov.github.io/geodk/reference/geodk_enrich.md)
enables you to add appropriate geographic information to statistical
descriptions from the [dkstat](https://ropengov.github.io/dkstat/)
package.

``` r
dkstat::dst_get_all_data("laby01") |> 
  geodk::geodk_enrich()
```
