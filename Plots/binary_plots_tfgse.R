library(terra)
library(ggplot2)
library(tidyterra)
library(viridis)

#get maxent data LTP
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/tfgse_median_E_LTP_thresh")
ant_out <- rast("median_consensus_LTPthresh.asc")

#get points
setwd("C:/Users/Kat/Desktop/Antilocapra/data/antilocapra")
points <- read.csv("antilocapra_Gelasian_rotated.csv")

#categorize points
rasValue = cbind(points[,1:2], extract(ant_out, points))
colnames(rasValue) <- c("Longitude", "Latitude", "ID", "Suitability")

suit = subset(rasValue, Suitability == 3)
notsuit = subset(rasValue, Suitability == 0)


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

ggplot() +
  geom_spatraster(data = ant_out) +
  scale_fill_continuous(low = "grey90", high = "steelblue1", na.value = "white") +
  geom_point(
    data = suit,
    aes(Longitude, Latitude, group = NULL, fill = NULL),
    size = 5,
    colour = "black",
    fill = "yellow",
    shape = 21
  ) +
  theme_opts

#save
setwd("C:/Users/Kat/Desktop/Antilocapra/plots")
ggsave("LTP_tfgse.eps", width = 17, height = 10, units = "cm")


#get maxent data MaxSSS
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/tfgse_median_E_maxsss_thresh")
ant_out <- rast("median_consensus_maxsssthresh.asc")

#get points
setwd("C:/Users/Kat/Desktop/Antilocapra/data/antilocapra")
points <- read.csv("antilocapra_Gelasian_rotated.csv")

#categorize points
rasValue = cbind(points[,1:2], extract(ant_out, points))
colnames(rasValue) <- c("Longitude", "Latitude", "ID", "Suitability")

suit = subset(rasValue, Suitability == 3)
notsuit = subset(rasValue, Suitability == 0)

ggplot() +
  geom_spatraster(data = ant_out) +
  scale_fill_continuous(low = "grey90", high = "steelblue1", na.value = "white") +
  geom_point(
    data = suit,
    aes(Longitude, Latitude, group = NULL, fill = NULL),
    size = 5,
    colour = "black",
    fill = "yellow",
    shape = 21
  ) +
  theme_opts

#save
setwd("C:/Users/Kat/Desktop/Antilocapra/plots")
ggsave("MaxSSS_tfgse.eps", width = 17, height = 10, units = "cm")
