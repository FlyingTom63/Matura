library(rgeos)
library(maptools)
library(rgdal)
library(ggplot2)
library(plyr)

# READ IN DATA
gd_dat <- read.csv("data/output/BDA6_SCHULE_Gemeinden_Plot_Rank_Steuern.csv")

# WHAT COLUMNS DO WE HAVE?
colwise(class)(gd_dat)

rgdal::ogrInfo("data/GEMKTLU0_PY.shp")

gd_map <- rgdal::readOGR("data/GEMKTLU0_PY.shp")
plot(gd_map)

gd_map <- fortify(gd_map, region = "BFS_NR")

gd_map_centers <- ddply(gd_map, .(id), summarize, clat = mean(lat), clong = mean(long))

ggplot() +
  labs(
     title="Steuerbelastung nach Gemeinden gemäss IAZI-Ranking",
     subtitle="Analyse der Rohdaten (Werte 1-1000, Missing Values -1000)",
     x=NULL,
     y=NULL) +
  geom_map (
     data = gd_dat,
     aes(map_id = BFS_NR, fill = Klasse, color = "black"),
     map = gd_map) + 
  expand_limits (
     x = gd_map$long,
     y = gd_map$lat) + 
  geom_text (data = gd_map_centers, aes(x = clong, y = clat, label = id)) +
  scale_fill_gradient2 (
     limits=c(-1000,1000),
     low="red",
     mid="white", midpoint=0,
     high="blue")



ggplot() + ggtitle(label) +
  geom_map (
    data = gd_dat,
    aes(map_id = BFS_NR, fill = MY_PRCT),
    map = gd_map) + 
  expand_limits (
    x = gd_map$long,
    y = gd_map$lat) + 
  geom_text (data = gd_map_centers, aes(x = clong, y = clat, label = id)) +
  scale_colour_discrete(name  ="Klasse",
                        breaks=c("3", "4"),
                        labels=c("3", "4")) +
  scale_shape_discrete(name  ="Klasse",
                       breaks=c("3", "4"),
                       labels=c("3", "4"))


#scale_fill_gradient2(limits=c(-20,60), low=muted("red"), mid="white", 
#                     midpoint=0, high=muted("blue"))
