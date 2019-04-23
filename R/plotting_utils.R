# Plotting functions

#' Mattle24 Theme
#'
#' This is a custom ggplot2 theme based on \code{\link{ggplot2::theme_bw()}}
#' developed by @mattle24.
#'
#' @export
theme_mattle24 <- function () {

  ggplot2::theme_bw() +
  ggplot2::theme(
    panel.background = element_rect(fill = 'white')
    ,panel.border = element_rect(color = 'gray70', fill = NA)
    ,panel.grid.major = element_line(color = 'gray80')
    ,panel.grid.minor = element_blank()
    ,plot.title = element_text(hjust = 0.5, size = 18)
    ,plot.subtitle = element_text(hjust = 0.5, size = 12, colour = 'gray54')
    ,axis.ticks = element_blank()
    ,legend.position = 'bottom'
  )
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

