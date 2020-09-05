#' Add style properties to all selected atoms
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param sel Atom selection specification
#' @param style style spec to add to specified atoms
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
addStyle <- function(id, sel = list(), style = list()) {
  if(missing(style)) {
    stop("The `style` argument must be passed.")
  }
  method <- "addStyle"
  callJS()
}

#' Create and add arrow shape
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param spec Style specification
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
addArrow <- function(id, spec = list()) {
  method <- "addArrow" # TODO Callback function need fixed
  callJS()
}

#' Create and add model to viewer
#'
#' Given multimodel file and its format, all atoms are added to one model
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param data Input data
#' @param format Input format
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
addAsOneMolecule <- function(id, data, format) {
  data <- readLines(data) # TODO Need refactor
  method <- "addAsOneMolecule"
  callJS()
}

#' Create and add box shape
#'
#' This method provides a shorthand way to create a box shape object
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param spec Box shape style specification
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
addBox <- function(id, spec = list()) {
  method <- "addBox"
  callJS()
}

#' Create and add Curve shape
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param spec Style specification
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
addCurve <- function(id, spec = list()) {
  method <- "addCurve"
  callJS()
}
