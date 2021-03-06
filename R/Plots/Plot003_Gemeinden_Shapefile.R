# ########################################################
#   Project : CAS BDA6 SCHULE
#   Purpose : plotting choropleth Plot003
#   Date    : 22-JAN-2019  
#   Author  : Thomas Luetolf
#   Version : R 3.5.1, RStudio Version 1.1.463
# ########################################################

# --------------------------------------------------------
#   load libraries
# --------------------------------------------------------

library(rgeos)
library(maptools)
library(rgdal)
library(ggplot2)
library(svglite)
library(plyr)

# --------------------------------------------------------
#   get shapes and prepare shape data
# --------------------------------------------------------

# analyze metadata of shape file (output to console)
rgdal::ogrInfo("data/shapes/Gemeinden/GEMKTLU0_PY.shp")

# read shape file and plot empty shapes for verification
gd_map <- rgdal::readOGR("data/shapes/Gemeinden/GEMKTLU0_PY.shp")
rgeos::plot(gd_map)

# index BFS_NR for shape access
gd_map <- fortify(gd_map, region = "BFS_NR")

# calculate shape centers for label positioning
gd_map_centers <- ddply(gd_map, .(id), summarize, clat = mean(lat), clong = mean(long))


# --------------------------------------------------------
#   plot 003
# --------------------------------------------------------

ggplot() +
  labs(
    title="Gemeinden des Kantons Luzern mit BFS-Nummer",
    subtitle="Plot 3: Shapefile, Quelle Geoportal Kanton Luzern",
    x=NULL,
    y=NULL) +
  geom_map (
    data = gd_dat,
    aes(map_id = BFS_NR, fill = 0, color = "black"),
    map = gd_map) + 
  expand_limits (
    x = gd_map$long,
    y = gd_map$lat) + 
  geom_text (data = gd_map_centers, aes(x = clong, y = clat, label = id)) +
  scale_fill_gradient2 (
    low="red",
    mid="white", midpoint=0,
    high="blue") + 
  scale_color_manual(values=c("grey")) +
  guides(fill = FALSE, color = FALSE)

# stretch plot output to scale before exporting to file

# save choropleth to PNG
ggsave(
  filename = "Plot003_Gemeinden_Shapefile.png",
  plot = last_plot(),
  path = "images/Plots",
  scale = 1,
  dpi = 600)

# save choropleth to SVG
ggsave(
  filename = "Plot003_Gemeinden_Shapefile.svg",
  plot = last_plot(),
  path = "images/Plots",
  scale = 1)

# --------------------------------------------------------
#   end of script
# --------------------------------------------------------

