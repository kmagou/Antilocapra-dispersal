library(terra)
library(readr)
#library(landscapemetrics)

###LTP thresh
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/112_median_E_LTP_thresh")
rast_glyp <- rast("median_consensus_LTPthresh.asc")
plot(rast_glyp)

setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/112_median_E_LTP_thresh")
rast_ant <- rast("median_consensus_LTPthresh.asc")
plot(rast_ant)

#overall suitability
num_cells_glyp <- global(rast_glyp, fun="notNA")
num_suit_glyp <- global(rast_glyp == 1, sum, na.rm = TRUE)
percent_suit_glyp = num_suit_glyp/num_cells_glyp


num_cells_ant <- global(rast_ant, fun="notNA")
num_suit_ant <- global(rast_ant == 3, sum, na.rm = TRUE)
percent_suit_ant = num_suit_ant/num_cells_ant

#get map of countries
political2 <- vect("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/Countries data/world_countries.shp")
plot(political2)

#crop map to north and south america
countries <- crop(political2, rast_ant)
plot(countries)

#select countries to get
selected_polygons <- c("MEX", "GTM", "SLV", "HND", "NIC", "CRI", "PAN")
mod_region <- subset(countries, countries$SOV_A3 %in% selected_polygons)
plot(mod_region, border = "red", lwd = 2, add = TRUE)

#make a buffer
selected_polygons2 <- c("MEX", "GTM", "SLV", "HND", "NIC", "CRI", "PAN")
mod_region2 <- subset(countries, countries$SOV_A3 %in% selected_polygons2)
cent_buff <- aggregate(buffer(mod_region2, width = 250000))
plot(cent_buff, lwd = 2, add = TRUE)

#crop raster to buffer
glyp_crop <- crop(rast_glyp, cent_buff, mask=TRUE)
plot(glyp_crop)

ant_crop <- crop(rast_ant, cent_buff, mask=TRUE)
plot(ant_crop)

#cent am suitability
num_cells_glyp_crop <- global(glyp_crop, fun="notNA")
num_suit_glyp_crop <- global(glyp_crop == 1, sum, na.rm = TRUE)
percent_suit_glyp_crop = num_suit_glyp_crop/num_cells_glyp_crop

num_cells_ant_crop <- global(ant_crop, fun="notNA")
num_suit_ant_crop <- global(ant_crop == 3, sum, na.rm = TRUE)
percent_suit_ant_crop = num_suit_ant_crop/num_cells_ant_crop

#lsm_c_contig_cv(glyp_crop)
#lsm_c_contig_cv(ant_crop)

glyp_crop_albers <- project(glyp_crop, "EPSG:9822", method="near") 
ant_crop_albers <- project(ant_crop, "EPSG:9822", method="near") 

#lsm_c_cohesion(glyp_crop_albers, directions = 8)
#lsm_c_cohesion(ant_crop_albers, directions = 8)

setwd("C:/Users/Kat/Desktop/Antilocapra/data/fragstats")
writeRaster(glyp_crop_albers, "glyp_crop_albers_LTP.tif")
writeRaster(ant_crop_albers, "ant_crop_albers_LTP.tif")
