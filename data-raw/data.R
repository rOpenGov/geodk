regions <- dawaR::get_map_data("regioner") |>
  dplyr::rename(code = kode,
                name = navn,
                last_changed = ændret,
                visualcenter_x = visueltcenter_x,
                visualcenter_y = visueltcenter_y,
                source_changed = ændret) |>
  dplyr::select(-c(dagi_id, geo_ændret, geo_version)) |>
  dplyr::mutate(last_update = lubridate::today())

usethis::use_data(regions, compress = "xz", overwrite = TRUE)

municipalities <- dawaR::get_map_data("kommuner") |>
  dplyr::rename(code = kode,
                name = navn,
                region_code = regionskode,
                region_name = regionsnavn,
                last_changed = ændret,
                visualcenter_x = visueltcenter_x,
                visualcenter_y = visueltcenter_y,
                source_changed = ændret) |>
  dplyr::select(-c(dagi_id, geo_ændret, geo_version,
                   udenforkommuneinddeling)) |>
  dplyr::mutate(last_update = lubridate::today())

usethis::use_data(municipalities, compress = "xz", overwrite = TRUE)
