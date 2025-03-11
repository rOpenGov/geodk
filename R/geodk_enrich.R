# geodk_enrich.R
# This file contains the methods for all classes of geodk_enrich. Currently it
# contains methods for `{dkstat}` as well as a default method.

#' Enrich a dataframe with geographic data
#'
#' @description
#' This function makes it easy for you to enrich your dataframe with appropriate geographical information. The main usage, right now at least, is to enrich statistical data from `{geodk}` with geometries for the appropriate levels.
#'
#'
#' @param x Dataframe. Preferably from `{dkstat}`
#' @importFrom rlang .data
#'
#' @returns Returns a dataframe of the dimensions `cols +1 by rows`.
#' @export
#'
geodk_enrich <- function(x) {
  UseMethod("geodk_enrich")
}

#' @export
geodk_enrich.default <- function(x) {
  cli::cli_abort(
    c(
      "Only output from dkstat is supported at the moment.",
      "This is a work in progress.",
      "If you have provided output from dkstat and it still does not work,",
      "please submit an issue on {.url {'https://github.com/rOpenGov/geodk/issues'}}"
    )
  )
}

#' @export
geodk_enrich.dkstat_Denmark_municipality_07 <- function(x) {

  # List groupings
  hele_landet <- "000 Hele landet"
  groups <- c(
    "1 Hovedstadskommuner",
    "2 Storbykommuner",
    "3 Provinsbykommuner",
    "4 Oplandskommuner",
    "5 Landkommuner"
  )

  cli::cli_inform(c("i" = "Getting municipality geometries."))
  # Get sf geometries for individual municipalities
  individuals_sf <- dawaR::get_map_data("kommuner", verbose = FALSE) |>
    dplyr::select(.data$navn)

  cli::cli_inform(c("i" = "Assigning geometries to individual municipalities."))
  # Split individual observations and merge with geometries
  individuals <- x |>
    dplyr::filter(!.data$KOMGRP %in% c(hele_landet, groups)) |>
    dplyr::mutate(navn = substr(.data$KOMGRP, 5, nchar(.data$KOMGRP))) |>
    dplyr::left_join(individuals_sf, by = dplyr::join_by(navn)) |>
    dplyr::select(-.data$navn) |>
    sf::st_as_sf(crs = sf::st_crs(individuals_sf))

  cli::cli_inform(c("i" = "Drawing geometries for municipality groupings."))
  # Group municipality geometries to their groupings and return sf geometries
  groupings_sf <- individuals |>
    dplyr::left_join(komgrp, by = c("KOMGRP" = "name")) |>
    stats::na.omit() |>
    dplyr::select(.data$level, .data$geometry) |>
    unique() |>
    sf::st_as_sf(crs = sf::st_crs(individuals_sf)) |> #sf::st_union()
    dplyr::group_by(.data$level) |>
    dplyr::summarise() # This uses the summarise method for sf objects.

  cli::cli_inform(c("i" = "Assigning geometries to municipality groupings."))
  # Filter out groupings and merge with their geometries
  groupings <- x |>
    dplyr::filter(.data$KOMGRP %in% groups) |>
    dplyr::left_join(groupings_sf, by = c("KOMGRP" = "level")) |>
    sf::st_as_sf(crs = sf::st_crs(groupings_sf))

  cli::cli_inform(c("i" = "Drawing geometry for Denmark."))
  # Create geometry for the entire Denmark
  dk_sf <- sf::st_sfc(
    rep(
      groupings_sf |>
        sf::st_union(),
      nrow(
        x |>
          dplyr::filter(.data$KOMGRP %in% hele_landet)
        )
      )
  )

  cli::cli_inform(c("i" = "Assigning geometry to entire Denmark."))
  # Merge data with geometries
  denmark <- x |>
    dplyr::filter(.data$KOMGRP %in% hele_landet) |>
    sf::st_sf(geometry = dk_sf)

  cli::cli_inform(c("i" = "Merging data."))
  # row-bind all observations and geometries
  out <- rbind(
    denmark,
    groupings,
    individuals
  )

  # cli::cli_inform(c("i" = "Assigning the proper class."))
  # Return data.frame - Essentially strips all other classes
  # structure(
  #   out,
  #   class = "data.frame"
  # )
  class(out) <- "data.frame"

  out
}
