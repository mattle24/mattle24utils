.libPaths(c("C:/Users/Matt_2/Documents/R/win-library/3.5", "C:/Program Files/R/R-3.5.0/library"))
if (!require(usethis)) {
  install.packages('usethis')
}
library(usethis)
use_version(which = 'dev')
