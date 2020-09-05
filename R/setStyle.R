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


#' Zoom current view by a constant factor
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param factor Magnification \code{numeric} factor. Values greater than \code{1} will
#' zoom in, less than one will zoom out. Default \code{2}.
#' @param animationDuration an optional parameter of milliseconds \code{numeric} that
#' denotes the duration of a zoom animation
#' @param fixedPath if \code{true} animation is constrained to
#' requested motion, overriding updates that happen during the animation
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
zoom <- function(id, factor = 2, animationDuration, fixedPath) {
  method <- "zoom"
  callJS()
}


#' Set lower and upper limit stops for zoom
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param lower limit on zoom in (positive \code{numeric} number). Default \code{0}.
#' @param upper limit on zoom out (positive \code{numeric} number). Default \code{Inf}.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
setZoomLimits <- function(id, lower = 0, upper = Inf) {
  method <- "setZoomLimits"
  callJS()
}

#' Set viewer width
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param width Width \code{numeric} in pixels
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
setWidth <- function(id, width) {
  method <- "setWidth"
  callJS()
}


#' Set viewer background color
#'
#' Set the background color (default white)
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param hex Hexcode specified background color, or standard color spec \code{character}
#' @param alpha Alpha level \code{numeric} (default \code{1.0})
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
setBackgroundColor <- function(id, hex, alpha) {
  method <- "setBackgroundColor"
  callJS()
}

#' Get viewer animate status
#'
#' Return true if viewer is currently being animated, false otherwise
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#'
#' @return \code{logical}
#' @export
#'
#' @examples
isAnimated <- function(id) { # TODO Fix return value in callJS()
  method <- "isAnimated"
  callJS()
}
