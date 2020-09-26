#' Initialise a WebGL-based viewer
#'
#' Create and initialize an appropriate viewer at supplied HTML element using specification in config
#'
#' @param id HTML element id of viewer.
#' @param ... Viewer input specification, see <http://3dmol.csb.pitt.edu/doc/types.html#ViewerSpec>
#' for more details.
#' @param width Fixed width for viewer (in css units). Ignored when used in a
#' Shiny app -- use the \code{width} parameter in
#' \code{\link[r3dmol]{r3dmolOutput}}.
#' It is not recommended to use this parameter because the widget knows how to
#' adjust its width automatically.
#' @param height Fixed height for viewer (in css units). It is recommended to
#' not use this parameter since the widget knows how to adjust its height
#' automatically.
#' @param elementId Use an explicit element ID for the widget (rather than an
#' automatically generated one). Ignored when used in a Shiny app.
#'
#' @import htmlwidgets
#'
#' @name init
#' @export
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_zoom_to()
#'
#' # Viewer configs setting
#' r3dmol(
#'   backgroundColor = "black",
#'   lowerZoomLimit = 1,
#'   upperZoomLimit = 350
#' ) %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_zoom_to()
r3dmol <-
  function(id = NULL,
           ...,
           width = NULL,
           height = NULL,
           elementId = NULL) {
    if (missing(id))
      id <-
        paste(format(as.hexmode(sample(256, 10, replace = TRUE) - 1), width = 2),
              collapse = "")

    if (!is.null(elementId) &&
        !grepl(pattern = "^[#,.]{0,1}[A-Za-z][0-9A-Za-z\\-\\._:]*$", elementId))
      stop("The elementId is not a validate id. Please use an id that starts with a letter.")
    # forward options using x
    x <- list(id = id,
              configs = list(...))
    # Allow a list of API functions to be called on the r3dmol after
    # initialization
    x$api <- list()

    # create widget
    widget <- htmlwidgets::createWidget(
      name = 'r3dmol',
      x,
      width = width,
      height = height,
      package = 'r3dmol',
      elementId = elementId,
      sizingPolicy = htmlwidgets::sizingPolicy(
        defaultWidth = "100%",
        knitr.figure = FALSE,
        browser.fill = TRUE,
        padding = 0
      )
    )

    return(widget)
  }

#' Shiny bindings for r3dmol
#'
#' Output and render functions for using r3dmol within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a r3dmol
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name r3dmol-shiny
#'
#' @export
r3dmolOutput <-
  function(outputId,
           width = '100%',
           height = '400px') {
    htmlwidgets::shinyWidgetOutput(outputId, 'r3dmol', width, height, package = 'r3dmol')
  }

#' @rdname r3dmol-shiny
#' @export
renderR3dmol <-
  function(expr,
           env = parent.frame(),
           quoted = FALSE) {
    if (!quoted) {
      expr <- substitute(expr)
    } # force quoted
    htmlwidgets::shinyRenderWidget(expr, r3dmolOutput, env, quoted = TRUE)
  }
