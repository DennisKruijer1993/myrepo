## A basic shiny app

library(shiny)

ui <- fluidPage(
  h1("Using Reactive"),
  sliderInput(inputId = "myslider", label = "slider1", value = 1, min = 1, max = 20),
  plotOutput(outputId = "plot")
)

server <- function(input, output, session){
  # input <- interactive part (e.g. buttons, sliders, textfield, etc.)
  # output <- calculation
  # session <- session information (if no reactivity, you don't need 'session')
  data <- reactive({
    rnorm(50) * input$myslider
  })
  
  output$plot <- renderPlot({
    plot(data(), col = "red", pch = 21, bty = "n")
  })
}

shinyApp(ui = ui, server = server)