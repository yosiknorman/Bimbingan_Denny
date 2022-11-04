library(raster)
library(openxlsx)

load("~/Data_riset/kec2.Rda")
BDKI = kec[kec$Provinsi %in% c("JAWA BARAT", "DKI JAKARTA", "BANTEN"), ]
FGFG = aggregate(BDKI)
(FGFG)
bbox(BDKI)
BDKIJKT = BDKI[BDKI$Provinsi == "DKI JAKARTA", ]
BBB = bbox(BDKIJKT)
lonX = seq(BBB[1, 1], BBB[1, 2], length = 10)
latX = seq(BBB[2, 1], BBB[2, 2], length = 20)
XY = expand.grid(lonX, latX)
colnames(XY) = c("lon", "lat")
XYLab = XY
coordinates(XYLab) = ~lon+lat

IdBuang = grep(BDKIJKT$Kecamatan, pattern =   "KEPULAUAN SERIBU")
BDKIJKTNonKepSeribu =  BDKIJKT[-IdBuang,]


BBB = bbox(BDKIJKTNonKepSeribu)
lonX = seq(BBB[1, 1], BBB[1, 2], length = 5)
latX = seq(BBB[2, 1], BBB[2, 2], length = 10)
XY = expand.grid(lonX, latX)
colnames(XY) = c("lon", "lat")
XYLab = XY
coordinates(XYLab) = ~lon+lat

plot(XYLab)
plot(BDKIJKTNonKepSeribu, add = T)
write.xlsx(XYLab, file = "")