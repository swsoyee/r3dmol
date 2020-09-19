callJS <- function() {
  # get the parameters from the function that have a value
  message <- Filter(function(x) !is.symbol(x), as.list(parent.frame(1)))
  session <- shiny::getDefaultReactiveDomain()

  # If a r3dmol widget was passed in, this is during a chain pipeline in the
  # initialization of the widget, so keep track of the desired function call
  # by adding it to a list of functions that should be performed when the widget
  # is ready
  if (methods::is(message$id, "r3dmol")) {
    widget <- message$id
    message$id <- NULL
    widget$x$api <- c(widget$x$api, list(message))
    return(widget)
  }
  # If an ID was passed, the widget already exists and we can simply call the
  # appropriate JS function
  else if (is.character(message$id)) {
    message$id <- session$ns(message$id)
    method <- paste0("r3dmol:", message$method)
    session$sendCustomMessage(method, message)
    return(message$id)
  } else {
    stop("The `id` argument must be either a r3dmol htmlwidget or an ID
         of a r3dmol htmlwidget.", call. = FALSE)
  }
}

#' Callback function generator
#'
#' @param elementId The same \code{elementId} set in r3dmol() for bind the callback function.
#' @param callback Callback function in string.
#'
#' @export
#'
#' @examples
#' r3dmol(elementId = "pdb_6zsl") %>% # Required to provide elementId
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_set_style(style = list(cartoon = list(color = 'spectrum'))) %>%
#'   m_add_arrow(
#'     spec = list(
#'       start = list(x = -10.0, y = 0.0, z = 0.0),
#'       end = list(x = 0.0, y = -10.0, z = 0.0),
#'       radius = 1.0,
#'       radiusRadio = 1.0,
#'       mid = 1.0,
#'       clickable = TRUE,
#'       callback = m_callback(
#'         elementId = "pdb_6zsl", # The same elementId
#'         callback = "function(){
#'           this.color.setHex(0xFF0000FF);
#'         }"
#'       )
#'     )
#'   )
m_callback <- function(elementId, callback) {
  if (missing(elementId))
    stop(
      'No elementId is provided. To bind a callback function, set the elementId in r3dmol() and pass in the same elementId.'
    )
  func <- gsub(
    pattern = "}[^}]*$",
    replacement = sprintf(
      "
      const view = HTMLWidgets.find('#%s');
      if(view){
        view.render();
      }}",
      elementId
    ),
    x = callback
  )
  htmlwidgets::JS(func)
}

#' Pipe operator
#'
#' See \link[=magrittr]{\%>\%} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL
