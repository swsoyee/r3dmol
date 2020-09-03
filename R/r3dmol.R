#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
r3dmol <-
  function(id,
           data = NULL,
           width = NULL,
           height = NULL,
           elementId = NULL) {

    if (missing(id))
      stop("Id is missing. Please pass a unique id for generate widget.", call. = FALSE)
    if (missing(data))
      stop("Data path is missing.", call. = FALSE)
    # forward options using x
    x = list(id = id,
             data = data)

    # create widget
    htmlwidgets::createWidget(
      name = 'r3dmol',
      x,
      width = width,
      height = height,
      package = 'r3dmol',
      elementId = elementId
    )
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
