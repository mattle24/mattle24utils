#' Drop NA verbose
#'
#' A wraper of \code{\link{tidyr::drop_na()}} to drop NA values and give a
#' warning for how many values were dropped.
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
#' drop_na_verbose(data, -x2) # filter when any column, except x2, is NA
#' }
#'
#' @export
drop_na_verbose <- function(.data, ...) {
  starting_nrow <- nrow(.data)

  .data <- tidyr::drop_na(.data, ...)

  end_nrow <- nrow(.data)
  warning(starting_nrow - end_nrow, " missing values.", call. = FALSE)

  .data
}
