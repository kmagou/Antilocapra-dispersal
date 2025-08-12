#getting tolerance levels from IUCN Range map

library(terra) #terra v.1.8.54

#load data
#get modern IUCN range
setwd("C:/Users/Kat/Desktop/antilocapra plots/redlist_species_data_4623cd22-fbff-42e1-a51c-0aae00c1f4ed")
suitabilitySurface <- vect("data_0.shp")

plot(suitabilitySurface)

setwd("C:/Users/Kat/Desktop/Antilocapra/data/wc2.1_10m_bio")
wet_precip = rast("wc2.1_10m_bio_13.tif")
dry_precip = rast("wc2.1_10m_bio_14.tif")
cmm = rast("wc2.1_10m_bio_6.tif")

r_brick <-c(wet_precip, dry_precip, cmm)

plot(r_brick)

#bilinear interpolation to 1 degree grid cells (so it's the same as climate model in past)
s_fine = rast(nrows=180, ncols=360, nlyrs=1, xmin=-180, xmax=180, ymin=-90, ymax=90)
s_resamp <- resample(x=r_brick, y=s_fine, method="bilinear")

##Extract Bioclim Values to determine tolerances
extracted_values <- extract(s_resamp, suitabilitySurface)
extracted_values<-na.omit(extracted_values)

##temperature
coldestmin_Min <- min(extracted_values$wc2.1_10m_bio_6)
coldestmin_Max <- max(extracted_values$wc2.1_10m_bio_6)
M_cmm <- cbind(coldestmin_Min, coldestmin_Max)

#precip dry
precipdry_Min <- min(extracted_values$wc2.1_10m_bio_14)
precipdry_Max <- max(extracted_values$wc2.1_10m_bio_14)
M_precipdry <- cbind(precipdry_Min, precipdry_Max)

#precip wet
precipwet_Min <- min(extracted_values$wc2.1_10m_bio_13)
precipwet_Max <- max(extracted_values$wc2.1_10m_bio_13)
M_precipwet <- cbind(precipwet_Min, precipwet_Max)

#save results
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra")
results <- rbind(M_cmm, M_precipdry, M_precipwet)

colnames(results) <- c("Min", "Max")
rownames(results) <- c("Coldest month min", "Precip Dry", "Precip Wet")
write.csv(results, "Modern_IUCN_tolerance.csv", row.names=T)
