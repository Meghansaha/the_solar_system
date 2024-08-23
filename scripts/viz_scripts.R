#==============================================================================#
# Waffle Plot-------------------------------------------------------------------
#==============================================================================#
## Library Load-in----
library(waffle)
library(tidyverse)

## Create dataset for chart----
df_sun_comp <-
  tibble(
    element = c(
      rep("hydrogen", 74),
      rep("helium", 24),
      rep("trace", 2)
    )
  ) |>
  mutate(
    element = fct_infreq(element)
  ) |>
  count(element)

## Make the chart----
gg_sun_waffle <-
  df_sun_comp |>
  ggplot(aes(fill = element, values = n)) +
  scale_fill_manual(values = c(
    "hydrogen" = "#f5c542",
    "helium" = "#d97204",
    "trace" = "#b02304"
  )) +
  geom_waffle(
    color = "#000000",
    size = 3
  ) +
  theme_void() +
  theme(legend.position = "none")

## Save the chart----
ggsave(
  filename = "images/sun_waffle.png",
  plot =   gg_sun_waffle,
  bg = "transparent",
  dev = "png",
  width = 5,
  height = 5
)

#==============================================================================#
# Bar chart Plot----------------------------------------------------------------
#==============================================================================#
## Create data for plot
df_mercury_temps <-
  tibble(
    temp = c)

df_mercury_rotation |>
ggplot(aes(x = dummy, fill = label)) +
  geom_bar(
    stat = "count",
    position = "stack",
    width = .5
    ) +
  scale_fill_manual(values = c("#1a1a1a","#047006")) +
  coord_radial(inner.radius = .4, expand = FALSE)