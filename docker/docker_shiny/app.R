library(shiny)
library(leaflet)
library(leaflet.extras)
library(shinyjs)

# url <- "http://node:8080/api/arbres"
# geojson <- jsonlite::fromJSON(url,
#   simplifyVector = TRUE,
#   simplifyDataFrame = TRUE)
# print("DEBUG GEOJSON =")
# gdf <- geojson$features
# new_df <- data.frame(
#   arbre = gdf$propertie$nom,
#   site = gdf$propertie$nom_site,
#   latitude  =sapply(gdf$geometry$coordinates, `[`, 1),
#   longitude  =sapply(gdf$geometry$coordinates, `[`, 2),
#   year = gdf$propertie$annee
# )
# print(new_df)

ui <- fluidPage(
  useShinyjs(),
  tags$script(HTML("
    Shiny.addCustomMessageHandler('loadData', function(url) {
      fetch(url)
        .then(response => response.json())
        .then(data => {
          // Send data back to Shiny
          Shiny.setInputValue('geojson_data', data);
        })
        .catch(error => console.error(error));
    });
  ")),
  titlePanel("Simple Leaflet Map"),
  leafletOutput("map", height = 500)
)

server <- function(input, output, session) {

  # Trigger the fetch call
  observe({
    session$sendCustomMessage(
      "loadData",
      "http://127.0.0.1:8080/api/arbres"
    )
  })

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
        popup = "Hello from Paris!",
        clusterOptions = markerClusterOptions()
      ) %>%
      addGeoJSONv2(input$geojson_data,
      labelProperty = "nom",
      popupProperty = "nom_site",
      clusterOptions = markerClusterOptions(),
      popupOptions = popupOptions(),
      labelOptions = labelOptions()) 
      # clusterOptions = markerClusterOptions()
  })

}

shinyApp(ui, server)