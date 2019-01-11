# Miscellaneous functions

#' Iff not null
#'
#' Returns the first argument if and only if not null,
#' else returns the second arguement. Comes from Hadley's
#' Advanced R: https://adv-r.hadley.nz.
#'
#' @param arg1 the first argument. Will be returned iff
#' not null.
#' @param arg2 the second argument.
#'
#' @examples
#' x <- NULL
#' x %||% 'default'
#'
#' x <- 'option1'
#' x %||% 'default'
#'
#' @rdname iff_not_null
#'
#' @export
`%||%` <- function(arg1, arg2) {
  if (!is.null(arg1))
    arg1
  else
    arh2
}
