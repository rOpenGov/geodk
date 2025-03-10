#' Get regions
#'
#' @returns Returns a `{sf}` object for the danish regions
#' @importFrom rlang .data
#' @export
#' @family data retrieval
regions <- function() {
  dawaR::get_map_data("regioner") |>
    dplyr::rename(code = .data$kode,
                  name = .data$navn,
                  visualcenter_x = .data$visueltcenter_x,
                  visualcenter_y = .data$visueltcenter_y) |>
    dplyr::select(
      .data$code,
      .data$name,
      .data$visualcenter_x,
      .data$visualcenter_y
    )
}

#' Get municipalities
#'
#' @returns Returns a `{sf}` object for the danish municipalities
#' @importFrom rlang .data
#' @export
#' @family data retrieval
municipalities <- function() {
  dawaR::get_map_data("kommuner") |>
    dplyr::rename(code = .data$kode,
                  name = .data$navn,
                  region_code = .data$regionskode,
                  region_name = .data$regionsnavn,
                  visualcenter_x = .data$visueltcenter_x,
                  visualcenter_y = .data$visueltcenter_y) |>
    dplyr::select(
      .data$code,
      .data$name,
      .data$region_code,
      .data$region_name,
      .data$visualcenter_x,
      .data$visualcenter_y
    )
}

#' Get parishes
#'
#' @returns Returns a `{sf}` object for the danish parishes
#' @importFrom rlang .data
#' @export
#' @family data retrieval
parishes <- function() {
  dawaR::get_map_data("sogne") |>
    dplyr::rename(code = .data$kode,
                  name = .data$navn,
                  visualcenter_x = .data$visueltcenter_x,
                  visualcenter_y = .data$visueltcenter_y) |>
    dplyr::select(.data$code,
                  .data$name,
                  .data$visualcenter_x,
                  .data$visualcenter_y)
}

#' Get constituencies
#'
#' @returns Returns a `{sf}` object for the danish constituencies
#' @importFrom rlang .data
#' @export
#' @family data retrieval
constituencies <- function() {
  dawaR::get_map_data("afstemningsomraader") |>
    dplyr::rename(code = .data$nummer,
                  name = .data$navn,
                  placename = .data$afstemningsstedsnavn,
                  address = .data$afstemningsstedadressebetegnelse,
                  address_access_x = .data$afstemningssted_adgangspunkt_x,
                  address_access_y = .data$afstemningssted_adgangspunkt_y,
                  municipality = .data$kommunenavn,
                  region = .data$regionsnavn,
                  visualcenter_x = .data$visueltcenter_x,
                  visualcenter_y = .data$visueltcenter_y) |>
    dplyr::select(
      .data$code,
      .data$name,
      .data$placename,
      .data$address,
      .data$address_access_x,
      .data$address_access_y,
      .data$municipality,
      .data$region,
      .data$visualcenter_x,
      .data$visualcenter_y
    )
}

#' Get geogrpahies
#'
#' @returns Returns a `{sf}` object for the specified geography
#'
#' @param section The geographic level wanted.
#'
#' @export
#' @family data retrieval
get_geo <- function(section = "postnumre") {
  dawaR::get_map_data(section)
}

