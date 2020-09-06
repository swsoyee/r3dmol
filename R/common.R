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

#' Resize viewer according to containing HTML element's dimensions
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#'
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' mol <- r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_zoom_to() %>%
#'   m_set_width(300)
#'
#' mol
#'
#' mol %>%
#'   m_resize()
m_resize <- function(id) {
  method <- "resize_m"
  callJS()
}

#' Enable/disable fog for content far from the camera
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param fog whether to enable or disable the fog
#'
#' @return
#' @export
#'
#' @examples
m_enable_fog <- function(id, fog = TRUE) {
  method <- "enableFog"
  callJS()
}
