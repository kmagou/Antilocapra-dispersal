#Calculate maxSSS thresholds
#code from Erin Saupe

library(terra) #terra v.1.8.54

##Get data
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_combo_112_E_median")
suitabilitySurface <- rast("Antilocapra_Set_1_112_median_M_0.9_F_lt_Set_1_E.asc") 

##Get suitability values (Maximum training sensitivity plus specificity Cloglog threshold)
threshValueM <- 0.6001

setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/112_median_E_maxsss_thresh")

##Reclassify suitability surface
reclassifiedRasterM <- classify(suitabilitySurface,c(-Inf,threshValueM,0,threshValueM,Inf,1));
writeRaster(reclassifiedRasterM,"Antilocapra_Set_1_112_median_M_0.9_F_lt_Set_1_E_maxsss_thresh.asc", overwrite = T)

plot(reclassifiedRasterM)


##Get data
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_combo_112_E_median")
suitabilitySurface <- rast("Antilocapra_Set_1_112_median_M_1_F_lt_Set_1_E.asc")

##Get suitability values (Maximum training sensitivity plus specificity Cloglog threshold)
threshValueM <- 0.5943

setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/112_median_E_maxsss_thresh")

##Reclassify suitability surface
reclassifiedRasterM <- classify(suitabilitySurface,c(-Inf,threshValueM,0,threshValueM,Inf,1));
writeRaster(reclassifiedRasterM,"Antilocapra_Set_1_112_median_M_1_F_lt_Set_1_E_maxsss_thresh.asc", overwrite = T)

plot(reclassifiedRasterM)
