#getting tolerance levels from LTP thresholds

library(terra) #terra v.1.8.54

#load data
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/112_median_E_LTP_thresh")
suitabilitySurface <- rast("median_consensus_LTPthresh.asc")

plot(suitabilitySurface)

setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/projection/Set_1/Set_1_112")
wet_precip = rast("teitU_sed_formatted_regridded_bio13.asc")
dry_precip = rast("teitU_sed_formatted_regridded_bio14.asc")
cmm = rast("teitU_sed_formatted_regridded_cmm.asc")

r_brick <-c(suitabilitySurface, wet_precip, dry_precip, cmm)

plot(r_brick)

#Get Overall rast Stats
cells = freq(suitabilitySurface)

total = cells[1,3] + cells[2,3]
pres = cells[2,3]

percent_area = (pres/total)*100

percent_area

suitabilitySurface <- clamp(suitabilitySurface, lower=3, values=FALSE) # Sets values less than 0 to NA
plot(suitabilitySurface)

##Extract Bioclim Values to determine tolerances
ptsrastSuit <- as.points(suitabilitySurface, na.rm=TRUE)
plot(ptsrastSuit)

##temperature
geometry_data <- geom(ptsrastSuit)
coldest_min<- data.frame(Longitude = geometry_data[, 3], Latitude = geometry_data[, 4], extract(cmm, ptsrastSuit))
colnames(coldest_min) <- c("Longitude", "Latitude", "ID", "Coldest Month Min temp")
coldestmin_Min <- min(coldest_min[,4])
coldestmin_Max <- max(coldest_min[,4])
M_cmm <- cbind(coldestmin_Min, coldestmin_Max)

#precip dry
precip_dry <- data.frame(Longitude = geometry_data[, 3], Latitude = geometry_data[, 4], extract(dry_precip, ptsrastSuit))
colnames(precip_dry) <- c("Longitude", "Latitude", "ID", "Precipitation of driest month");
precipdry_Min <- min(precip_dry[,4])
precipdry_Max <- max(precip_dry[,4])
M_precipdry <- cbind(precipdry_Min, precipdry_Max)

#precip wet
precip_wet <- data.frame(Longitude = geometry_data[, 3], Latitude = geometry_data[, 4], extract(wet_precip, ptsrastSuit))
colnames(precip_wet) <- c("Longitude", "Latitude", "ID", "Precipitation of wettest month");
precipwet_Min <- min(precip_wet[,4])
precipwet_Max <- max(precip_wet[,4])
M_precipwet <- cbind(precipwet_Min, precipwet_Max)

#save results
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra")
results <- rbind(M_cmm, M_precipdry, M_precipwet)

colnames(results) <- c("Min", "Max")
rownames(results) <- c("Coldest month min", "Precip Dry", "Precip Wet")
write.csv(results, "112_consensus_tolerance_LTP.csv", row.names=T)
