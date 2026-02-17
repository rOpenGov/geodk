# Prefill data retrieval cache

This function prefills the cache of the underlying API-function. By
default the sections shown in the example below is prefilled. This is
meant to replace the cached dataset that once was in the package. It may
be useful to prefill the cache before using `geodk_enrich`.

## Usage

``` r
prefill_cache(specific_section = NULL)
```

## Arguments

- specific_section:

  Enter a seciton name (or vector of section names) you would like to
  have pre-filled. Options can be found in
  `dawaR::avaialable_sections()`

## Value

Returns nothing. Is called for the side effect of prefilling the cache.

## Examples

``` r
sections <- c(
  "regioner",
  "kommuner",
  "postnumre",
  "sogne",
  "regioner",
  "opstillingskredse",
  "afstemningsomraader"
)
```
