library(terra)
library(ggplot2)
library(tidyterra)
library(viridis)

#get maxent data LTP
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/112_median_E_LTP_thresh")
ant_out <- rast("median_consensus_LTPthresh.asc")

#get points
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra")
points <- read.csv("pts_joint.csv")


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
  theme_opts

#save
setwd("C:/Users/Kat/Desktop/Antilocapra/plots")
ggsave("LTP_112.eps", width = 17, height = 10, units = "cm")


#get maxent data MaxSSS
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/112_median_E_maxsss_thresh")
ant_out <- rast("median_consensus_maxsssthresh.asc")

ggplot() +
  geom_spatraster(data = ant_out) +
  scale_fill_continuous(low = "grey90", high = "steelblue1", na.value = "white") +
  theme_opts

#save
setwd("C:/Users/Kat/Desktop/plots")
ggsave("MaxSSS_112.eps", width = 17, height = 10, units = "cm")
