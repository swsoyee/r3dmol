#' Set viewer properties
#'
#' Functions of setting viewer properties, such as width, height, background color, etc.
#' The viewer size can be adjusted automatically under normal circumstances.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param width,height Weight and height \code{numeric} in pixels
#' @param hex Hex code specified background color, or standard color spec \code{character}
#' @param alpha Alpha level \code{numeric} (default \code{1.0})
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @name m_set_viewer
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'  m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'  m_zoom_to() %>%
#'  m_set_width(300) %>%
#'  m_set_background_color("#666666", alpha = 0.9)
NULL
