#calculate LTP thresholds
#code from Erin Saupe

library(terra) #terra v.1.8.54
library(readr) #readr v.2.1.5

#Get 95% thresholds
##Get data
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra")
points <- read.csv("pts_joint.csv")
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_combo_112_E_median")
suitabilitySurface <- rast("Antilocapra_Set_1_112_median_M_0.9_F_lt_Set_1_E.asc") 

##Get suitability values
pointSuitabilityM <- cbind(points[,2:3],extract(suitabilitySurface, points[,2:3]))
colnames(pointSuitabilityM) <- c("Longitude", "Latitude", "ID", "SuitabilityValue")
pointSuitabilityM <- pointSuitabilityM[order(pointSuitabilityM$SuitabilityValue, na.last=NA, decreasing = T),]

#This is for top 95%. Change to preferred threshold. So for MPT, change to 1.
pointSuitabilityM <- pointSuitabilityM[1:as.integer(length(pointSuitabilityM$Longitude)*0.95),]
threshValueM <- min(pointSuitabilityM$SuitabilityValue) #save LTP threshold value for projections

##Reclassify suitability surface
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/112_median_E_LTP_thresh")
reclassifiedRasterM <- classify(suitabilitySurface,c(-Inf,threshValueM,0,threshValueM,Inf,1))
writeRaster(reclassifiedRasterM,"Antilocapra_Set_1_112_median_M_0.9_F_lt_Set_1_E_LTP_thresh.asc", overwrite = T)

plot(reclassifiedRasterM)


#Get 95% thresholds
##Get data
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra")
points <- read.csv("pts_joint.csv")
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_combo_112_E_median")
suitabilitySurface <- rast("Antilocapra_Set_1_112_median_M_1_F_lt_Set_1_E.asc") 

##Get suitability values
pointSuitabilityM <- cbind(points[,2:3],extract(suitabilitySurface, points[,2:3]))
colnames(pointSuitabilityM) <- c("Longitude", "Latitude", "ID", "SuitabilityValue")
pointSuitabilityM <- pointSuitabilityM[order(pointSuitabilityM$SuitabilityValue, na.last=NA, decreasing = T),]

#This is for top 95%. Change to preferred threshold. So for MPT, change to 1.
pointSuitabilityM <- pointSuitabilityM[1:as.integer(length(pointSuitabilityM$Longitude)*0.95),]
threshValueM <- min(pointSuitabilityM$SuitabilityValue) #save LTP threshold value for projections

##Reclassify suitability surface
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/112_median_E_LTP_thresh")
reclassifiedRasterM <- classify(suitabilitySurface,c(-Inf,threshValueM,0,threshValueM,Inf,1))
writeRaster(reclassifiedRasterM,"Antilocapra_Set_1_112_median_M_1_F_lt_Set_1_E_LTP_thresh.asc", overwrite = T)

plot(reclassifiedRasterM)
