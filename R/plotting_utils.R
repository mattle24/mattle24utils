# Plotting functions

#' Mattle24 Theme
#'
#' This is a custom ggplot2 theme developed by @mattle24.
#'
#' @param ... Passes on additional arguments to theme()
#' @export
theme_mattle24 <- function (...) {
  requireNamespace('ggplot2', quietly = FALSE)
  theme_bw() +
  theme(
    panel.background = element_rect(fill = 'white')
    ,panel.border = element_rect(color = 'gray70', fill = NA)
    ,panel.grid.major = element_line(color = 'gray80')
    ,panel.grid.minor = element_blank()
    ,text = element_text(family = 'Dubai')
    ,plot.title = element_text(hjust = 0.5, size = 18)
    ,plot.subtitle = element_text(hjust = 0.5, size = 12, colour = 'gray54')
    ,axis.title = element_text(size = 14)
    ,axis.text = element_text(size = 10)
    ,axis.ticks = element_blank()
    ,legend.position = 'bottom'
    ,...
  )
}

# The `quick_colors` list is an internal list to store colors for `quick_color()`
quick_colors <- list(
  light_blue = '#00C5Cd'
)

#' Quick Colors
#'
#' This is a way for me to store color hex codes I frequently use for easy recall.
#'
#' @param color A character with the color(s) to return a hex code for.
#'
#' @export
quick_color <- function(color) {
  return(quick_colors[[color]])
}

#' Reorder Within Clean Labeller
#'
#' This is intended to be used with drlib::reorder_within().
#' It removes the text that drlib::reorder_within() so
#' that the axis is correctly ordered but the labels are
#' clean.
#'
#' @param labels A vector of labels given by drlib::reorder_within()
#' or something similar.
#' @param sep The seperator to split the labels on. Can only appear once in
#' each label. Default is "-_-".
#'
#' @seealso drlib::reorder_within()
#' @export
clean_labels_reorder_within <- function(labels, sep = "-_-") {
  requireNamespace('purrr', quietly = FALSE)
  purrr::map_chr(labels, function(labels) strsplit(labels, sep)[[1]][[1]])
}

