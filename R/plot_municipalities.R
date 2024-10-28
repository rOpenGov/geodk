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
      "København",
      "Frederiksberg",
      "Ballerup",
      "Brøndby",
      "Dragør",
      "Gentofte",
      "Gladsaxe",
      "Glostrup",
      "Herlev",
      "Albertslund",
      "Hvidovre",
      "Høje-Taastrup",
      "Lyngby-Taarbæk",
      "Rødovre",
      "Ishøj",
      "Tårnby",
      "Vallensbæk",
      "Furesø",
      "Allerød",
      "Fredensborg",
      "Helsingør",
      "Hillerød",
      "Hørsholm",
      "Rudersdal",
      "Egedal",
      "Frederikssund",
      "Greve",
      "Køge",
      "Halsnæs",
      "Roskilde",
      "Solrød",
      "Gribskov",
      "Odsherred",
      "Holbæk",
      "Faxe",
      "Kalundborg",
      "Ringsted",
      "Slagelse",
      "Stevns",
      "Sorø",
      "Lejre",
      "Lolland",
      "Næstved",
      "Guldborgsund",
      "Vordingborg",
      "Bornholm",
      "Middelfart",
      "Christiansø",
      "Assens",
      "Faaborg-Midtfyn",
      "Kerteminde",
      "Nyborg",
      "Odense",
      "Svendborg",
      "Nordfyns",
      "Langeland",
      "Ærø",
      "Haderslev",
      "Billund",
      "Sønderborg",
      "Tønder",
      "Esbjerg",
      "Fanø",
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
      "Samsø",
      "Skanderborg",
      "Aarhus",
      "Ikast-Brande",
      "Ringkøbing-Skjern",
      "Hedensted",
      "Morsø",
      "Skive",
      "Thisted",
      "Viborg",
      "Brønderslev",
      "Frederikshavn",
      "Vesthimmerlands",
      "Læsø",
      "Rebild",
      "Mariagerfjord",
      "Jammerbugt",
      "Aalborg",
      "Hjørring"
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
