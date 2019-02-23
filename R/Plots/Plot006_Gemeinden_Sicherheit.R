# ########################################################
#   Project : CAS BDA6 SCHULE
#   Purpose : plotting choropleth Plot006
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
rgdal::ogrInfo("data/shapes/Gemeinden/GEMKTLU0_PY.shp")

# read shape file and plot empty shapes for verification
gd_map <- rgdal::readOGR("data/shapes/Gemeinden/GEMKTLU0_PY.shp")
rgeos::plot(gd_map)

# index BFS_NR for shape access
gd_map <- fortify(gd_map, region = "BFS_NR")

# calculate shape centers for label positioning
gd_map_centers <- ddply(gd_map, .(id), summarize, clat = mean(lat), clong = mean(long))

# --------------------------------------------------------
#   plot
# --------------------------------------------------------

# read in data and display metadata
gd_dat <- read.csv("data/output/BDA6_SCHULE_Gemeinden_LU_Ranked.csv")
colwise(class)(gd_dat)

# rename data column for legend
colnames(gd_dat)[13] <- "Rank"
colwise(class)(gd_dat)

# plot choropleth
ggplot() +
  labs(
    title="Gemeinderanking LU nach Merkmal Sicherheit",
    subtitle="Plot 6: Ranks 1-83, basierend auf CH-Ranking, Missing Values gemäss Nachbarschaft",
    x=NULL,
    y=NULL) +
  geom_map (
    data = gd_dat,
    aes(map_id = GemeindeNummer, fill = Rank, color = "white"),
    map = gd_map) + 
  expand_limits (
    x = gd_map$long,
    y = gd_map$lat) + 
  geom_text (data = gd_map_centers, aes(x = clong, y = clat, label = id), color = "grey") +
  scale_color_manual(values=c("black")) +
  guides(color = FALSE)

# stretch plot output to scale before exporting to file

# save choropleth to PNG
ggsave(
  filename = "Plot006_Gemeinden_SicherheitRank.png",
  plot = last_plot(),
  path = "images/Plots",
  scale = 1,
  dpi = 600)

# save choropleth to SVG
ggsave(
  filename = "Plot006_Gemeinden_SicherheitRank.svg",
  plot = last_plot(),
  path = "images/Plots",
  scale = 1)

# --------------------------------------------------------
#   end of script
# --------------------------------------------------------

