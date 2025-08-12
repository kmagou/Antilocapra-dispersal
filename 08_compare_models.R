#Code to combine models from Erin Saupe

library(terra) #terra v.1.8.54

#folder with best models
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_combo_112_E_median")

path = "C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_combo_112_E_median"
file.names <- dir(path, patter=".asc")

for(i in 1:length(file.names)) {
  r <- rast(file.names[i])
  crs(r) <- "+proj=longlat +datum=WGS84 +no_defs"
}

#generate a raster stack
s <- rast(file.names)
plot(s)
s

# Calculate mean
r_mean <- app(s, mean)

plot(r_mean)

writeRaster(r_mean, filename="median_mean.asc", overwrite=TRUE, NAflag=-9999)

# Calculate sd
r_sd <- app(s, sd)

plot(r_sd)

writeRaster(r_sd, filename="median_sd.asc", overwrite=TRUE, NAflag=-9999)


#Now for the projection
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_combo_tfgSe_E_median")

path = "C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_combo_tfgSe_E_median"
file.names <- dir(path, patter=".asc")

for(i in 1:length(file.names)) {
  r <- rast(file.names[i])
  crs(r) <- "+proj=longlat +datum=WGS84 +no_defs"
}

#generate a raster stack
s <- rast(file.names)
plot(s)
s

# Calculate mean
r_mean <- app(s, mean)

plot(r_mean)

writeRaster(r_mean, filename="median_mean.asc", overwrite=TRUE, NAflag=-9999)

# Calculate sd
r_sd <- app(s, sd)

plot(r_sd)

writeRaster(r_sd, filename="median_sd.asc", overwrite=TRUE, NAflag=-9999)