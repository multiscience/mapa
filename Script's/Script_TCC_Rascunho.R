library(rgdal)
ifg = readOGR(file.choose())
ifg
plot(ifg, axes = T)
coordinates(ifg)
#ifg1 <- ifg  %>% 
# sf::st_as_sf(coords = c("lat", "lon"), # columns with geometry
#             crs = 4326) 
#plot(ifg1[,1], axes = T)

names(ifg)
ifg$Name

#install.packages("basemaps")
library(leaflet)
library(basemaps)
library(sp)

#------------------------------------------------------------------------------------
# Coordenadas GPS
   # -----------------------------------------------------------------------------------
   # Prédio LEG
   # -----------------------------------------------------------------------------------

   LEG_lat = c(-17.487608, -17.487729, -17.487537, -17.487416)
   LEG_lng = c(-48.213939, -48.214035, -48.214283, -48.214178)
   plot(LEG_lat ~ LEG_lng) 

   predio_LEG = SpatialPolygons(list(Polygons(list(Polygon(data.frame(LEG_lng, LEG_lat))), ID = '1')), 
	   proj4string = CRS("+proj=longlat +datum=WGS84 +no_defs"))
   plot(predio_LEG)

   LEG <- SpatialPolygonsDataFrame(predio_LEG, 
		data = data.frame("LEG_lng ~ LEG_lat"), match.ID = TRUE)
   plot(LEG)

   # -----------------------------------------------------------------------------------
   # Prédio Sala Prof's. Eng & Agro
   # -----------------------------------------------------------------------------------
   Prof_lat = c(-17.48796, -17.48783, -17.48749, -17.48758)
   Prof_lng = c(-48.21427, -48.21419, -48.21456, -48.21469)
   plot(Prof_lat ~ Prof_lng) 

   Prof_predio = SpatialPolygons(list(Polygons(list(Polygon(data.frame(Prof_lng, Prof_lat))), ID = '1')), 
	   proj4string = CRS("+proj=longlat +datum=WGS84 +no_defs"))
   plot(Prof_predio)

   Prof_pre <- SpatialPolygonsDataFrame(Prof_predio, 
		data = data.frame("Prof_lng ~ Prof_lat"), match.ID = TRUE)
   plot(Prof_pre)

#------------------------------------------------------------------------------------
map <- leaflet() %>% 
   addTiles("https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
            attribution = paste(
              "&copy; <a href=\"Tiles &copy; Esri &mdash; Source: Esri, i-cubed,
		   USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community",
              "&copy; <a href=\"http://cartodb.com/attributions\">CartoDB</a>")) %>%
   # -----------------------------------------------------------------------------------
   # PIVO
   # -----------------------------------------------------------------------------------
   addPolygons(data = subset(ifg, Name == "Pivo"), 
              color = 'green',
              popup = ~paste("<h3 style = 'color: blue' >Pivo</h3>",
                              "<br>", "<b>Link:</b>", 
                              "<a href='https://www.youtube.com/watch?v=mTTuUGisxDk&ab_channel=BrentThorne'>meu video</a>",
                              "<img src = 'D://OneDrive/Área de Trabalho/Pedro Valasco.jpg' />")) %>%
  # -----------------------------------------------------------------------------------
  # REFEITORIO
  # -----------------------------------------------------------------------------------
  addPolygons(data = subset(ifg, Name == "refeitorio"),
              color = 'red',
              popup = ~paste("<h3 style = 'color: blue' >Refeitório</h3>",
                             "<br>", "<b>Link:</b>", 
                             "<a href='https://www.youtube.com/watch?v=mTTuUGisxDk&ab_channel=BrentThorne'>meu video</a>",
                             "<img src = 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Rlogo.png/274px-Rlogo.png' />")) %>%
  # -----------------------------------------------------------------------------------
  # LEG
  # -----------------------------------------------------------------------------------
  addPolygons(data = LEG,
              color = 'blue',
              popup = ~paste("<h3 style = 'color: blue' >LEG</h3>",
                             "<br>", "<b>Link:</b>", 
                             "<a href='https://www.youtube.com/watch?v=mTTuUGisxDk&ab_channel=BrentThorne'>meu video</a>",
                             '<iframe width = "300", heigth = "300", 
                      	src = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Rlogo.png/274px-Rlogo.png", frameborder = "0",
                      	allowfullscreen></iframe>')) %>%
  # -----------------------------------------------------------------------------------
  # PROF'S. ENG & AGRO
  # -----------------------------------------------------------------------------------
  addPolygons(data = Prof_pre,
              color = 'blue',
              popup = ~paste("<h3 style = 'color: blue' >Pivo</h3>",
                             "<br>", "<b>Link:</b>", 
                             "<a href='https://www.youtube.com/watch?v=mTTuUGisxDk&ab_channel=BrentThorne'>meu video</a>",
                             '<iframe width = "300", heigth = "300", 
                      src = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Rlogo.png/274px-Rlogo.png", frameborder = "0",
                      allowfullscreen></iframe>'))

map
#------------------------------------------------------------------------------------

Polygon
Polygons
pesquisa = Polyg...



spgeo <- sp::SpatialPoints(x,
                           proj4string = CRS("+proj=longlat +datum=WGS84"))
plot(spgeo)
help(Polygon)

help("leaflet")

coordinates(ifg)
