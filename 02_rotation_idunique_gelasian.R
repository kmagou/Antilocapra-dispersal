###Code for Rotating PaleoOccurrences by E. Saupe 
###adapted by KM to use sf and terra

library(readr)      #readr v.2.1.5
library(sf)         #sf v.1.0.21
library(terra)      #terra v.1.8.54
library(ggplot2)    #ggplot2 v.3.5.2

#get occurrences
setwd("C:/Users/Kat/Desktop/Antilocapra/data/antilocapra")
occurrences = read_csv(file="antilocapra_gelasian.csv", col_names=TRUE)

### Now convert to paleocoordinates
setwd("C:/Users/Kat/Desktop/Antilocapra/data/antilocapra/paleo_rotations")
Pts <- occurrences[c("decimal_longitude", "decimal_latitude")]
pts_geom <- vect(Pts, geom=c("decimal_longitude", "decimal_latitude"), crs="EPSG:4326", keepgeom=FALSE)

#Write shape file
writeVector(pts_geom, "antilocapra_Gelasian.shp", filetype="ESRI Shapefile")

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
setwd("C:/Users/Kat/Desktop/Antilocapra/data/antilocapra/paleo_rotations/antilocapra_Gelasian_2_194Ma")
shp <- vect("reconstructed_2.194Ma.shp")
dat <- geom(shp)
dat <-data.frame(dat)
s2xy <- dat[c("x", "y")] 

# Rename columns
names(s2xy)[names(s2xy) == "x"] <- "paleo_lng"
names(s2xy)[names(s2xy) == "y"] <- "paleo_lat"

setwd("C:/Users/Kat/Desktop/Antilocapra/data/antilocapra")
write_csv(s2xy, "antilocapra_Gelasian_rotated.csv")


