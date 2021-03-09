#' Convert widgets to PNG image
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param width,height image width and height
#'
#' @return
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_model(data = pdb_1j72, format = "pdb") %>%
#'   m_set_style(style = m_style_cartoon()) %>%
#'   m_zoom_to() %>%
#'   m_png(width = 600)
m_png <- function(id, width, height) {
  method <- "pngURI"
  callJS()
}
