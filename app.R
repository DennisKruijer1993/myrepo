## A basic shiny app

library(shiny)

server <- function(input, output, session){
  # input <- interactive part (e.g. buttons, sliders, textfield, etc.)
  # output <- calculation
  # session <- session information (if no reactivity, you don't need 'session')
}

ui <- fluidPage(
  
  titlePanel("using Tabsets"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "s1",
                  label = "My Slider",
                  value = 1, min = 1, max = 20)
    ),
  
  mainPanel(
    tabsetPanel(
      tabPanel(title = "Tab1", "First Tab"),
      tabPanel(title = "Tab2", "Second Tab"),
      tabPanel(title = "Tab3", "Third tab")
      )
    )
  )
)

shinyApp(ui = ui, server = server)