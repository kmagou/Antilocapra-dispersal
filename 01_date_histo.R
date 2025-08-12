### making a graph to analyze the date distribution for the antilocapra data and 
### creating separate csv files

# R version 4.5.0

library(readr)      #readr v.2.1.5
library(janitor)    #janitor v.2.2.1
library(ggplot2)    #ggplot2 v.3.5.2
library(tidyverse)  #tidyverse v.2.0.0

setwd("C:/Users/Kat/Desktop/Antilocapra")

#get occurrence data
occurrences = read_csv(file="data/antilocapra/Antilocapra_data.csv", col_names=TRUE)
#clean column names
occurrences <- clean_names(occurrences)

#plot of temporal duration by locality
(p <- ggplot(occurrences, aes(x = number, y = max_age_final_years)) +
  geom_segment(aes(
    xend = number,
    y = min_age_years,
    yend = max_age_years
  ),
  color = "#3b3b3b") +

  geom_point(aes(x = number, y = min_age_years), color = "Purple", size = 1) +
  geom_point(aes(x = number, y = max_age_years), color = "Dark Green", size = 1) +
  
  coord_flip() +
  theme(
    panel.grid.minor.y = element_blank(),
    panel.grid.major.y = element_blank(),
    legend.position = "none"
  ) +
  labs(x = "Location #", y = "Age (years)",))

### make a new dataframe for only occurrences in Rancholabrean
Rancholabrean = occurrences[occurrences$average_age_years > 14000 & occurrences$average_age_years < 240000, ]

### make a new dataframe for only occurrences between 1.80 and 2.588 Ma (Gelasian)
Gelasian = occurrences[occurrences$average_age_years > 1800000 & occurrences$average_age_years < 2588000, ]

### make a new dataframe for only occurrences between 2.588 and 3.60 Ma (Piacenzian)
Piacenzian = occurrences[occurrences$average_age_years > 2588000 & occurrences$average_age_years < 3600000, ]

### make a new dataframe for only occurrences between 3.60 Ma and 5.33 (Zanclean)
Zanclean = occurrences[occurrences$average_age_years > 3600000 & occurrences$average_age_years < 5330000, ]



# make a histogram of this data
(p2<-ggplot(Rancholabrean, aes(x=average_age_years)) + 
  geom_histogram(color="black", fill="white"))

# Add mean line
p2+ geom_vline(aes(xintercept=mean(average_age_years)),
              color="blue", linetype="dashed", size=1)
print(mean(Rancholabrean$average_age_years))
print(median(Rancholabrean$average_age_years))

# save as csv
setwd("C:/Users/Kat/Desktop/Antilocapra/data/antilocapra")
write_csv(x = Rancholabrean, "antilocapra_rancholabrean.csv")
write_csv(x = Gelasian, "antilocapra_gelasian.csv")
#write_csv(x = Piacenzian, "antilocapra_piacenzian.csv")
#write_csv(x = Zanclean, "antilocapra_zanclean.csv")
