library(shiny)
library(leaflet)

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