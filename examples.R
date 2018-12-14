## Examples
library(mattle24utils)
library(ggplot2)
library(extrafont)

# Sample Plot

ggplot(mtcars, aes(x = gear, y = wt)) +
  geom_col() +
  labs(
    title = 'How does gear affect weight?'
    ,x = 'Gear'
    ,y = 'Weight'
  ) +
  facet_wrap(~am) +
  theme_mattle24()
