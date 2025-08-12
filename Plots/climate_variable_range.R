# Code by K. Magoulick to create a plot showing climatic ranges
# R version 4.4.1 (Race for Your Life)

library(readr)      #readr v.2.1.5      
library(dplyr)      #dplyr v.1.1.4 
library(ggplot2)    #ggplot2 v.3.5.1
library(gridExtra)  #gridExtra v.2.3

setwd("/Users/Marshall_Lab/My Drive/Dissertation_writing/Chapter 2")

#Modern data and cleaning
niche<-read.csv("niche_limits.csv")
niche

# Calculate minimums per group
min_max_values <- niche %>%
  group_by(group) %>%
  summarise(min_value_min_temp = min(Minimum.temperature.of.the.coldest.month...C.), max_value_min_temp = max(Minimum.temperature.of.the.coldest.month...C.),
            min_value_wet_precip = min(Precipitation.of.the.wettest.month..mm.), max_value_wet_precip = max(Precipitation.of.the.wettest.month..mm.),
            min_value_dry_precip = min(Precipitation.of.the.driest.month..mm.), max_value_dry_precip = max(Precipitation.of.the.driest.month..mm.))


(temp_plot <- ggplot() + 
  geom_linerange(data = min_max_values, aes(x=group, ymin=min_value_min_temp, ymax=max_value_min_temp), color = "blue",size = 1.5) +
  geom_point(data = niche, aes(x=group, y=Minimum.temperature.of.the.coldest.month...C.), color="blue", size=3) +
  theme_light() +
  labs(y = "Minimum temperature of the coldest month (\u00B0C)",
       x = "") +
  theme(legend.position = "none", axis.text = element_text(size = 12), 
        axis.title = element_text(size = 16)))

(dry_plot <- ggplot() + 
    geom_linerange(data = min_max_values, aes(x=group, ymin=min_value_dry_precip, ymax=max_value_dry_precip), color = "orange", size = 1.5) +
    geom_point(data = niche, aes(x=group, y=Precipitation.of.the.driest.month..mm.), color="orange", size=3) +
    theme_light() +
    labs(y = "Precipitation of the driest month (mm)",
         x = "") +
    theme(legend.position = "none", axis.text = element_text(size = 12), 
          axis.title = element_text(size = 16)))

(wet_plot <- ggplot() + 
    geom_linerange(data = min_max_values, aes(x=group, ymin=min_value_wet_precip, ymax=max_value_wet_precip), color = "turquoise3",size = 1.5) +
    geom_point(data = niche, aes(x=group, y=Precipitation.of.the.wettest.month..mm.), color="turquoise3", size=3) +
    theme_light() +
    labs(y = "Precipitation of the wettest month (mm)",
         x = "") +
    theme(legend.position = "none", axis.text = element_text(size = 12), 
          axis.title = element_text(size = 16)))

grid.arrange(temp_plot, dry_plot, wet_plot, ncol = 3)