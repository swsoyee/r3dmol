#' Remove all labels from viewer
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#'
#' @return id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
removeAllLabels <- function(id) {
  method <- "removeAllLabels"
  callJS()
}

#' Delete all existing models
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#'
#' @return id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
removeAllModels <- function(id) {
  method <- "removeAllModels"
  callJS()
}

#' Remove all shape objects from viewer
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#'
#' @return id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#' mol <- r3dmol(data_path = pdb_6zsl) %>%
#'   addSphere(spec = list(
#'     center = list(x = 0, y = 0, z = 0),
#'     radius = 10.0,
#'     color = 'red'
#'   ))
#'
#' # Render model with shape
#' mol
#'
#' # Remove shape
#' mol %>%
#'   removeAllShapes()
removeAllShapes <- function(id) {
  method <- "removeAllShapes"
  callJS()
}

#' Remove all labels from viewer
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#'
#' @return id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
removeAllSurfaces <- function(id) {
  method <- "removeAllSurfaces"
  callJS()
}

#' Remove label from viewer
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param label R3dmol object label
#'
#' @return id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
removeLabel <- function(id, label) {
  method <- "removeLabel"
  callJS()
}
