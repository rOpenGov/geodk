# Plot selected (or all) regions

Plot a vector of regions in Denmark. Just provide the name.

## Usage

``` r
plot_regions(
  region = c("Region Nordjylland", "Region Midtjylland", "Region Syddanmark",
    "Region Hovedstaden", "Region Sjælland")
)
```

## Arguments

- region:

  Region(s) to plot

## Value

Returns a `{ggplot2}` object and prints the plot as well.

## Examples

``` r
plot_regions(region = c("Region Nordjylland", "Region Midtjylland"))
#> → Using cached response.
#> Change this behaviour by setting cache = FALSE
```
