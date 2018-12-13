# ## Examples
# library(ggmattle24)
# library(ggplot2)
# library(extrafont)
#
# # Bar Graph ---------------------------------------------------------------
#
# ggplot(mtcars, aes(x = gear, y = wt)) +
#   geom_col() +
#   labs(
#     title = 'How does gear affect weight?'
#     ,x = 'Gear'
#     ,y = 'Weight'
#   ) +
#   theme_mattle24()
#
#
#
# # Scatterplot -------------------------------------------------------------
#
# ggplot(mtcars, aes(x = wt, y = mpg)) +
#   geom_point() +
#   labs(
#     title = 'How does weight affect MPG?'
#     ,x = 'Weight'
#     ,y = 'MPG'
#   ) +
#   theme_mattle24()
