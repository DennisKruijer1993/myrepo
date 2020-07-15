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
                           
                           # Tab 1
                           tabPanel(title = "ADJUST YOUR MINING STOCKS",
                                    wellPanel(
                                      # Sliders
                                      sliderInput(inputId = "weight1",
                                                  label = "Weight on Grade 1",
                                                  min = 0,
                                                  max = 20,
                                                  value = 0,
                                                  step = 2),
                                      sliderInput(inputId = "weight2",
                                                  label = "Weight on Grade 2",
                                                  min = 0,
                                                  max = 20,
                                                  value = 0,
                                                  step = 2),
                                      sliderInput(inputId = "weight3", 
                                                  label = "Weight on Grade 3",
                                                  min = 0,
                                                  max = 6,
                                                  value = 0,
                                                  step = 0.6)
                                    ),
                                    
                                    # Plot
                                    plotOutput(outputId = "plot", 
                                               brush = brushOpts(id = "plot_brush"))
                                    ),
                           
                           # Tab 2
                           tabPanel(title = "DOCUMENTATION"),
                           
                           # Tab 3
                           tabPanel(title = "DATA TABLE WITH UNDERLYING DATA"))
                
  
)


server <- function(input, output, session){
  # input <- interactive part (e.g. buttons, sliders, textfield, etc.)
  # output <- calculation
  # session <- session information (if no reactivity, you don't need 'session')
  
  data <- read.csv2(file = "course_proj_data.csv")
}


shinyApp(ui = ui, server = server)