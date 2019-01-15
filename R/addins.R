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
  {special} @return
  {special}
  {special} @export
  \n
  "
, special = "#'")

current_row <- function() {
  rstudioapi::getActiveDocumentContext()$selection[[1]][[1]][[1]][1]
}

#' Insert Skeleton roxygen2 documentation
#'
#' Inserts skeleton Roxygen2 documentation for a function at the current line if
#' in a document or in the console if used in the console.
#'
#' @seealso \code{\link[docthis]{doc_this}}
#'
#' @export
insert_docstring <- function() {
  # Check if text is highlighted. If yes then autofill title
  text <- rstudioapi::getActiveDocumentContext()$selection[[1]]$text
  if (text != '') {
    clean_title <- gsub("(^[[:space:]]+|[[:space:]]+$)", "", text) # trim
    clean_title <- gsub("(_|\\.)", " ", clean_title) # replace underscores and periods
    clean_title <- paste0(toupper(substr(clean_title, 1, 1)), substr(clean_title, 2, nchar(clean_title)))  # make first letter capital
    function_docstring <- sub("Title", clean_title, function_docstring)
  }

  rstudioapi::insertText(c(current_row(), 1), function_docstring)
}


