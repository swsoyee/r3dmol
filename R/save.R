#' Convert widgets to PNG image
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()}).
#' @param width,height image width and height.
#' @param captureDelay Image conversion delay setting. This argument is only
#' needed in some cases where the rendering is time-consuming (e.g. with
#' \code{m_add_surface()}). The default value is 2000 milliseconds. Fixed to 0
#' when immediate rendering available.
#'
#' @return Base64 encoded png image wrapped by \code{<img>} tag.
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_model(data = pdb_1j72, format = "pdb") %>%
#'   m_set_style(style = m_style_cartoon()) %>%
#'   m_zoom_to() %>%
#'   m_png()
m_png <- function(id, width, height, captureDelay = 2000) {
  method <- "pngURI"
  callJS()
}
