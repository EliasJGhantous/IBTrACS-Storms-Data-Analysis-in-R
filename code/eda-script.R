
# ===================================================================
# Title: Descriptive Analysis
# Description:
#   This script computes descriptive statistics, as well as 
#   various exploratory data visualizations.
# Input(s): data file 'nba2018-players.csv'
# Output(s): summary data files, and plots
# Author: Elias Junior Ghantous
# Date: 10-2-2019
# ===================================================================

library(readr)
library(dplyr)
library(ggplot2)
library(lubridate)
library(maps)
library(mapdata)

#reading in dataframe
dat <- read_csv("../data/ibtracs-2010-2015.csv", col_names = c("serial_num", "season", "num", "basin", "sub_basin", "name", "iso_time", "nature", "latitude", "longitude", "wind", "press"), skip = 1, col_types = cols(col_character(), col_integer(), col_character(), col_factor(), col_character(), col_character(), col_character(), col_character(), col_double(), col_double(), col_double(), col_double()), na = c("-999.", "-1.0", "0.0"))
dat <- as.data.frame(dat)

#sinking summary to output
sink(file = '../output/data-summary.txt')
summary(dat)
sink()

#plotting all storms trajectories
pdf(file = "../images/map-all-storms.pdf")
map <- map_data("world")
ggplot() +
  geom_polygon(data = map, aes(x = long, y = lat, group = group), fill = "antiquewhite2") +
  coord_fixed(1.3) +
  geom_point(data = dat, aes(x = longitude,y = latitude), color="purple", size = 0.01, shape = ".") + 
  geom_hline(aes(yintercept = 0), color = "red", linetype = "dashed") +
  ggtitle("Storm Cycles") +
  xlab("longitude") + ylab("latitude") +
  theme(panel.background = element_rect(fill = "lightblue"), panel.grid.major = element_blank(), panel.grid.minor = element_blank())
dev.off()

png(filename = "../images/map-all-storms.png")
map <- map_data("world")
ggplot() +
  geom_polygon(data = map, aes(x = long, y = lat, group = group), fill = "antiquewhite2") +
  coord_fixed(1.3) +
  geom_point(data = dat, aes(x = longitude,y = latitude), color="purple", size = 0.01, shape = ".") + 
  geom_hline(aes(yintercept = 0), color = "red", linetype = "dashed") +
  ggtitle("Storm Cycles") +
  xlab("longitude") + ylab("latitude") +
  theme(panel.background = element_rect(fill = "lightblue"), panel.grid.major = element_blank(), panel.grid.minor = element_blank())
dev.off()

#plotting EP and NA basins graph maps by year
pdf(file = "../images/map-ep-na-storms-by-year.pdf")
dataset <- filter(dat, basin == "NA" | basin == "EP")
map <- map_data("world")
ggplot(data = dataset) +
  geom_polygon(data = map, aes(x = long, y = lat, group = group), fill = "antiquewhite2") +
  coord_fixed(1.3) +
  geom_point(data = dataset, aes(x = longitude,y = latitude, color=wind), size = 0.01, shape =".") + 
  geom_hline(aes(yintercept = 0), color = "red", linetype = "dashed") +
  ggtitle("Storm Cycles For EP and NA Basins By Year") +
  xlab("longitude") + ylab("latitude") +
  theme(panel.background = element_rect(fill = "lightblue"), panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  facet_wrap(~season)
dev.off()

png(filename = "../images/map-ep-na-storms-by-year.png")
dataset <- filter(dat, basin == "NA" | basin == "EP")
map <- map_data("world")
ggplot(data = dataset) +
  geom_polygon(data = map, aes(x = long, y = lat, group = group), fill = "antiquewhite2") +
  coord_fixed(1.3) +
  geom_point(data = dataset, aes(x = longitude,y = latitude, color=wind), size = 0.01, shape = ".") + 
  geom_hline(aes(yintercept = 0), color = "red", linetype = "dashed") +
  ggtitle("Storm Cycles For EP and NA Basins By Year") +
  xlab("longitude") + ylab("latitude") +
  theme(panel.background = element_rect(fill = "lightblue"), panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  facet_wrap(~season)
dev.off()

#plotting EP and NA basins graph maps by month
pdf(file = "../images/map-ep-na-storms-by-month.pdf")
dataset <- filter(dat, basin == "NA" | basin == "EP")
dataset <- mutate(dataset, month_str = month(iso_time, label = TRUE))
map <- map_data("world")
ggplot(data = dataset) +
  geom_polygon(data = map, aes(x = long, y = lat, group = group), fill = "antiquewhite2") +
  coord_fixed(1.3) +
  geom_point(data = dataset, aes(x = longitude,y = latitude, color=press), size = 0.01, shape = ".") + 
  geom_hline(aes(yintercept = 0), color = "red", linetype = "dashed") +
  ggtitle("Storm Cycles For EP and NA Basins By Month") +
  xlab("longitude") + ylab("latitude") +
  theme(panel.background = element_rect(fill = "lightblue"), panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  facet_wrap(~month_str)
dev.off()

png(filename = "../images/map-ep-na-storms-by-month.png")
dataset <- filter(dat, basin == "NA" | basin == "EP")
dataset <- mutate(dataset, month_str = month(iso_time, label = TRUE))
map <- map_data("world")
ggplot(data = dataset) +
  geom_polygon(data = map, aes(x = long, y = lat, group = group), fill = "antiquewhite2") +
  coord_fixed(1.3) +
  geom_point(data = dataset, aes(x = longitude,y = latitude, color=press), size = 0.01, shape = ".") + 
  geom_hline(aes(yintercept = 0), color = "red", linetype = "dashed") +
  ggtitle("Storm Cycles For EP and NA Basins By Month") +
  xlab("longitude") + ylab("latitude") +
  theme(panel.background = element_rect(fill = "lightblue"), panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  facet_wrap(~month_str)
dev.off()