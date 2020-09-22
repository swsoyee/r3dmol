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

#' Create and add model to viewer
#'
#' Create and add model to viewer, given molecular data and its format. If multi-model
#' file is provided, use \code{\link{m_add_models}} adding atom data to the viewer as 
#' separate models.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param data Path of input data path or a vector of data.
#' @param format Input format (\code{'pdb'}, \code{'sdf'}, \code{'xyz'}, \code{'pqr'},
#'  or \code{'mol2'}).
#' @param options Format dependent options. Attributes depend on the input file format.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#'
#' @name add_model
#' @examples
#' library(r3dmol)
#' 
#' # Single-model file with m_add_model() function
#' r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb")
#'
#' # Multi-model file with m_add_models() function
#' r3dmol() %>%
#'   m_add_models(data = sdf_multiple, "sdf") %>%
#'   m_zoom_to()
#'
#' # Multi-model file with m_add_model() function
#' r3dmol() %>%
#'   m_add_model(data = sdf_multiple, "sdf") %>%
#'   m_zoom_to()
NULL
