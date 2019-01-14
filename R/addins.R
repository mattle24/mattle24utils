# Addins for RStudio

# This is weird because roxygen2 wants to read this string as an roxygen
# comment, so instead I need to sub `#'` in after.
function_docstring <- glue::glue(
  "
  {special} Title
  {special}
  {special} Description
  {special}
  {special} @param
  {special}
  {special} @export
  \n
  "
, special = "#'")

current_row <- function() {
  rstudioapi::getActiveDocumentContext()$selection[[1]][[1]][[1]][1]
}

#' Insert Skeleton Docstring
#'
#' Inserts a skeleton docstring for a function at the current line if in a
#' document or in the console if used in the console.
#'
#' @export
insert_docstring <- function() {
  rstudioapi::insertText(c(current_row(), 1), function_docstring)
}
