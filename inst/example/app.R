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
    sliderInput(
      inputId = "set_slab",
      label = "Set slab of view",
      min = -150,
      value = c(-50, 50),
      animate = TRUE,
      step = 10,
      max = 150,
      dragRange = TRUE
    ),
    radioButtons(
      inputId = "set_projection",
      label = "Set view projection scheme",
      choices = c("perspective", "orthographic"),
      inline = TRUE
    ),
    actionButton(
      inputId = "zoom_in",
      label = "Zoom in",
      icon = icon("plus")
    ),
    actionButton(
      inputId = "zoom_out",
      label = "Zoom out",
      icon = icon("minus")
    ),
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
      m_add_model(data = pdb_6zsl, format = "pdb") %>%
      m_zoom_to()
  })

  observeEvent(input$set_background_color, {
    m_set_background_color(id = "r3dmol",
                           hex = input$set_background_color)
  })

  observeEvent(input$spin, {
    m_spin(id = "r3dmol")
  })

  observeEvent(input$zoom_out, {
    m_zoom(id = "r3dmol",
           factor = 0.7,
           animationDuration = 1000)
  })

  observeEvent(input$zoom_in, {
    m_zoom(id = "r3dmol",
           factor = 1.3,
           animationDuration = 1000)
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

  observeEvent(input$set_slab, {
    m_set_slab(id = "r3dmol",
               near = input$set_slab[1],
               far = input$set_slab[2])
  })

}

shinyApp(ui, server)