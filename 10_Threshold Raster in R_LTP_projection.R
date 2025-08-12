#calculate LTP thresholds
#code from Erin Saupe

library(terra) #terra v.1.8.54
library(readr) #readr v.2.1.5

#Get 95% thresholds
##Get data
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_combo_tfgse_E_median")
suitabilitySurface <- rast("Antilocapra_Set_1_tfgse_median_M_0.9_F_lt_Set_1_E.asc") 

##Get threshhold values from initial model
threshValueM <- 0.252375

##Reclassify suitability surface
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/tfgse_median_E_LTP_thresh")
reclassifiedRasterM <- classify(suitabilitySurface,c(-Inf,threshValueM,0,threshValueM,Inf,1))
writeRaster(reclassifiedRasterM,"Antilocapra_Set_1_tfgse_median_M_0.9_F_lt_Set_1_E_LTP_thresh.asc", overwrite = T)

plot(reclassifiedRasterM)


#Get 95% thresholds
##Get data
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_combo_tfgse_E_median")
suitabilitySurface <- rast("Antilocapra_Set_1_tfgse_median_M_1_F_lt_Set_1_E.asc") 

##Get threshhold values from initial model
threshValueM <- 0.204142

##Reclassify suitability surface
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/tfgse_median_E_LTP_thresh")
reclassifiedRasterM <- classify(suitabilitySurface,c(-Inf,threshValueM,0,threshValueM,Inf,1))
writeRaster(reclassifiedRasterM,"Antilocapra_Set_1_tfgse_median_M_1_F_lt_Set_1_E_LTP_thresh.asc", overwrite = T)

plot(reclassifiedRasterM)
