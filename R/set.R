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
