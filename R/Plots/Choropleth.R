# ########################################################
#   Project : CAS BDA6
#   Purpose : plotting choropleths with R
#   Date    : 18-JAN-2019  
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
rgdal::ogrInfo("shape/GEMKTLU0_PY.shp")

# read shape file and plot empty shapes for verification
gd_map <- rgdal::readOGR("shape/GEMKTLU0_PY.shp")
rgeos::plot(gd_map)

# index BFS_NR for shape access
gd_map <- fortify(gd_map, region = "BFS_NR")

# calculate shape centers for label positioning
gd_map_centers <- ddply(gd_map, .(id), summarize, clat = mean(lat), clong = mean(long))

# --------------------------------------------------------
#   1st example: unclassified data
# --------------------------------------------------------

# read in data and display metadata
gd_dat <- read.csv("data/Gemeinden_Steuern_Rank.csv")
colwise(class)(gd_dat)

# plot choropleth
ggplot() +
  labs(
    title="Steuerbelastung nach Gemeinden gemäss IAZI-Ranking",
    subtitle="Analyse der Rohdaten (Werte 1-1000, Missing Values -1000)",
    x=NULL,
    y=NULL) +
  geom_map (
    data = gd_dat,
    aes(map_id = BFS_NR, fill = Rank, color = "white"),
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

# stretch plot output to scale before exporting to file

# save choropleth to PNG
ggsave(
   filename = "ChoroplethRanks.png",
   plot = last_plot(),
   path = "image",
   scale = 1,
   dpi = 600)

# save choropleth to SVG
ggsave(
  filename = "ChoroplethRanks.svg",
  plot = last_plot(),
  path = "image",
  scale = 1)

# --------------------------------------------------------
#   2nd example: classified data
# --------------------------------------------------------

# read in data and display metadata
gd_dat <- read.csv("data/Gemeinden_Steuern_Class.csv")
colwise(class)(gd_dat)

ggplot() +
  labs(
    title="Steuerbelastung nach Gemeinden gemäss Steuereinheiten",
    subtitle="5 Klassen, gleichverteilt",
    x=NULL,
    y=NULL) +
  geom_map (
    data = gd_dat,
    aes(map_id = BFS_NR, fill = Klasse, color = "red"),
    map = gd_map) + 
  expand_limits (
    x = gd_map$long,
    y = gd_map$lat) + 
  geom_text (data = gd_map_centers, aes(x = clong, y = clat, label = id))

# stretch plot output to scale before exporting to file

# save choropleth to PNG
ggsave(
  filename = "ChoroplethClasses.png",
  plot = last_plot(),
  path = "image",
  scale = 1,
  dpi = 600)

# save choropleth to SVG
ggsave(
  filename = "ChoroplethClasses.svg",
  plot = last_plot(),
  path = "image",
  scale = 1)
# --------------------------------------------------------
#   3rd example: classified data and managed colors
# --------------------------------------------------------

# read in data and display metadata
gd_dat <- read.csv("data/Matura_Plot.csv")
colwise(class)(gd_dat)

ggplot() +
  labs(
    title="Maturanoten",
    subtitle="gerundet auf 2 Nachkommastellen",
    x=NULL,
    y=NULL) +
  geom_map (
    data = gd_dat,
    aes(map_id = BFS_NR, fill = Matura, color = "red"),
    map = gd_map) + 
  expand_limits (
    x = gd_map$long,
    y = gd_map$lat) + 
  geom_text (data = gd_map_centers, aes(x = clong, y = clat, label = id))

# stretch plot output to scale before exporting to file

# save choropleth to PNG
ggsave(
  filename = "ChoroplethMatura.png",
  plot = last_plot(),
  path = "image",
  scale = 1,
  dpi = 600)

# save choropleth to SVG
ggsave(
  filename = "ChoroplethMatura.svg",
  plot = last_plot(),
  path = "image",
  scale = 1)

# --------------------------------------------------------
#   end of script
# --------------------------------------------------------

