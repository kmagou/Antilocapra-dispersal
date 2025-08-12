### Filtering environmentally and moving data to nearest environmental cell
### Based on code from Erin Saupe
### Updated Sept 2023

library(readr)  #readr v.2.1.5
library(terra)  #terra v.1.8.54
library(rSDM)   #rSDM v.0.4.1

#Set working directory
setwd("C:/Users/Kat/Desktop/Antilocapra/data/antilocapra")

#get the data
occurrences = read_csv(file="antilocapra_rancholabrean_counts.csv", col_names=TRUE)
xy <- data.frame(cbind(occurrences$x, occurrences$y))
colnames(xy) <- c('LONG', 'LAT')

#Convert to SpatVector
shp <- locs2vect(xy, crs="4326", lon.col = "LONG", lat.col = "LAT")

#read in the environmental data that you will use in niche modelling.
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

#move points to nearest cell (use points2nearestcell_edited)
moved <- points2nearestcell(
  locs = shp,
  ras = s,
  layer = 1,
  move = TRUE,
  distance = 100000,
  table = TRUE,
  map = "base"
)

#extract the environmental data at your occurrence data and convert to a data.frame
d <- data.frame(extract(s, moved))

newdf <- na.omit(d)

#check out the data structure
head(newdf)

#function to resample your data so only one occurrence is allowed per environmental combination
is.between <- function(x, band) {
  for (k in c(2:length(band))){
    if (x >= band[k-1] & x < band[k]){
      return(k-1)
    }
  }
  return(-9999)
}


#set the columns (number of variables) to resample. Selecting everything here. 
combinated_cols<-c(ncol(newdf))

#set the resolution for each environmental variable (that is, how you want to 'split' your environmental variables). '1' indicates every value is counted as unique, whereas '2' would mean the environmental variables are grouped by values of two (e.g., temperatures of 0 and 1 degrees C would be grouped together and seen as only one unique value).
#the length of the res_bands must be no less than combinated_cols but can be more (just useless information at that point)
#try altering the resolution of each variable by changing the corresponding value in res_bands
res_bands<-c(2,2,2,2)

#give every point a band-label
newdf$label<-""
band_grid <- list()
for (i in c(1:length(res_bands))){
  band_grid<-seq(from=min(newdf[,i]),to=max(newdf[,i]) + res_bands[i], by=res_bands[i])
  for (j in c(1:dim(newdf)[1])){
    v<-newdf[j, i]
    if(newdf[j,]$label==""){
      newdf[j,]$label<-paste0(is.between(v, band_grid))
    } else {
      newdf[j,]$label<-paste(newdf[j,]$label, is.between(v, band_grid), sep = "-")
    }
  }
}

#add lat and long into the data frame
newdf$LONG <-xy$LONG
newdf$LAT <-xy$LAT

#resample the occurrence points
d_samp<-data.frame()
for (label in unique(newdf$label)){
  d_sub<-newdf[which(newdf$label==label),]
  d_samp<-rbind(d_samp, d_sub[1,]) #use this to select first occurrence in combination, otherwise use d_samp<-rbind(d_samp, sample(d_sub, n=1)) if you want to select at random
}

#plot the filtered and selected data. 
plot(newdf$LONG, newdf$LAT, pch=3)
points(d_samp$LONG, d_samp$LAT, col="red", pch=1)


#write the new filtered occurrences to a file.
setwd("C:/Users/Kat/Desktop/Antilocapra/data/antilocapra")
write.table(d_samp, file="antilocapra_filtered_env_2.csv", row.names=F, sep=",")
