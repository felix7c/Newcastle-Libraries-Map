#Data from:
# https://data.gov.uk/dataset/a0b8b599-ef64-456f-98e6-5b7bfe531c52/newcastle-libraries-buildings

library(ggplot2)
library(ggmap)

#import data (directly from the webpage it is downloaded from)
ncl_libs = read.csv('https://datamillnorth.org/download/ncclibs-buildings/a433cc16-aa77-4325-a17c-7bc79eb07fc7/libraries_ncc-libraries-current_csv.csv')

#locations and info of 13 libraries

#ncl_libs
str(ncl_libs)

#note: use lon, lat for ggmaps etc
ncl_map = get_stamenmap(bbox = c(left = -1.8, bottom = 54.93, right =
                                   -1.5, top = 55.05), zoom = 12, maptype = "terrain") 

#plotting map:
ggmap(ncl_map)+
  geom_point(aes(Longitude, Latitude,size=No.of.PCs,color=Type),data=ncl_libs)+
  geom_text(aes(Longitude, Latitude, label=Library, color=Type, hjust = 0.1, vjust = 1.2),data=ncl_libs,show.legend = FALSE)+
  labs(title = "Map of Libraries in Newcastle",x="Longitude",y="Latitude", size="No. of PCs")+
  guides(colour = guide_legend(override.aes = list(size=5)))+ #make points in legend larger
  scale_color_manual(values=c("#00008b", "black", "#8B0000")) #custom colours for points
 