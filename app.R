## A basic shiny app

library(shiny)
library(shinythemes)

server <- function(input, output, session){
  # input <- interactive part (e.g. buttons, sliders, textfield, etc.)
  # output <- calculation
  # session <- session information (if no reactivity, you don't need 'session')
}

ui <- fluidPage(themeSelector(),  # displaying different themes, replace this line when publishing with theme = shinytheme("dark)
  
  titlePanel(strong("This is the STRONG tag on the Title")),  # using strong as a direct tag
  
  sidebarLayout(
    sidebarPanel(
      withTags(  ## Using withTags allows you to omit tags$*html tag*
        div(
          b("bold text: here you see a line break, horizontal line and code"),
          br(),
          hr(),
          code("plot(lynx)")
        )
      )
    ),
    mainPanel(
      tabsetPanel(
        tabPanel(title = "Weblinks with direct tag a",
                 value = a(href="www.r-tutorials.com", "r-tutorials")),
        tabPanel(title = tags$b("Using b for bold text"),  ## tags$b to gain bold text is necessary
                 value = tags$b("a bold text")),
        tabPanel("citatations with the blockquote tag", 
                 tags$blockquote("R is Great", cite = "R programmer"))
      )
    )
  )
)

shinyApp(ui = ui, server = server)