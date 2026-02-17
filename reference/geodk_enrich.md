# Enrich a dataframe with geographic data

This function makes it easy for you to enrich your dataframe with
appropriate geographical information. The main usage, right now at
least, is to enrich statistical data from `{geodk}` with geometries for
the appropriate levels.

## Usage

``` r
geodk_enrich(x)
```

## Arguments

- x:

  Dataframe. Preferably from `{dkstat}`

## Value

Returns a dataframe of the dimensions `cols +1 by rows`.
