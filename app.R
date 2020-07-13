## A basic shiny app

library(shiny)

server = function(input, output, session){
  # input <- interactive part (e.g. buttons, sliders, textfield, etc.)
  # output <- calculation
  # session <- session information (if no reactivity, you don't need 'session')
}

ui = basicPage("our first basic app")

shinyApp(ui = ui, server = server)