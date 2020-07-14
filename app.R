## A basic shiny app

library(shiny)
library(ggplot2)
library(DT)

server <- function(input, output, session){
  # input <- interactive part (e.g. buttons, sliders, textfield, etc.)
  # output <- calculation
  # session <- session information (if no reactivity, you don't need 'session')
  
  # Plot
  output$plot <- renderPlot({
    ggplot(data = diamonds,
           mapping = aes(price, carat)) + geom_point()
  })
  
  # Brush
  diam <- reactive({
    user_brush <- input$user_brush
    # user_click <- input$user_click
    sel <- brushedPoints(diamonds, user_brush)
    # sel <- nearPoints(diamonds, user_click, theshold = 10, maxpoints = 5)
    return(sel)
  })
  
  # Table
  output$table <- DT:: renderDataTable(DT::datatable(diam()))
}

ui <- fluidPage(
  h1("Using the brush feature to select specific observations"),
  plotOutput(outputId = "plot", brush = "user_brush"),
  # plotOutput(outputId = "plot", click = "user_click"),
  dataTableOutput(outputId = "table")
)

shinyApp(ui = ui, server = server)