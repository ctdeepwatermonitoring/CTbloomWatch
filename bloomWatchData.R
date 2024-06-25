library(jsonlite)
library(lubridate)

base    <- "https://services5.arcgis.com/ffJESZQ7ml5P9xH7/ArcGIS/rest/services/"
survey  <- "survey123_2bd9b97d23124dbfae7df325f106039b_stakeholder/"  
feature <- "FeatureServer/0/"
cntqry  <- "query?where=1%3D1&outFields=*&returnGeometry=true&returnCountOnly=true&f=pjson&token="
rcnturl <- paste0(base,survey,feature,cntqry)
qcnt    <- fromJSON(rcnturl)$count - 1000
query   <- paste0("query?where=1%3D1&outFields=*&resultOffset=",qcnt,"&returnGeometry=true&f=json")
eurl    <- paste0(base,survey,feature,query)

data_list <- fromJSON(eurl)
att_data  <- data_list$features$attributes
geo_data  <- data_list$features$geometry
bdata     <- cbind(att_data,geo_data)

bdata$Date <- as_datetime(bdata$obsdate/1000)
bdataCT <- bdata[bdata$stateprov == "CT" | bdata$stateprov == "ct",]

write.csv(bdataCT, "C:/Users/deepuser/Desktop/bloomWatch_data_connecticut.csv")


https://services5.arcgis.com/ffJESZQ7ml5P9xH7/ArcGIS/rest/services/survey123_2bd9b97d23124dbfae7df325f106039b_stakeholder/FeatureServer/0/query?where=1%3D1&outFields=*&returnGeometry=true&returnCountOnly=true&f=pjson&token=