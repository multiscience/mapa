dados <- data.frame(c(-17.4942354), #Latitude 
                    c(-48.2156571), #Longitude
                    c("Pivo"), #Nome da área
                    c("<a href='https://www.youtube.com/watch?v=mTTuUGisxDk&ab_channel=BrentThorne'>meu video</a>"), #Link
                    c('<iframe width = "300", heigth = "5000", 
                      src = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Rlogo.png/274px-Rlogo.png", frameborder = "0",
                      allowfullscreen></iframe>')) #Importar imagem

names(dados) <- c("lat", "lng", "name", "Link", "video") #Nome das variávies em ordem

dados1 <- data.frame(c(-17.4886101), #Latitude
                    c(-48.2196609), #Longitude
                    c("Cão-Guia"), #Nome da área
                    c("https://www.youtube.com/watch?v=mTTuUGisxDk&ab_channel=BrentThorne"), #Link
                    c('<iframe width = "300", heigth = "300", 
                      src = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Rlogo.png/274px-Rlogo.png", frameborder = "0",
                      allowfullscreen></iframe>')) #Importar imagem

names(dados1) <- c("lat", "lng", "name", "Link", "video") #Nome das variávies em ordem

map <- leaflet(ifg) %>% 
  addTiles() %>%
  addPolygons(color = "red", 
              weight = 1,
              opacity = 0.5) %>%
  addMeasure(position = "topleft", 
             primaryLengthUnit = "meters") %>%
  addCircleMarkers(data = dados, lat = ~lat, lng = ~lng,
             popup = ~paste0("<h3 style = 'color: blue' >Hello</h3>", "<b>name:</b>",
                             name, "<br>", "<b>Link:</b>", Link, video, sep = " ")) %>%
  addCircleMarkers(data = dados1, lat = ~lat, lng = ~lng,
                   popup = ~paste0("<h3 style = 'color: blue' >Hello</h3>", "<b>name:</b>",
                                   name, "<br>", "<b>Link:</b>", Link, video, sep = " "))
map 
