#' Remove all labels from viewer
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#'
#' @return id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' mol <- r3dmol() %>%
#'   m_add_model(data = "data-raw/Conformer3D_CID_5291.sdf", format = "sdf") %>%
#'   m_set_style(style = m_style_stick(radius = 2)) %>%
#'   m_zoom_to() %>%
#'   m_add_property_labels(
#'     prop = "index",
#'     sel = list(not = list(elem = "H")),
#'     style = m_style_label(
#'       fontColor = "black",
#'       font = "sans-serif",
#'       fontSize = 28,
#'       showBackground = FALSE,
#'       alignment = "center"
#'     )
#'   )
#'
#' # Render model with labels
#' mol
#'
#' # Remove all labels
#' mol %>%
#'   m_remove_all_labels()
m_remove_all_labels <- function(id) {
  method <- "removeAllLabels"
  callJS()
}

#' Delete all existing models
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#'
#' @return id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' mol <- r3dmol() %>%
#'   m_add_model(data = "data-raw/Conformer3D_CID_5291.sdf", format = "sdf")
#'
#' # Render model
#' mol
#'
#' # Remove all labels
#' mol %>%
#'   m_remove_all_models()
m_remove_all_models <- function(id) {
  method <- "removeAllModels"
  callJS()
}

#' Remove all shape objects from viewer
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#'
#' @return id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' mol <- r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_add_sphere(
#'     center = list(x = 0, y = 0, z = 0),
#'     radius = 10.0,
#'     color = "red"
#'    )
#'
#' # Render model with shape
#' mol
#'
#' # Remove shape
#' mol %>%
#'   m_remove_all_shapes()
m_remove_all_shapes <- function(id) {
  method <- "removeAllShapes"
  callJS()
}

#' Remove all labels from viewer
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#'
#' @return id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
#'
m_remove_all_surfaces <- function(id) {
  method <- "removeAllSurfaces"
  callJS()
}

#' Remove label from viewer
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param label R3dmol object label
#'
#' @return id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
#'
m_remove_label <- function(id, label) {
  method <- "removeLabel"
  callJS()
}

#' @rdname m_unit_cell
#' @export
m_remove_unit_cell <- function(id, model) {
  method <- "removeUnitCell"
  callJS()
}
