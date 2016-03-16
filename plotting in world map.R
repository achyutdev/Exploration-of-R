library(plotrix)
library(maptools)
gpclibPermit()
download.file("http://thematicmapping.org/downloads/TM_WORLD_BORDERS_SIMPL-0.3.zip",destfile="TM_WORLD_BORDERS_SIMPL-0.3.zip")
unzip("TM_WORLD_BORDERS_SIMPL-0.3.zip",exdir=getwd())
polygons <- readShapePoly("TM_WORLD_BORDERS_SIMPL-0.3.shp")


sucidal_data<- read.csv("C:/Users/Dev/Google Drive/Project Data/sucidal_data_globle_per_100 000.csv")
sucide.date.bothsex <- na.omit(sucidal_data$Both.sexes)
colorScale<-color.scale(sucide.date.bothsex,color.spec="rgb",extremes=c("white","red"),alpha=0.8)
colors.DF <- data.frame(sucide.date.bothsex,colorScale)
colors.DF <- colors.DF[with(colors.DF, order(colors.DF[,1])), ]
colors.DF$ID <- 1:nrow(colors.DF)
breaks <- seq(1,nrow(colors.DF),length.out=10)
jpeg("global_sucidal_rate.jpg",7000,5000,res=300)
plot(polygons,col=colorScale)
title("Global Sucidal Rate(per 100000)",cex.main=3)
legend.pos <- list(x=-28.52392,y=-20.59119)
legendg(legend.pos,legend=c(round(colors.DF[colors.DF$ID %in% round(breaks,0),1],2)),fill=paste(colors.DF[colors.DF$ID %in% round(breaks,0),2]),bty="n",bg=c("white"),y.intersp=0.75,title="Sucidal Rate(per 100000)",cex=0.8) 

dev.off()
