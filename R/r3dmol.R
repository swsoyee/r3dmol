#' Initialise
#'
#' Initialise a 3d protein structure
#'
#' @param data_path
#'
#' @import htmlwidgets
#'
#' @name init
#' @export
r3dmol <-
  function(data_path = NULL,
           width = NULL,
           height = NULL,
           id = NULL,
           elementId = NULL) {
    # If data path is missing
    if (missing(data_path))
      stop("Data path is missing.", call. = FALSE)

    if (missing(id))
      id <- paste(format(as.hexmode(sample(256, 10, replace = TRUE) - 1), width = 2),
                  collapse = "")

    # forward options using x
    x = list(id = id,
             data = readLines(data_path)
             )
    # Allow a list of API functions to be called on the timevis after
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
