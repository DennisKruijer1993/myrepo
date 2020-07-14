## Helpful resources: https://shiny.rstudio.com/gallery/

library(shiny)

server <- function(input, output, session){
  # input <- interactive part (e.g. buttons, sliders, textfield, etc.)
  # output <- calculation
  # session <- session information (if no reactivity, you don't need 'session')
}

ui <- navbarPage(title = "Integration of different media types",
                 
                 tabPanel("Image sourced locally",
                          tags$img(src = "logo.png",
                                   width = "100px",
                                   height = "100px")),
                 
                 tabPanel("Video sourced locally",
                          tags$video(src = "video.mp4",
                                     type = "video/mp4",
                                     controls = T,
                                     width = "900px", 
                                     hieght = "800px")),
                 
                 tabPanel("Pdf source online, Iframe",
                          tags$iframe(style = "height:600px; width:100%; scrolling=yes",
                                      src = "https://cran.r-project.org/web/packages/shiny/shiny.pdf")),
                 
                 tabPanel("Text as .txt",
                          includeText("mytxt.txt"))
)

shinyApp(ui = ui, server = server)