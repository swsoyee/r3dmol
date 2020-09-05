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

#' Title
#'
#' @param id
#' @param sel
#' @param style
#'
#' @return
#' @export
addStyle <- function(id, sel = list(), style = list()) {
  if(missing(style)) {
    stop("The `style` argument must be passed.")
  }
  method <- "addStyle"
  callJS()
}

#' Title
#'
#' @param id
#' @param sel
#' @param style
#'
#' @return
#' @export
setStyle <- function(id, sel = list(), style = list()) {
  if(missing(style)) {
    stop("The `style` argument must be passed.")
  }
  method <- "setStyle"
  callJS()
}

#' Continuously rotate a scene around the specified axis
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param axis Axis (\code{"x"}, \code{"y"}, \code{"z"}, \code{"vx"}, \code{"vy"}, \code{"vz"})
#' to rotate around. Default \code{"y"}. View relative (rather than model relative) axes are
#'  prefixed with \code{"v"}.
#'
#' @return R3dmol id or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
spin <- function(id, axis = "y") {
  if (!axis %in% c("x", "y", "z", "vx", "vy", "vz")) {
    stop("Unknow axis.")
  }
  method <- "spin"
  callJS()
}

#' Stop animation of all models in viewer
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#'
#' @export
#'
#' @examples
stopAnimate <- function(id) {
  method <- "stopAnimate"
  callJS()
}


#' Translate current view by x,y screen coordinates
#'
#' This pans the camera rather than translating the model.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param x Relative change \code{numeric} in view coordinates of camera
#' @param y Relative change \code{numeric} in view coordinates of camera
#' @param animationDuration an optional parameter of milliseconds \code{numeric} that
#' denotes the duration of a zoom animation
#' @param fixedPath if \code{true} animation is constrained to
#' requested motion, overriding updates that happen during the animation
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
translate <- function(id, x, y, animationDuration, fixedPath) {
  method <- "translate"
  callJS()
}

#' Translate current models by x,y screen coordinates
#'
#' This translates the models relative to the current view. It does
#' not change the center of rotation.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param x Relative change \code{numeric} in view coordinates of camera
#' @param y Relative change \code{numeric} in view coordinates of camera
#' @param animationDuration an optional parameter of milliseconds \code{numeric} that
#' denotes the duration of a zoom animation
#' @param fixedPath if \code{true} animation is constrained to
#' requested motion, overriding updates that happen during the animation
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
translateScene <- function(id, x, y, animationDuration, fixedPath) {
  method <- "translateScene"
  callJS()
}
