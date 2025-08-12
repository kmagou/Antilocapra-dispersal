#### referenced https://rstudio-pubs-static.s3.amazonaws.com/576095_b15fa0a11e75437dbaa15ffdea992bab.html

library(terra)
library(ggplot2)
library(tidyterra)
library(viridis)

#get maxent data
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_combo_112_E_median")
ant_out <- rast("median_mean.asc")

#get points
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra")
points <- read.csv("pts_joint.csv")

#set theme
theme_opts <- list(
  theme(
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    panel.background = element_rect(fill = 'white', colour = NA),
    plot.background = element_rect(),
    axis.line = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    plot.title = element_text()
  )
)

#plot
ggplot() +
  geom_spatraster(data = ant_out) +
  scale_fill_viridis(option = "D", limits = c(0,1), na.value = "white") +
  geom_point(
    data = points,
    aes(LONG, LAT, group = NULL, fill = NULL),
    size = 5,
    colour = "black",
    fill = "orange",
    shape = 21
  ) +
  theme_opts

#save
setwd("C:/Users/Kat/Desktop/Antilocapra/plots")
ggsave("med_mean_112.eps", width = 17, height = 10, units = "cm")
