#' Render current state of viewer
#'
#' Render current state of viewer, after adding/removing models,
#' applying styles, etc.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#'
#' @export
#'
#' @examples
m_render <- function(id) {
  method <- "render"
  callJS()
}
