#' Plot selected (or all) municipalities
#'
#' @description
#' Plot a vector of municipalities in Denmark. Just provide the name.
#'
#' @param municipality Municipality to plot. Mutiple is supported.
#'
#' @export
#' @importFrom ggplot2 ggplot theme_bw labs geom_sf aes guides
#' @importFrom rlang .data
#'
#' @returns Returns a `{ggplot2}` object and prints the plot as well.
#' @examples
#' plot_municipalities(municipality = c("Aarhus", "Favrskov"))
plot_municipalities <- function(
    municipality = c(
      "K\u00f8benhavn",
      "Frederiksberg",
      "Ballerup",
      "Br\u00f8ndby",
      "Drag\u00f8r",
      "Gentofte",
      "Gladsaxe",
      "Glostrup",
      "Herlev",
      "Albertslund",
      "Hvidovre",
      "H\u00f8je-Taastrup",
      "Lyngby-Taarb\u00e6k",
      "R\u00f8dovre",
      "Ish\u00f8j",
      "T\u00e5rnby",
      "Vallensb\u00e6k",
      "Fures\u00f8",
      "Aller\u00f8d",
      "Fredensborg",
      "Helsing\u00f8r",
      "Hiller\u00f8d",
      "H\u00f8rsholm",
      "Rudersdal",
      "Egedal",
      "Frederikssund",
      "Greve",
      "K\u00f8ge",
      "Halsn\u00e6s",
      "Roskilde",
      "Solr\u00f8d",
      "Gribskov",
      "Odsherred",
      "Holb\u00e6k",
      "Faxe",
      "Kalundborg",
      "Ringsted",
      "Slagelse",
      "Stevns",
      "Sor\u00f8",
      "Lejre",
      "Lolland",
      "N\u00e6stved",
      "Guldborgsund",
      "Vordingborg",
      "Bornholm",
      "Middelfart",
      "Christians\u00f8",
      "Assens",
      "Faaborg-Midtfyn",
      "Kerteminde",
      "Nyborg",
      "Odense",
      "Svendborg",
      "Nordfyns",
      "Langeland",
      "\u00e6r\u00f8",
      "Haderslev",
      "Billund",
      "S\u00f8nderborg",
      "T\u00f8nder",
      "Esbjerg",
      "Fan\u00f8",
      "Varde",
      "Vejen",
      "Aabenraa",
      "Fredericia",
      "Horsens",
      "Kolding",
      "Vejle",
      "Herning",
      "Holstebro",
      "Lemvig",
      "Struer",
      "Syddjurs",
      "Norddjurs",
      "Favrskov",
      "Odder",
      "Randers",
      "Silkeborg",
      "Sams\u00f8",
      "Skanderborg",
      "Aarhus",
      "Ikast-Brande",
      "Ringk\u00f8bing-Skjern",
      "Hedensted",
      "Mors\u00f8",
      "Skive",
      "Thisted",
      "Viborg",
      "Br\u00f8nderslev",
      "Frederikshavn",
      "Vesthimmerlands",
      "L\u00e6s\u00f8",
      "Rebild",
      "Mariagerfjord",
      "Jammerbugt",
      "Aalborg",
      "Hj\u00f8rring"
    )) {
  municipality <- match.arg(municipality,
                      several.ok = TRUE
  )

  if (length(municipality) == 1) {
    title_text <- municipality
  } else if (length(municipality) > 1) {
    title_text <- title_collapse(municipality)
  }

  dawaR::get_map_data("kommuner") |>
    dplyr::filter(.data$navn %in% municipality) |>
    ggplot() +
    geom_sf() +
    theme_bw() +
    labs(title = title_text)
}
