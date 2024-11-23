#' Plot a map of Denmark with given borders
#'
#' @description
#' Plot a nice map of Denmark with borders at a given level. Options to fill
#' based on area names or color borders are included. A legend guide is shown if
#' less than 15 areas are plotted.
#'
#' @param level The desired administrative geographic level for the map. Should
#'   be one of `get_levels()`
#' @param fill The desired color for the areas to be filled with. Could be
#'   either a R-friendly color (name or hex code) or `names` to fill based on
#'   the area names.
#' @param color The desired color for the area borders to be colored with. Could
#'   be either a R-friendly color (name or hex code) or `names` to fill based on
#'   the area names.
#'
#' @importFrom ggplot2 ggplot theme_bw labs geom_sf aes guides
#' @importFrom rlang .data
#' @export
#'
#' @returns Returns a ggplot object that can be manipulated as any other. The
#'   object is automatically printed.
#'
#' @examples
#' plot_denmark()
#'
#' plot_denmark(fill = "names")
#'
plot_denmark <- function(level = "regions",
                         fill = NULL,
                         color = NULL) {
  if (level %in% c("regions", "region", "regioner")) {
    type <- "regioner"
  } else if (level %in% c(
    "municipalities", "municipality",
    "kommune", "komunner"
  )) {
    type <- "kommuner"
  } else if (level %in% c(
    "postnumre", "post numre", "postal code", "postcode", "postal")) {
    type <- "postnumre"
  } else {
    type <- level
  }

  if (!is.null(fill) && fill %in% c("names", "navne")) {
    fill <- "navn"
  }
  if (!is.null(color) && color %in% c("names", "navne")) {
    color <- "navn"
  }

  map_data <- dawaR::get_map_data(type = type)

  if (is_column_in_data(map_data, fill)) {
    fill_column <- fill
    fill_color <- NULL
  } else if (!is_column_in_data(map_data, fill)) {
    fill_color <- fill
    fill_column <- NULL
  }

  if (is_column_in_data(map_data, color)) {
    color_column <- color
    color_color <- NULL
  } else if (!is_column_in_data(map_data, color)) {
    color_color <- color
    color_column <- NULL
  }

  # No color or fill
  if (is.null(c(fill, color))) {
    plot <- ggplot(data = map_data) +
      geom_sf() +
      theme_bw()
    # Fill and color is provided as colors
  } else if (!is.null(fill_color) && !is.null(color_color)) {
    plot <- plot_denmark_w_fill_color(map_data,
      fill = fill_color,
      color = color_color
    )
    # Fill and color is provided as columns
  } else if (!is.null(fill_column) && !is.null(color_column)) {
    plot <- plot_denmark_column_fill_color(map_data,
      fill_col = fill_column,
      color_col = color_column
    )
    # Fill is provided as a column and color as a color
  } else if (!is.null(fill_column) && !is.null(color_color)) {
    plot <- plot_denmark_color_column_fill(map_data,
      fill_col = fill_column,
      color = color_color
    )
    # Fill is provided as a color and color as a column
  } else if (!is.null(fill_color) && !is.null(color_column)) {
    plot <- plot_denmark_fill_column_color(map_data,
      fill = fill_color,
      color_col = color_column
    )
    # Fill is provided
  } else if (!is.null(fill) && is.null(color)) {
    # Fill is a column
    if (!is.null(fill_column)) {
      plot <- plot_denmark_column_fill(map_data, fill_col = fill_column)
      # Fill is a color
    } else if (!is.null(fill_color)) {
      plot <- plot_denmark_w_fill(map_data, fill = fill_color)
    }
    # Color is provided
  } else if (!is.null(color) && is.null(fill)) {
    # Color is a column
    if (!is.null(color_column)) {
      plot <- plot_denmark_column_color(map_data, color_col = color_column)
      # Color is a color
    } else if (!is.null(color_color)) {
      plot <- plot_denmark_w_color(map_data, color = color_color)
    }
  }


  if (!is.null(fill) && !is.null(color) && fill == color) {
    plot <- plot +
      labs(
        fill = "Areas and Borders",
        color = "Areas and Borders"
      )
  } else {
    plot <- plot +
      labs(
        fill = "Areas",
        color = "Borders"
      )
  }

  if (nrow(map_data) > 15) {
    plot <- plot +
      guides(
        fill = "none",
        color = "none"
      )
  }

  return(plot)
}

#' Print map with provided colored borders
#' @noRd
#' @param data dataframe
#' @param color color in R-friendly format. Either name or code.
#' @return Returns ggplot object with colored borders
plot_denmark_w_color <- function(data, color) {
  ggplot(data = data) +
    geom_sf(color = color) +
    theme_bw()
}

#' Print map with provided fill
#' @noRd
#' @param data dataframe
#' @param fill fill-color in R-friendly format. Either name or code.
#' @return Returns ggplot object with filled areas in desired color
plot_denmark_w_fill <- function(data, fill) {
  ggplot(data = data) +
    geom_sf(fill = fill) +
    theme_bw()
}

#' Print map with provided color and fill
#' @noRd
#' @param data dataframe
#' @param fill fill-color in R-friendly format. Either name or code.
#' @param color color in R-friendly format. Either name or code.
#' @return Returns ggplot object with filled areas in desired color
plot_denmark_w_fill_color <- function(data, fill, color) {
  ggplot(data = data) +
    geom_sf(
      fill = fill,
      color = color
    ) +
    theme_bw()
}

#' Print map with colored border based on provided column name
#' @noRd
#' @param data dataframe
#' @param color_col Column name
#' @return Returns ggplot object with colored borders based on input column
plot_denmark_column_color <- function(data, color_col) {
  ggplot(data = data) +
    geom_sf(aes(color = .data[[color_col]])) +
    theme_bw()
}

#' Print map with filled polygons based on provided column name
#' @noRd
#' @param data dataframe
#' @param fill_col Column name
#' @return Returns ggplot object with filled areas based on input column
plot_denmark_column_fill <- function(data, fill_col) {
  ggplot(data = data) +
    geom_sf(aes(fill = .data[[fill_col]])) +
    theme_bw()
}

#' Print map with filled polygons based on provided column name and colored
#'    borders based on column name
#' @noRd
#' @param data dataframe
#' @param fill_col Column name
#' @param color_col Column name
#' @return Returns ggplot object with filled areas and colored borders based on
#'    input column
plot_denmark_column_fill_color <- function(data, fill_col, color_col) {
  ggplot(data = data) +
    geom_sf(aes(
      fill = .data[[fill_col]],
      color = .data[[color_col]]
    )) +
    theme_bw()
}

#' Print map with filled polygons based on provided column name and colored
#'    borders based on provided color
#' @noRd
#' @param data dataframe
#' @param fill_col Column name
#' @param color color in R-friendly format. Either name or code.
#' @return Returns ggplot object with filled areas and colored borders based on
#'    input column
plot_denmark_color_column_fill <- function(data, fill_col, color) {
  ggplot(data = data) +
    geom_sf(aes(fill = .data[[fill_col]]),
      color = color
    ) +
    theme_bw()
}

#' Print map with filled polygons based on provided color name and colored
#'    borders based on column name
#' @noRd
#' @param data dataframe
#' @param fill color in R-friendly format. Either name or code.
#' @param color_col Column name
#' @return Returns ggplot object with filled areas and colored borders based on
#'    input column
plot_denmark_fill_column_color <- function(data, fill, color_col) {
  ggplot(data = data) +
    geom_sf(aes(color = .data[[color_col]]),
      fill = fill
    ) +
    theme_bw()
}

#' Check if column is in dataframe
#' @noRd
#' @param data dataframe
#' @param input color or column name
#' @return Returns TRUE or FALSE when checking if input is one of the column
#'    names in the provided data
is_column_in_data <- function(data, input) {
  if (is.null(input)) {
    return(FALSE)
  }

  if (input %in% colnames(data)) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}
