library(drake)
library(sf)
loadd(gaugep)

gsel <- list.files("D:/globalIRmap/results/forSunny_20211026", pattern=".*[.]png$") %>%
  gsub("[.]png$", "", .)

outp_gsel  <- "D:/globalIRmap/results/forSunny_20211026/gauges_anthropoIRES.gpkg"

st_write(obj=gaugep[gaugep$GAUGE_NO %in% gsel, 
                    c('HYRIV_ID', 'gsim_no', 'GRDC_NO', 
                      'POINT_X', 'POINT_Y', 'geometry',
                      'UPLAND_SKM')],
         dsn=outp_gsel,
         driver = 'gpkg',
         delete_dsn=F)
