#' Danish regions
#'
#' A `sf` dataset providing geometry for the danish regions
#'
#' @format ## `regions`
#' An object of classes `sf` and `data.frame` with 5 rows and 8 columns:
#' \describe{
#'   \item{code}{Unique code}
#'   \item{name}{The Danish name of the region}
#'   \item{nuts2}{EU nuts division}
#'   \item{source_changed}{When was the source last changed on the data-provider's side}
#'   \item{visualcenter_x, visualcenter_y}{Visual center of the polygon in WGS84}
#'   \item{geometry}{Polygons for each region}
#'   \item{last_update}{When was the data in the package last updated by maintainers}
#' }
#' @source Provided by The Danish Agency of Climate Data
#'   https://dawadocs.dataforsyningen.dk/dok/om#vilkaar. Terms and conditions
#'   apply.
"regions"

#' Danish municipalities
#'
#' A `sf` dataset providing geometry for the danish municipalities
#'
#' @format ## `municipalities`
#' An object of classes `sf` and `data.frame` with 99 rows and 9 columns:
#' \describe{
#'   \item{code}{Unique code}
#'   \item{name}{The Danish name of the municipality}
#'   \item{region_code}{The unique code of the region that this municipality is located in}
#'   \item{region_name}{The name of the region that this municipality is located in}
#'   \item{source_changed}{When was the source last changed on the data-provider's side}
#'   \item{visualcenter_x, visualcenter_y}{Visual center of the polygon in WGS84}
#'   \item{geometry}{Polygons for each municipality}
#'   \item{last_update}{When was the data in the package last updated by maintainers}
#' }
#' @source Provided by The Danish Agency of Climate Data
#'   https://dawadocs.dataforsyningen.dk/dok/om#vilkaar. Terms and conditions
#'   apply.
"municipalities"
