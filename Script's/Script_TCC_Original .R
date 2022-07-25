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
   # Prédio LAB. ESTATÍSTICA E GEOPROCESSAMENTO
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
   # PRÉDIO PROF'S. AGRONOMIA E ENGENHARIA
   # -----------------------------------------------------------------------------------
   Prof_lat = c(-17.48796, -17.48783, -17.48747, -17.48758)
   Prof_lng = c(-48.21427, -48.21419, -48.21458, -48.21469)
   plot(Prof_lat ~ Prof_lng) 

   Prof_predio = SpatialPolygons(list(Polygons(list(Polygon(data.frame(Prof_lng, Prof_lat))), ID = '1')), 
	   proj4string = CRS("+proj=longlat +datum=WGS84 +no_defs"))
   plot(Prof_predio)

   Prof_pre <- SpatialPolygonsDataFrame(Prof_predio, 
		data = data.frame("Prof_lng ~ Prof_lat"), match.ID = TRUE)
   plot(Prof_pre)

   # -----------------------------------------------------------------------------------
   # PRÉDIO AGRONOMIA E ENGENHARIA
   # -----------------------------------------------------------------------------------
   Eng_lat = c(-17.48824, -17.48783, -17.48792, -17.48833)
   Eng_lng = c(-48.21450, -48.21495, -48.21503, -48.21456)
   plot(Eng_lat ~ Eng_lng) 

   Eng_predio = SpatialPolygons(list(Polygons(list(Polygon(data.frame(Eng_lng, Eng_lat))), ID = '1')), 
	   proj4string = CRS("+proj=longlat +datum=WGS84 +no_defs"))
   plot(Eng_predio)

   Eng_pre <- SpatialPolygonsDataFrame(Eng_predio, 
		data = data.frame("Eng_lng ~ Eng_lat"), match.ID = TRUE)
   plot(Eng_pre)

   # -----------------------------------------------------------------------------------
   # PRÉDIO BIOLOGIA
   # -----------------------------------------------------------------------------------
   Bio_lat = c(-17.48860, -17.48834, -17.48845, -17.48872)
   Bio_lng = c(-48.21483, -48.21520, -48.21528, -48.21493)
   plot(Bio_lat ~ Bio_lng) 

   Bio_predio = SpatialPolygons(list(Polygons(list(Polygon(data.frame(Bio_lng, Bio_lat))), ID = '1')), 
	   proj4string = CRS("+proj=longlat +datum=WGS84 +no_defs"))
   plot(Bio_predio)

   Bio_pre <- SpatialPolygonsDataFrame(Bio_predio, 
		data = data.frame("Bio_lng ~ Bio_lat"), match.ID = TRUE)
   plot(Bio_pre)
   # -----------------------------------------------------------------------------------
   # PRÉDIO QUÍMICA
   # -----------------------------------------------------------------------------------
   Qui_lat = c(-17.48886, -17.48899, -17.48865, -17.48854)
   Qui_lng = c(-48.21506, -48.21517, -48.21555, -48.21543)
   plot(Qui_lat ~ Qui_lng) 

   Qui_predio = SpatialPolygons(list(Polygons(list(Polygon(data.frame(Qui_lng, Qui_lat))), ID = '1')), 
	   proj4string = CRS("+proj=longlat +datum=WGS84 +no_defs"))
   plot(Qui_predio)

   Qui_pre <- SpatialPolygonsDataFrame(Qui_predio, 
		data = data.frame("Qui_lng ~ Qui_lat"), match.ID = TRUE)
   plot(Qui_pre)

#------------------------------------------------------------------------------------
map <- leaflet() %>% 
   addProviderTiles("Esri.WorldImagery") %>%
   # -----------------------------------------------------------------------------------
   # PIVO
   # -----------------------------------------------------------------------------------
   addPolygons(data = subset(ifg, Name == "Pivo"), 
	         color = 'green',
	         popup = ~paste("<h3 style = 'color: blue' >Pivô</h3>",
					"<br>", 
					"<b>Link:</b>", 
					"<a href='https://www.youtube.com/watch?v=mTTuUGisxDk&ab_channel=BrentThorne'>meu video</a>",
					"<img src = 'D://OneDrive/Área de Trabalho/Pedro Valasco.jpg'/>",
					"<p> Sistema de irrigação por pivô central (30 hectares), na qual são 
					realizados experimentos de campo. </p>")) %>%
   # -----------------------------------------------------------------------------------
   # REFEITORIO
   # -----------------------------------------------------------------------------------
   addPolygons(data = subset(ifg, Name == "refeitorio"),
               color = 'red',
               popup = ~paste("<h3 style = 'color: blue' >Refeitório</h3>",
                              "<br>", 
				      "<b>Link:</b>", 
                              "<a href='https://www.youtube.com/watch?v=mTTuUGisxDk&ab_channel=BrentThorne'>meu video</a>",
                              "<img src = 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Rlogo.png/274px-Rlogo.png' />")) %>%
   # -----------------------------------------------------------------------------------
   # INFORMATICA
   # -----------------------------------------------------------------------------------
   addPolygons(data = subset(ifg, Name == "predio da informatica"),
               color = 'blue',
               popup = ~paste("<h3 style = 'color: blue' >Informatica</h3>",
                              "<br>", 
				      "<b>Link:</b>", 
                              "<a href='https://www.youtube.com/watch?v=mTTuUGisxDk&ab_channel=BrentThorne'>meu video</a>",
                              "<img src = 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Rlogo.png/274px-Rlogo.png' />")) %>%
   # -----------------------------------------------------------------------------------
   # PROF'S. AGRONOMIA E ENGENHARIA
   # -----------------------------------------------------------------------------------
   addPolygons(data = LEG,
               color = 'blue',
               popup = ~paste("<h3 style = 'color: blue' >Lab. Estatística e Geoprocessamento</h3>",
                              "<br>", 
				      "<b>Link:</b>", 
                              "<a href='https://www.youtube.com/watch?v=mTTuUGisxDk&ab_channel=BrentThorne'>meu video</a>",
                              '<iframe width = "300", heigth = "300", 
                      	src = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Rlogo.png/274px-Rlogo.png", frameborder = "0",
                      	allowfullscreen></iframe>')) %>%
   # -----------------------------------------------------------------------------------
   # PROF'S. ENG & AGRO
   # -----------------------------------------------------------------------------------
   addPolygons(data = Prof_pre,
               color = 'blue',
               popup = ~paste("<h3 style = 'color: blue' >Sala dos professores E.A</h3>",
                              "<br>", 
				      "<b>Link:</b>", 
                              "<a href='https://www.youtube.com/watch?v=mTTuUGisxDk&ab_channel=BrentThorne'>meu video</a>",
                              '<iframe width = "300", heigth = "300", 
                      src = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Rlogo.png/274px-Rlogo.png", frameborder = "0",
                      allowfullscreen></iframe>')) %>%
   # -----------------------------------------------------------------------------------
   # PRÉDIO ENGENHARIA & AGRONOMIA
   # -----------------------------------------------------------------------------------
   addPolygons(data = Eng_pre,
               color = 'blue',
               popup = ~paste("<h3 style = 'color: blue' >Agronomia e Engenharia</h3>",
                              "<br>", 
				      "<b>Link:</b>", 
                              "<a href='https://www.youtube.com/watch?v=mTTuUGisxDk&ab_channel=BrentThorne'>meu video</a>",
                              '<iframe width = "300", heigth = "300", 
                      src = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Rlogo.png/274px-Rlogo.png", frameborder = "0",
                      allowfullscreen></iframe>')) %>%
   # -----------------------------------------------------------------------------------
   # PRÉDIO BIOLOGIA
   # -----------------------------------------------------------------------------------
   addPolygons(data = Bio_pre,
               color = 'blue',
               popup = ~paste("<h3 style = 'color: blue' >Biologia</h3>",
                              "<br>", 
				      "<b>Link:</b>", 
                              "<a href='https://www.youtube.com/watch?v=mTTuUGisxDk&ab_channel=BrentThorne'>meu video</a>",
                              '<iframe width = "300", heigth = "300", 
                      src = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Rlogo.png/274px-Rlogo.png", frameborder = "0",
                      allowfullscreen></iframe>')) %>%
   # -----------------------------------------------------------------------------------
   # PRÉDIO QUÍMICA
   # -----------------------------------------------------------------------------------
   addPolygons(data = Qui_pre,
               color = 'blue',
               popup = ~paste("<h3 style = 'color: blue' >Química</h3>",
                              "<br>", 
				      "<b>Link:</b>", 
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
names(providers)

