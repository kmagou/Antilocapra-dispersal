###Code for Rotating PaleoOccurrences by E. Saupe 
###adapted by KM to use sf and terra

library(readr)      #readr v.2.1.5
library(sf)         #sf v.1.0.21
library(terra)      #terra v.1.8.54
library(ggplot2)    #ggplot2 v.3.5.2

#get occurrences
setwd("C:/Users/Kat/Desktop/Antilocapra/data/antilocapra")
occurrences = read_csv(file="antilocapra_rancholabrean.csv", col_names=TRUE)

### Now convert to paleocoordinates
setwd("C:/Users/Kat/Desktop/Antilocapra/data/antilocapra/paleo_rotations")
Pts <- occurrences[c("decimal_longitude", "decimal_latitude")]
pts_geom <- vect(Pts, geom=c("decimal_longitude", "decimal_latitude"), crs="EPSG:4326", keepgeom=FALSE)

#Write shape file
writeVector(pts_geom, "antilocapra_Rancholabrean.shp", filetype="ESRI Shapefile")

##Open GPlates and perform steps
#	1	Download GPlates (https://www.gplates.org)
#	2	Download PaleoMap Data: https://www.earthbyte.org/paleomap-paleoatlas-for-gplates/
#	3	Open Gplates and go to File -> Manage Feature Collections -> on bottom left click Open file.
#	4	Using this interface, load in your occurrences (just say OK if any window pops up), which should be in the format of a shape file (see above code).
#	5	In the same interface, open the data from PaleoMaps (your plate boundaries and rotation of plates), which will be in the format .rot and .gpml (it is in the folder Paleomap Global Plate Model).
#	6	You now want to associate these data (your occurrences in the format of a shape file, and your plate boundaries). To do this, go to Features -> Assign Plate IDs
#	7	In this interface, it asks you to Specify one or more partitioning layers this is your PlatePolygon model from PaleoMaps. Click the tick box to select and then say next
#	8	In the next interface, it asks to Specify features to be partitioned. This is your occurrence shapefile data.
#	9	Click next, and then hit apply
#	10	Go to Reconstruction > Export
#	11	Select Export to a single snapshot instant. Specify your time period in Ma. Then, go to the Add Export tab on the bottom left.
#	12	In this, select reconstructed geometries in #1 and shapefiles in #2. Say OK.
#	13	Then, you are ready to export (specify folder name and position, if you want) and click export snapshot


#####To get a csv file with rotated lat/longs from the gplates shapefile 
setwd("C:/Users/Kat/Desktop/Antilocapra/data/antilocapra/paleo_rotations/antilocapra_Rancholabrean_112ka")
shp <- vect("reconstructed_0.112Ma.shp")
dat <- geom(shp)
dat <-data.frame(dat)
s2xy <- dat[c("x", "y")] 

setwd("C:/Users/Kat/Desktop/Antilocapra/data/antilocapra")
write_csv(s2xy, "antilocapra_rancholabrean_rotated.csv")

#### See spatial resolution of data

#Create grid raster with one degree cells, and label as lat-long projection
temp <- rast(ncol=360, nrow=180, xmin=-180, xmax=180, ymin=-90, ymax=90)
temp <- setValues(temp, c(1:ncell(temp)))
crs(temp) <- "+proj=longlat"

###This (above) is for 1 degree. To increase the resolution you'd need to add more columns and rows.and to decrease, you'd do fewer. 

#toggle to the directory where you have your occurrence data that has been rotated. Is it shapefile format (.shp) or csv format? This assumes csv file format.  

pts <- read_csv("antilocapra_rancholabrean_rotated.csv")

# Rename columns
names(pts)[names(pts) == "x"] <- "paleo_lng"
names(pts)[names(pts) == "y"] <- "paleo_lat"

#this specifies that the program should read the Lat / Long data as occurrence points. You will need to change 'paleo_lng' and 'paleo_lat' to be whatever the column names are for your paleo-rotated occurrences
vect_pts <- vect(pts, geom=c("paleo_lng", "paleo_lat"))

#The length (number of rows) of the csv file will tell you the number of unique occurrences you have. Note that this includes points that fall on 'NoData' values, which is fine.
x <- rasterize(pts, temp, fun='count', na.rm=TRUE)

values <- as.points(x)
counts <- geom(values)
counts <-data.frame(counts)

#write results to a csv file 
setwd("C:/Users/Kat/Desktop/Antilocapra/data/antilocapra")
write.csv(counts, "antilocapra_rancholabrean_counts.csv")

#make a map
world_map <- map_data("world")

ggplot() +
  geom_polygon(data = world_map, aes(x = long, y = lat, group = group), fill="lightgray", colour = "white") +
  geom_point(data = counts, aes(x = x, y = y), size = 2, show.legend = TRUE) +
  coord_fixed(xlim = c(min(counts$x),max(counts$x)), ylim = c(min(counts$y),max(counts$y))) 
  
###This process should be repeated for each time period of localities