library(shiny)
library(leaflet)

url <- "http://node:8080/api/arbres"
geojson <- jsonlite::fromJSON(url,
  simplifyVector = TRUE,
  simplifyDataFrame = TRUE)
print("DEBUG GEOJSON =")
gdf <- geojson$features
new_df <- data.frame(
  arbre = gdf$propertie$nom,
  site = gdf$propertie$nom_site,
  latitude  =sapply(gdf$geometry$coordinates, `[`, 1),
  longitude  =sapply(gdf$geometry$coordinates, `[`, 2),
  year = gdf$propertie$annee
)
print(new_df)

ui <- fluidPage(
  titlePanel("Simple Leaflet Map"),
  leafletOutput("map", height = 500)
)

server <- function(input, output, session) {

  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(
        lng = 2.3522,   # Paris
        lat = 48.8566,
        zoom = 12
      ) %>%
      addMarkers(
        lng = 2.3522,
        lat = 48.8566,
        popup = "Hello from Paris!"
      )
  })

}

shinyApp(ui, server)