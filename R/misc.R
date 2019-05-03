#' Warn row difference
#'
#' Helper function to warn the differences in rows. Requires a variable
#' `starting_rows` to be in the scope.
#' @param .data A data frame or similar object.
warn_row_difference <- function(.data) {
  warning("\nDropped ", starting_nrow - nrow(.data), " rows.\n",
          call. = FALSE)
}


#' Drop NA verbose
#'
#' A wraper of \code{\link{tidyr::drop_na()}} to drop NA values and give a
#' warning for how many rows were dropped.
#'
#' @param .data A data frame or similar object.
#' @param ... A selection of columns. If empty, all variables are selected. You
#'   can supply bare variable names, select all variables between x and z with
#'   x:z, exclude y with -y. For more options, see the dplyr::select()
#'   documentation.
#'
#' @examples
#' \dontrun{
#' set.seed(0)
#' data <- tibble::tibble(.rows = 40)
#' data$x1 <- sample(c(NA_real_, 1:4), 40, replace= TRUE)
#' data$x2 <- sample(c(NA_real_, 1:4), 40, replace= TRUE)
#' drop_na_verbose(data) # filter any NA column
#' drop_na_verbose(data, x1) # filter when x1 is NA
#' drop_na_verbose(data, -x2) # filter when any column, not including x2, is NA
#' }
#'
#' @importFrom magrittr %T>%
#' @export
drop_na_verbose <- function(.data, ...) {
  if (!requireNamespace("tidyr", quietly = TRUE)) {
    stop("Package \"tidyr\" needed.", call. = FALSE)
  }

  starting_nrow <- nrow(.data)
  tidyr::drop_na(.data, ...) %T>%
    warn_row_difference
}


#' Filter verbose
#'
#' A wraper of \code{\link{dplyr::filter()}} to give a warning for how many rows
#' were dropped.
#'
#' @param .data A data frame or similar object.
#' @param ... Logical predicates defined in terms of the variables in .data.
#'   Multiple conditions are combined with &. Only rows where the condition
#'   evaluates to TRUE are kept.
#'
#' @examples
#' \dontrun{
#' set.seed(0)
#' data <- tibble::tibble(.rows = 40)
#' data$x1 <- sample(c(NA_real_, 1:4), 40, replace= TRUE)
#' filter_verbose(data, x1 > 0.5)
#' }
#'
#' @export
filter_verbose <- function(.data, ...) {
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("Package \"dplyr\" needed.", call. = FALSE)
  }

  starting_nrow <- nrow(.data)
  dplyr::filter(.data, ...) %T>%
    warn_row_difference
}
