## A basic shiny app

library(shiny)
library(DT)
library(shinythemes)

ui <- fluidPage(shinytheme(),
                
  
)


server <- function(input, output, session){
  # input <- interactive part (e.g. buttons, sliders, textfield, etc.)
  # output <- calculation
  # session <- session information (if no reactivity, you don't need 'session')
  
  data <- read.csv2(file = "course_proj_data.csv")
}


shinyApp(ui = ui, server = server)