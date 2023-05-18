
#****************************************************************************
# Script R para web mapa do Instituto Federal Goiano - campus Urutaí
# Autoria: Pedro Valasco dos Santos, Anderson Rodrigo da Silva
#****************************************************************************

# Pacotes
#install.packages("rgdal")
#install.packages("basemaps")
library(rgdal)
library(leaflet)
library(basemaps)
library(sp)
library(leafem)
library(leaflet.extras)
library(inlmisc)

#-------------------------------------------------------------------
icon.bus = makeIcon("https://raw.githubusercontent.com/arsilva87/misc/main/bus-solid.svg",
                    iconWidth = 18, iconHeight = 18)
icon.parking = makeIcon("https://raw.githubusercontent.com/arsilva87/misc/main/car-side-solid.svg",
                        iconWidth = 20, iconHeight = 20)

# ------------------------------------------------------------------
# Importar dados
campus <- readOGR("shape_campus_urutai_sirgas2000/shape_campus_urutai_sirgas2000.shp")
Encoding(campus$NAME) <- "UTF-8"
Encoding(campus$DESCRIPTIO) <- "UTF-8"
header <- htmltools::includeHTML('map_header.html')

#--------------------------------------------------------------------
mapa <- leaflet(options = leafletOptions(zoomControl = FALSE)) %>% 
  setView(lng = -48.2142, lat = -17.4877, zoom = 16) %>%
  addControl(header, position = "topright") %>%
  addTiles() %>%
  addProviderTiles("Wikimedia", group = "Mapa Padrão") %>%
  addProviderTiles("Esri.WorldImagery", group = "Terreno") %>%
  addScaleBar(position = "bottomright", 
              options = scaleBarOptions(imperial = FALSE)) %>%
  addLogo(img = "https://www.ifgoiano.edu.br/home/images/REITORIA/Imagens/2017/Jan_2017/logo_urutai.png",
          position = "bottomleft", width = "13.3%", height = "19%",
          url = "https://www.ifgoiano.edu.br/home/index.php/urutai") %>% 
  # ------------------------------------------------------------------
  # Poligonos
  # -----------------------------------------------------------------
  addPolygons(data = campus, 
            fill = ~ifelse(is.na(GROUP), FALSE, TRUE),
            color = ~GROUP,
            weight = 3,
            popup = ~paste0(ifelse(is.na(NAME),"", NAME), "</br>", 
                            ifelse(is.na(DESCRIPTIO), "", DESCRIPTIO),
                            "<img src ='", IMG,  "' style='width:300px;'/>")) %>%
  addLabelOnlyMarkers(data = campus, 
                      lng = coordinates(campus)[,1], 
                      lat = coordinates(campus)[,2], 
                      group = "setor", label = ~NAME) %>%
  # -------------------------------------------------------------------
  # Icones
  # -------------------------------------------------------------------
  addMarkers(lng = c(-48.2066311, -48.2151248), 
           lat = c(-17.4672390, -17.4872543), 
           icon = icon.bus, label = "Ponto de Ônibus", group = "Ponto de Ônibus") %>%
  addMarkers(lng = c(-48.2124913, -48.2156302, -48.2162056, -48.2169115,
                     -48.2160227, -48.2171953, -48.2149846, -48.2190501, -48.21259009), 
             lat = c(-17.4863885, -17.4889605, -17.4897119, -17.4900382, 
                     -17.4871858, -17.4883466, -17.4882556, -17.4885601, -17.48608778),
             icon = icon.parking, label = "Estacionamento", group = "Estacionamento") %>%
  # ---------------------------------------------------------------------
  # Dispositivos e Legendas
  # ---------------------------------------------------------------------
  addLayersControl(baseGroups = c("Mapa Padrão", "Terreno"),
                 overlayGroups = c("Estacionamento"),
                 options = layersControlOptions(collapsed = TRUE)) %>%
  addControlGPS(options = gpsOptions(position = "topright", activate = TRUE, 
                                     autoCenter = TRUE, maxZoom = 10, 
                                     setView = TRUE)) %>%
  AddSearchButton(group = "setor", zoom = 18,
                  textPlaceholder = "Pesquisar", 
                  position = "topright") %>%
  addLegend(position = "bottomright", labels = c("Edificações", "Prédios adm.", "Fazenda"), 
            colors = c("royalblue", "red", "green"))

mapa

#-------------------------------------------------------------------------
#htmlwidgets::saveWidget(mapa, "mapa_campus.html")
