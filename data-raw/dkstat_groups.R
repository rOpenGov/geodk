# dkstat_groups.R
# This file is found in
# https://github.com/rOpenGov/dkstat/blob/main/data-raw/dkstat_groups.R and
# https://github.com/rOpenGov/geodk/blob/main/data-raw/dkstat_groups.R. If you
# change anything in either file, please remember to change in both places.

## Municipality groups - KOMGRP
create_groups <- function(x) {

  levels <- x |>
    dplyr::filter(NIVEAU == 1) |>
    unique() |>
    dplyr::pull(name)

  id <- 0
  groups <- numeric(nrow(x))

  for (i in 1:nrow(x)) {
    if (x$NIVEAU[i] == 1) {
      id <- id + 1
    }

    groups[i] <- id
  }

  x$group <- groups
  x$level <- levels[groups]
  return(x)
}

# I have contacted the consultant in charge of the classification and requested
# a download-link / api-access to not have to distribute the csv-file alongside
# the package source code.
# https://www.dst.dk/da/Statistik/dokumentation/nomenklaturer/kommunegrupper
# komgrp <- readr::read_csv2("data-raw/komgrp.csv") |>
#   dplyr::select(KODE, NIVEAU, TITEL) |>
#   dplyr::mutate(
#     name = paste(KODE, TITEL)
#   ) |>
#   create_groups() |>
#   dplyr::group_by(level) |>
#   dplyr::filter(NIVEAU == 2) |>
#   dplyr::summarise(
#     list = list({
#       values <- TITEL
#       names(values) <- paste(KODE, TITEL, sep = " ")
#       as.list(values)
#     })
#   ) |>
#   tibble::deframe()

komgrp <- readr::read_csv2("data-raw/komgrp.csv") |>
  dplyr::select(KODE, NIVEAU, TITEL) |>
  dplyr::mutate(
    name = paste(KODE, TITEL)
  ) |>
  create_groups() |>
  dplyr::filter(NIVEAU == 2)

usethis::use_data(komgrp, compress = "xz", overwrite = TRUE, internal = TRUE)
