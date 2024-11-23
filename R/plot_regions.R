#' Plot selected (or all) regions
#'
#' @description
#' Plot a vector of regions in Denmark. Just provide the name.
#'
#' @param region Region(s) to plot
#'
#' @export
#' @importFrom ggplot2 ggplot theme_bw labs geom_sf aes guides
#' @importFrom rlang .data
#'
#' @returns Returns a `{ggplot2}` object and prints the plot as well.
#' @examples
#' plot_regions(region = c("Region Nordjylland", "Region Midtjylland"))
plot_regions <- function(
    region = c(
      "Region Nordjylland",
      "Region Midtjylland",
      "Region Syddanmark",
      "Region Hovedstaden",
      "Region Sj\u00e6lland"
    )) {
  region <- match.arg(region,
    several.ok = TRUE
  )

  if (length(region) == 1) {
    title_text <- region
  } else if (length(region) > 1) {
    title_text <- title_collapse(region)
  }

  dawaR::get_map_data("regioner") |>
    dplyr::filter(.data$navn %in% region) |>
    ggplot() +
    geom_sf() +
    theme_bw() +
    labs(title = title_text)
}
