library(rgdal)
ifg = readOGR(file.choose())
ifg
plot(ifg, axes = T)

#ifg1 <- ifg  %>% 
 # sf::st_as_sf(coords = c("lat", "lon"), # columns with geometry
  #             crs = 4326)
#plot(ifg1[,1], axes = T)

#install.packages("leaflet")
library(leaflet)

pts <- data.frame(Latitude = -17.4942354, Longitude = -48.2156571, file = "thing")

file <- 'Captura de Tela (27).png'

map <- leaflet(ifg) %>% 
  addProviderTiles("Esri.WorldImagery") %>%
  addPolygons(color = "red", 
              weight = 1,
              opacity = 0.5,
              popup = ifg$Name) %>%
  addMeasure(position = "topleft", 
             primaryLengthUnit = "meters") %>%
  addCircleMarkers(data = pts, lng =~Longitude, lat = ~Latitude,
                  popup = paste(label = "Centro do pivo", "<img src = ", file, ">"))

map

#  addCircleMarkers(label = "Centro do pivo", lng = -48.2156571, lat = -17.4942354,
 #                   fillColor = "blue",
  ##                    fillOpacity = 1,
    #                    radius = 8) %>%
  

#  addCircleMarkers(label = "Cão guia - If Goiano", lng = -48.2196609, lat = -17.4886101,
 #                  fillColor = "blue",
  #                  fillOpacity = 1,
   #                   radius = 8)
map

install.packages("basemap") #pack basemap

#######
pts <- data.frame(Latitude = 30, Longitude = 30, file = "thing")



#file <- 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Rlogo.png/274px-Rlogo.png'
#file <- 'https://cdn2.agrobase.com.br/oportunidades/wp-content/uploads/sites/3/2008/08/vagas-engenharia-agricola.png'

leaflet() %>%
  addTiles %>%
  addCircleMarkers(data = pts, lng =~Longitude, lat = ~Latitude,
                   popup = paste0("<img src = ", file, ">"))
