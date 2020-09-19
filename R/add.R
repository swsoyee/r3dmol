#' Add style properties to all selected atoms
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param sel Atom selection specification
#' @param style style spec to add to specified atoms
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
m_add_style <- function(id, sel = list(), style = list()) {
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
#' r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_set_style(style = list(cartoon = list(color = 'spectrum'))) %>%
#'   m_add_arrow(
#'     spec = list(
#'       start = list(x = -10.0, y = 0.0, z = 0.0),
#'       end = list(x = 0.0, y = -10.0, z = 0.0),
#'       radius = 1.0,
#'       radiusRadio = 1.0,
#'       mid = 1.0
#'     )
#'   )
m_add_arrow <- function(id, spec = list()) {
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
m_add_as_one_molecule <- function(id, data, format) {
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
m_add_box <- function(id, spec = list()) {
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
m_add_curve <- function(id, spec = list()) {
  method <- "addCurve"
  callJS()
}

#' Create and add cylinder shape
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param spec Style specification
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
m_add_cylinder <- function(id, spec = list()) {
  method <- "addCylinder" # TODO Callback function need fixed
  callJS()
}

#' Create and add line shape
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param spec Style specification, can specify dashed, dashLength, and gapLength
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
m_add_line <- function(id, spec = list()) {
  method <- "addLine"
  callJS()
}

# TODO This function has bugs, do not use!
#' Add property labels
#'
#' This will generate one label per a selected
#' atom at the atom's coordinates with the property value as the label text.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param prop Property name
#' @param sel Atom selection specification
#' @param style Style spec to add to specified atoms
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#'
#' @examples
# addPropertyLabels <- function(id, prop, sel, style) {
#   method <- "addPropertyLabels"
#   callJS()
# }

#' Create and add sphere shape
#'
#' This method provides a shorthand way to create a spherical shape object
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param spec Sphere shape style specification
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
m_add_sphere <- function(id, spec = list()) {
  method <- "addSphere"
  callJS()
}

#' Add shape object to viewer
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param shapeSpec Style specification for label
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
m_add_shape <- function(id, shapeSpec = list()) {
  method <- "addShape" # TODO Not work now.
  callJS()
}

#' Add label to viewer
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param text Label text
#' @param options Label style specification
#' @param sel Set position of label to center of this selection
#' @param noshow if \code{TRUE}, do not immediately display label - when adding multiple
#' labels this is more efficient
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_add_label(
#'     "Label",
#'     options = list(
#'       position = m_vector3(-6.89, 0.75, 0.35),
#'       backgroundColor = "#666666",
#'       backgroundOpacity = 0.9
#'     )
#'   ) %>%
#'   m_zoom_to()
m_add_label <- function(id, text, options = list(), sel = list(), noshow = TRUE) {
  method <- "addLabel"
  callJS()
}

#' Create and add model to viewer
#'
#' Create and add model to viewer, given molecular data and its format
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param data Path of input data path or a vector of data.
#' @param format Input format (\code{'pdb'}, \code{'sdf'}, \code{'xyz'}, \code{'pqr'},
#'  or \code{'mol2'})
#' @param options Format dependent options. Attributes depend on the input file format.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
m_add_model <-
  function(id,
           data,
           format = c("pdb", "sdf", "xyz", "pqr", "mol2"),
           options) {

    format <- match.arg(format)

    # If file path is pass in, read the file and store it as a vector
    if (length(data) == 1 && file.exists(data)) {
      data <- readLines(data)
    }

    method <- "addModel"
    callJS()
  }

#' Construct isosurface from volumetric data in gaussian cube format
#'
#' @param id  R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param data Path of input data path or a vector of data.
#' @param isoSpec Volumetric data shape specification
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
#' r3dmol() %>%
#'   m_add_isosurface(
#'     data = bohr_cube,
#'     isoSpec = list(
#'       isoval = -0.01,
#'       color = "red",
#'       opacity = 0.95
#'     )
#'   ) %>%
#'   m_set_style(sel = list(cartoon = list()),
#'               style = list(stick = list())) %>%
#'   m_zoom_to()
m_add_isosurface <- function(id, data, isoSpec) {

  # If file path is pass in, read the file and store it as a vector
  if (length(data) == 1 && file.exists(data)) {
    data <- readLines(data)
  }

  method <- "addIsosurface"
  callJS()
}
