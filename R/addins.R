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


rmarkdown_template_main <- function(title = "", author = "") {
  return(glue::glue(
    '
  ---
  title: "{title}"
  author: "{author}"
  date: "`r format(Sys.time(), \'%b %d, %Y\')`"
  output:
    html_document:
      fig_height: 4
      theme: yeti
      highlight: pygments
      toc: true
      toc_depth: 3
      toc_float: true
  ---

  # Packages and Setup


  # Read and Munge Data


  # Analysis
  '))
}

#' New RMarkdown
#'
#' Make a new Rmarkdown document with default settings. Users will be prompted
#' to provide a title and an author if they are not given in the arguments.
#'
#' @param title optional. The title of the new document.
#'
#' @param author optional. The author of the new document.
#'
#' @export
new_rmarkdown <- function(title, author) {
  if (missing(title))
    title <- rstudioapi::showPrompt('Title', 'Title of the new document',
                                    default = 'Title')

  if (missing(author))
    author <- rstudioapi::showPrompt('Author', 'Author of the new document',
                                     default = 'Author')

  rstudioapi::documentNew(text = rmarkdown_template_main(title, author),
                          type = 'rmarkdown')
}


#' Insert future assign
#'
#' Insert an "%<-%" future assign at the cursor.
#'
#' @export
insert_future_assign <- function() {
  cursor_position <- rstudioapi::getActiveDocumentContext()$selection[[1]][[1]][[1]]
  rstudioapi::insertText(cursor_position, "%<-%")
}
