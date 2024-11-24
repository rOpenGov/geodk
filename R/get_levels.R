#' Get all available levels
#'
#' @returns This funciton returns all available levels for the `plot_*`
#'   functions.
#'
#' @export
#' @examples
#' get_levels()
#'
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
