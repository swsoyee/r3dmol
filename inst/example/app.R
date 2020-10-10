library(shiny)
library(r3dmol)
library(colourpicker)

ui <- fluidPage(
  fluidRow(column(
    width = 12,
    titlePanel("{r3dmol} Shiny Demo"),
  )),
  fluidRow(
    column(
      width = 3,
      wellPanel(
        colourInput(
          inputId = "set_background_color",
          label = "Set background color",
          closeOnClick = TRUE,
          value = "#000000"
        ),
        uiOutput(outputId = "select_panel"),
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
        actionButton(
          inputId = "spin",
          label = "Spin",
          icon = icon("sync-alt")
        ),
        actionButton(
          inputId = "clear",
          label = "Clear",
          icon = icon("trash-alt")
        )
      )
    ),
    column(
      width = 6,
      column(
        width = 12,
        selectizeInput(
          inputId = "select_single_model",
          label = "Select Model",
          choices = list(
            "6ZSL: Crystal structure of the SARS-CoV-2 helicase" = "6zsl",
            "Animate Sample" = "animate_sample"
          ),
        )
      ),
      r3dmolOutput(outputId = "r3dmol", height = "700px")
    ),
    column(
      width = 3,
      wellPanel(verbatimTextOutput(outputId = "props"))
    )
  )
)

server <- function(input, output, session) {
  output$r3dmol <- renderR3dmol({
    if (input$select_single_model == "6zsl") {
      return(
        r3dmol(
          cartoonQuality = 10,
          lowerZoomLimit = 50,
          upperZoomLimit = 350,
          backgroundColor = "#000000"
        ) %>%
          m_add_model(data = pdb_6zsl, format = "pdb") %>%
          m_zoom_to()
      )
    } else if (input$select_single_model == "animate_sample") {
      xyz <- "4
      * (null), Energy   -1000.0000000
      N     0.000005    0.019779   -0.000003   -0.157114    0.000052   -0.012746
      H     0.931955   -0.364989    0.000003    1.507100   -0.601158   -0.004108
      H    -0.465975   -0.364992    0.807088    0.283368    0.257996   -0.583024
      H    -0.465979   -0.364991   -0.807088    0.392764    0.342436    0.764260
      "

      r3dmol(
        cartoonQuality = 10,
        lowerZoomLimit = 50,
        upperZoomLimit = 350,
        backgroundColor = "#000000"
      ) %>%
        m_add_model(
          data = xyz,
          format = "xyz",
          options = list(vibrate = list(
            frames = 10, amplitude = 1
          ))
        ) %>%
        m_zoom_to()
    }
  })

  observeEvent(input$select_single_model, {
    output$select_panel <- renderUI({
      animate_panel <- switch(
        input$select_single_model,
        "animate_sample" = radioButtons(
          inputId = "animate",
          label = "Animate",
          choices = c(FALSE, TRUE),
          inline = TRUE
        )
      )

      tagList(
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
        sliderInput(
          inputId = "set_perceived_distance",
          label = "Set perceived distance",
          min = 0,
          max = 500,
          value = 300
        ),
        animate_panel
      )
    })
  })

  observeEvent(input$set_background_color, {
    m_set_background_color(
      id = "r3dmol",
      hex = input$set_background_color
    )
  })

  observeEvent(input$spin, {
    m_spin(id = "r3dmol")
  })

  observeEvent(input$animate, {
    if (input$animate) {
      m_animate(id = "r3dmol", list(loop = "backAndForth"))
    } else {
      m_stop_animate(id = "r3dmol")
    }
  })

  observeEvent(input$zoom_out, {
    m_zoom(
      id = "r3dmol",
      factor = 0.7,
      animationDuration = 1000
    )
  })

  observeEvent(input$zoom_in, {
    m_zoom(
      id = "r3dmol",
      factor = 1.3,
      animationDuration = 1000
    )
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

    m_set_style(
      id = "r3dmol",
      style = style
    )
  })

  observeEvent(input$set_projection, {
    m_set_projection(id = "r3dmol", scheme = input$set_projection)
  })

  observeEvent(input$clear, {
    m_clear(id = "r3dmol")
  })

  observeEvent(input$set_slab, {
    m_set_slab(
      id = "r3dmol",
      near = input$set_slab[1],
      far = input$set_slab[2]
    )
  })

  observeEvent(input$set_perceived_distance, {
    m_set_preceived_distance(id = "r3dmol", dist = input$set_perceived_distance)
  })

  output$props <- renderPrint({
    list(
      m_get_perceived_distance = input$r3dmol_get_perceived_distance
    )
  })
}

shinyApp(ui, server)
