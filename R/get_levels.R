get_levels <- function() {
  levels <- c(
    "regioner",
    "kommuner",
    "sogne",
    "retskredse",
    "afstemningsomraader",
    "politikredse",
    "landsdele",
    "storkredse",
    "postnumre",
    "opstillingskredse",
    "menighedsraadsafstemningsomraader"
  )


  # Ensure that manually specified levels are actually available
  if (all(levels %in% dawaR::available_sections(
    format = "geojson",
    verbose = FALSE
  ))) {
    return(levels)
  }
}
