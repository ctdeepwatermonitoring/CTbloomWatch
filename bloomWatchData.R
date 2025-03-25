library(jsonlite)
library(lubridate)

## Old bloomWatch
# base    <- "https://services5.arcgis.com/ffJESZQ7ml5P9xH7/ArcGIS/rest/services/"
# survey  <- "bloomWatch_Public_view/"  
# feature <- "FeatureServer/0/"
# cntqry  <- "query?where=1%3D1&outFields=*&returnGeometry=true&returnCountOnly=true&f=pjson&token="
# rcnturl <- paste0(base,survey,feature,cntqry)
# qcnt    <- fromJSON(rcnturl)$count - 1000
# query   <- paste0("query?where=1%3D1&outFields=*&resultOffset=",qcnt,"&returnGeometry=true&f=json")
# eurl    <- paste0(base,survey,feature,query)

base    <- "https://services.arcgis.com/cJ9YHowT8TU7DUyn/ArcGIS/rest/services/"
survey  <- "bloomWatch_Public_view/"  
feature <- "FeatureServer/0/"
#where=1%3D1&outFields=* to get all data
query   <- paste0("query?where=state='Connecticut'&outFields=*&returnGeometry=true&f=json")
eurl    <- paste0(base,survey,feature,query)

data_list <- fromJSON(eurl)
att_data  <- data_list$features$attributes
geo_data  <- data_list$features$geometry
bdata     <- cbind(att_data,geo_data)

# Old bloomWatch
# bdata$Date <- as_datetime(bdata$obsdate/1000)
# bdataCT <- bdata[bdata$stateprov == "CT" | bdata$stateprov == "ct",]

write.csv(bdataCT, "C:/Users/deepuser/Desktop/bloomWatch_data_connecticut.csv")


