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

#' Unit cell visualization
#' 
#' Use \code{\link{m_add_unit_cell}} to create and add unit cell visualization, 
#' and \code{\link{m_remove_unit_cell}} to remove it from model.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param model Model with unit cell information (e.g., pdb derived).
#' If omitted uses most recently added model.
#' @param spec Visualization style.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @name m_unit_cell
#'
#' @examples
#' library(r3dmol)
#'
#' # Create model
#' mol <- r3dmol() %>%
#'   m_add_model(
#'     data = cif_254385,
#'     "cif",
#'     options = list(doAssembly = TRUE, normalizeAssembly = TRUE)
#'   ) %>%
#'   m_set_style(style = list(
#'     sphere = list(colorscheme = "Jmol", scale = 0.25),
#'     stick = list(colorscheme = "Jmol")
#'   )) %>%
#'   m_add_unit_cell(spec = list(
#'     alabel = "x",
#'     blabel = "y",
#'     clabel = "z",
#'     box = list(hidden = TRUE)
#'   )) %>%
#'   m_zoom_to()
#' 
#' # Render model
#' mol
#' 
#' # Remove unit cell
#' mol %>%
#'   m_remove_unit_cell()
NULL
