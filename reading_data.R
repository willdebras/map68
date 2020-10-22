#reading shapes

library(geojsonio)
library(broom)
library(sp)

spdf <- geojsonio::geojson_read("elections_features.geojson",  what = "sp")


spdf_fortified <- broom::tidy(spdf) %>% dplyr::filter(!id==1)

library(ggplot2)

ggplot() +
  geom_polygon(data = spdf_fortified, aes( x = long, y = lat, group = group), fill = NA, colour = "#00abff") +
  theme_void() +
  coord_map()
