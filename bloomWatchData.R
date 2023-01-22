library(jsonlite)

base    <- "https://services5.arcgis.com/ffJESZQ7ml5P9xH7/ArcGIS/rest/services/"
survey  <- "survey123_2bd9b97d23124dbfae7df325f106039b_stakeholder/"  
feature <- "FeatureServer/0/"
query   <- "query?where=1%3D1&outFields=*&returnGeometry=true&f=json"
eurl    <- paste0(base,survey,feature,query)

data_list <- fromJSON(eurl)
att_data  <- data_list$features$attributes
geo_data  <- data_list$features$geometry
bdata     <- cbind(att_data,geo_data)

write.csv(bdata, "C:/Users/deepuser/Desktop/bloomWatch_data.csv")
