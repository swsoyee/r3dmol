library(shiny)
library(r3dmol)
library(colourpicker)

ui <- fluidPage(fluidRow(column(
  width = 12,
  titlePanel("{r3dmol} Shiny Demo"),
  tags$h3(
    "6ZSL: Crystal structure of the SARS-CoV-2 helicase at 1.94 Angstrom resolution"
  )
)),
fluidRow(column(
  width = 4,
  wellPanel(
    colourInput(
      inputId = "set_background_color",
      label = "Set background color",
      closeOnClick = TRUE,
      value = "#000000"
    ),
    selectInput(
      inputId = "set_style",
      label = "Set Style",
      choices = c("Line", "Cross", "Stick", "Sphere", "Cartoon"),
      selected = "Line"
    ),
    radioButtons(
      inputId = "set_projection",
      label = "Set view projection scheme",
      choices = c("perspective", "orthographic"),
      inline = TRUE
    ),
    actionButton(inputId = "zoom_to", label = "Zoom to"),
    actionButton(inputId = "spin", label = "Spin")
  )
),
column(
  width = 8,
  r3dmolOutput(outputId = "r3dmol", height = "600px")
)))

server <- function(input, output, session) {
  output$r3dmol <- renderR3dmol({
    r3dmol(
      cartoonQuality = 10,
      lowerZoomLimit = 50,
      upperZoomLimit = 350,
      backgroundColor = "#000000"
    ) %>%
      m_add_model(data = pdb_6zsl, format = "pdb")
  })

  observeEvent(input$set_background_color, {
    m_set_background_color(id = "r3dmol",
                           hex = input$set_background_color)
  })

  observeEvent(input$spin, {
    m_spin(id = "r3dmol")
  })

  observeEvent(input$zoom_to, {
    m_zoom_to(id = "r3dmol", animationDuration = 1000)
  })

  observeEvent(input$set_style, {
    style <- switch(
      input$set_style,
      "Line" = list(line = list()),
      "Cartoon" = list(cartoon = list()),
      "Stick" = list(stick = list()),
      "Cross" = list(cross = list()),
      "Sphere" = list(sphere = list())
    )

    m_set_style(id = "r3dmol",
                style = style)
  })

  observeEvent(input$set_projection, {
    m_set_projection(id = "r3dmol", scheme = input$set_projection)
  })

}

shinyApp(ui, server)
