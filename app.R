## A basic shiny app
# Useful resource: https://rstudio.github.io/DT/options.html

library(shiny)
library(ggplot2)
library(DT)

server <- function(input, output, session){
  # input <- interactive part (e.g. buttons, sliders, textfield, etc.)
  # output <- calculation
  # session <- session information (if no reactivity, you don't need 'session')
  
  # data tables can both be loaded from DT and Shiny, so to state which one you will use,
  # you should use DT::renderTable()
  output$tableDT <- DT::renderDataTable(datatable(diamonds[1:1000, ],  ## diamonds is just a sample dataset
                                                  options = list(paging = F),  ## Allows for finetuning the table
                                                  rownames = F,
                                                  filter = "top") %>%
                                          ## 'Currency' styling
                                          formatCurrency(columns = "price", currency = "$") %>%
                                          formatStyle(columns = "price", color = "green") %>%
    
                                          ## 'Cut' styling
                                          formatStyle(columns = "cut",
                                                      transform = "rotateX(20deg) rotateY(5deg) rotateZ(5deg)", 
                                                      backgroundColor = styleEqual(unique(diamonds$cut), 
                                                                                   c("salmon",
                                                                                     "lightblue",
                                                                                     "grey",
                                                                                     "lightgreen", 
                                                                                     "lightpink")
                                                                                   )))
}

ui <- fluidPage(
  DT::dataTableOutput("tableDT")
)

shinyApp(ui = ui, server = server)