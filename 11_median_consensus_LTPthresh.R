#Calculate the consensus of the median LTP thresholds

library(terra) #terra v.1.8.54

#folder with LTP thresh
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/112_median_E_LTP_thresh/touse")

path = "C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/112_median_E_LTP_thresh/touse"
file.names <- dir(path, patter=".asc")

for(i in 1:length(file.names)) {
  r <- rast(file.names[i])
  crs(r) <- "+proj=longlat +datum=WGS84 +no_defs"
}

#generate a raster stack
s <- rast(file.names)
plot(s)
s

#calculate the mean
r_mean <- app(s, mean)
plot(r_mean)

#remove any mean less than 1
r_mean[r_mean < 3] <- 0
plot(r_mean)

writeRaster(r_mean, "median_consensus_LTPthresh.asc")

####projections (repeat for each projection)
#get files
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/tfgse_median_E_LTP_thresh/touse")

path = "C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/tfgse_median_E_LTP_thresh/touse"
file.names <- dir(path, patter=".asc")

for(i in 1:length(file.names)) {
  r <- rast(file.names[i])
  crs(r) <- "+proj=longlat +datum=WGS84 +no_defs"
}

#generate a raster stack
s <- rast(file.names)
plot(s)
s

#calculate the mean
r_mean <- app(s, mean)
plot(r_mean)

#remove any mean less than 1
r_mean[r_mean < 3] <- 0
plot(r_mean)

writeRaster(r_mean, "median_consensus_LTPthresh.asc")
