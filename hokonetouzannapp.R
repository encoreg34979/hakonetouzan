#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("箱根登山鉄道"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
           h3("地図を表示"),
           actionButton("action",label = "クリック")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         leafletOutput("myMap")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   observeEvent(input$action,{
     output$myMap <- renderLeaflet(
       Hakone_tozen_railway_train_station %>% leaflet() %>%
         addTiles() %>% addMarkers( ~long, ~lat,popup = ~station)
     )
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

