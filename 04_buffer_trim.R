#trimming raster to buffer area

library(terra) #terra v.1.8.54
library(readr) #readr v.2.1.5

#Get environmental layers ascii files
path = "C:/Users/Kat/Desktop/Antilocapra/ascii_112_whemi/touse"
file.names <- dir(path, patter=".asc")

setwd("C:/Users/Kat/Desktop/Antilocapra/ascii_112_whemi/touse")

for(i in 1:length(file.names)) {
  r <- rast(file.names[i])
  crs(r) <- "+proj=longlat +datum=WGS84 +no_defs"
}

#generate a raster stack
s <- rast(file.names)
plot(s)
s

#get occurrence points
setwd("C:/Users/Kat/Desktop/Antilocapra/data/antilocapra")
occurrences <- read_csv(file="antilocapra_filtered_env_2.csv", col_names=TRUE)
occurrence_points <- vect(occurrences, geom = c("LONG", "LAT"), crs = "+proj=longlat +datum=WGS84")

#create a buffer around the points 500km
pres_buff <- aggregate(buffer(occurrence_points, width = 750000))
plot(pres_buff, lwd = 2)
#plot(political, lwd = 0.5, add = TRUE)
plot(occurrence_points, col = "darkgreen", add = TRUE)

#crop raster to buffer
#e <- as(pres_buff, 'Spatial')
r <- crop(s, pres_buff, mask=TRUE)
plot(r)


#save it
setwd("C:/Users/Kat/Desktop/Antilocapra/ascii_112_buffer/antilocapra_750km_env")
writeRaster(r, filename=paste(names(r), ".asc", sep = ""), overwrite=TRUE, NAflag=-9999)
