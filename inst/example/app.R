library(shiny)
library(r3dmol)

ui <- fluidPage(
  actionButton(inputId = "set_background_color", label = "Set Background Color"),
  actionButton(inputId = "set_style", label = "Set Cartoon Style"),
  actionButton(inputId = "zoom_to", label = "Zoom to"),
  actionButton(inputId = "spin", label = "Spin"),
  actionButton(inputId = "stop", label = "Stop Animate"),
  r3dmolOutput(outputId = "r3dmol", height = "800px")
)

server <- function(input, output, session) {
  output$r3dmol <- renderR3dmol({
    r3dmol() %>%
      m_add_model(data = pdb_6zsl, format = "pdb")
  })

  observeEvent(input$set_background_color, {
    m_set_background_color(id = "r3dmol",
                           hex = "black",
                           alpha = "0.5")
  })

  observeEvent(input$spin, {
    m_spin(id = "r3dmol")
  })

  observeEvent(input$stop, {
    m_spin(id = "r3dmol")
  })

  observeEvent(input$zoom_to, {
    m_zoom_to(id = "r3dmol", animationDuration = 1000)
  })

  observeEvent(input$set_style, {
    m_set_style(
      id = "r3dmol",
      sel = list(chain = "A"),
      style = list(stick = list(
        radius = 0.5,
        colorscheme = "magentaCarbon"
      ))
    )
  })

}

shinyApp(ui, server)
