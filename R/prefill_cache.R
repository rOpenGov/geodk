#' Prefill data retrieval cache
#'
#' @param specific_section Enter a seciton name (or vector of section names) you
#'   would like to have pre-filled. Options can be found in
#'   `dawaR::avaialable_sections()`
#' @description This function prefills the cache of the underlying API-function.
#'   By default the sections shown in the example below is prefilled. This is
#'   meant to replace the cached dataset that once was in the package. It may be
#'   useful to prefill the cache before using `geodk_enrich`.
#'
#' @returns Returns nothing. Is called for the side effect of prefilling the
#'   cache.
#' @export
#'
#' @examples
#' sections <- c(
#'   "regioner",
#'   "kommuner",
#'   "postnumre",
#'   "sogne",
#'   "regioner",
#'   "opstillingskredse",
#'   "afstemningsomraader"
#' )
prefill_cache <- function(specific_section = NULL) {
  sections <- c(
    "regioner",
    "kommuner",
    "postnumre",
    "sogne",
    "regioner",
    "opstillingskredse",
    "afstemningsomraader",
    specific_section
  )

  cli::cli_inform("This will prefill the cache for {sections}")

  for (section in sections) {
    dawaR::get_map_data(section, cache = TRUE) |>
      invisible()
  }
}
