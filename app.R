### Requirements
## themeSelector
## Title: The Mining Stock Scale
## Three tabs: navbarPage
## First tab: 
# sliders -> plot with brush -> data table (use reactive)
# calculation: G1*weight1 + G2*weight2 + G3*weight3
# sliders: "wellPanel" different scales
# plot is made with ggplot2
# Downloadbutton
## Documentation
# Insert some documentation
# PDF or video (iframe)
## Data table
# currency
# grade fileds (ligthblue background)
# Symbol field: grey font

library(shiny)
library(DT)
library(ggplot2)
library(shinythemes)

ui <- fluidPage(theme = shinytheme("sandstone"),
                navbarPage(title = "The Mining Stock Scale",
                           tabPanel(title = "ADJUST YOUR MINING STOCKS"),
                           tabPanel(title = "DOCUMENTATION"),
                           tabPanel(title = "DATA TABLE WITH UNDERLYING DATA"))
                
  
)


server <- function(input, output, session){
  # input <- interactive part (e.g. buttons, sliders, textfield, etc.)
  # output <- calculation
  # session <- session information (if no reactivity, you don't need 'session')
  
  data <- read.csv2(file = "course_proj_data.csv")
}


shinyApp(ui = ui, server = server)