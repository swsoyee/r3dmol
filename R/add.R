#' @rdname m_style
#' @export
m_add_style <- function(id, sel = list(), style = list()) {
  if (missing(style)) {
    stop("The `style` argument must be passed.")
  }
  method <- "addStyle"
  callJS()
}

#' Create and add model to viewer
#'
#' Given multimodel file and its format, all atoms are added to one model
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param data Input data
#' @param format Input format
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
#'
m_add_as_one_molecule <- function(id, data, format) {
  data <- readLines(data) # TODO Need refactor
  method <- "addAsOneMolecule"
  callJS()
}

#' @rdname m_add_anyShape
#' @export
m_add_arrow <- function(id, spec = list()) {
  method <- "addArrow"
  callJS()
}

#' @rdname m_add_anyShape
#' @export
m_add_box <- function(id, spec = list()) {
  method <- "addBox"
  callJS()
}

#' @rdname m_add_anyShape
#' @export
m_add_curve <- function(id, spec = list()) {
  method <- "addCurve"
  callJS()
}

#' @rdname m_add_anyShape
#' @export
m_add_cylinder <- function(id, spec = list()) {
  method <- "addCylinder"
  callJS()
}

#' @rdname m_add_anyShape
#' @export
m_add_line <- function(id, spec = list()) {
  method <- "addLine"
  callJS()
}

#' @rdname m_add_anyShape
#' @export
m_add_sphere <- function(id, spec = list()) {
  method <- "addSphere"
  callJS()
}

#' Add property labels
#'
#' This will generate one label per a selected
#' atom at the atom's coordinates with the property value as the label text.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param prop Property name
#' @param sel Atom selection specification
#' @param style Style spec to add to specified atoms
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_model(data = "data-raw/Conformer3D_CID_5291.sdf", format = "sdf") %>%
#'   m_set_style(style = list(stick = list(radius = 2))) %>%
#'   m_zoom_to() %>%
#'   m_add_property_labels(
#'     prop = "index",
#'     sel = list(not = list(elem = "H")),
#'     style = list(
#'       fontColor = "black",
#'       font = "sans-serif",
#'       fontSize = 28,
#'       showBackground = FALSE,
#'       alignment = "center"
#'     )
#'   )
m_add_property_labels <- function(id, prop, sel, style) {
  method <- "addPropertyLabels"
  callJS()
}

#' Add shape object to viewer
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param shapeSpec Style specification for label
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
#'
m_add_shape <- function(id, shapeSpec = list()) {
  method <- "addShape" # TODO Not work now.
  callJS()
}

#' Add label to viewer
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param text Label text
#' @param options Label style specification
#' @param sel Set position of label to center of this selection
#' @param noshow if \code{TRUE}, do not immediately display label - when adding
#' multiple
#' labels this is more efficient
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
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
m_add_label <-
  function(id,
           text,
           options = list(),
           sel = list(),
           noshow = TRUE) {
    method <- "addLabel"
    callJS()
  }

#' @rdname add_model
#' @export
m_add_model <-
  function(id,
           data,
           format = c("pdb", "sdf", "xyz", "pqr", "mol2", "cif"),
           options) {
    format <- match.arg(format)

    if (!is.list(data)) {
      data <- list(data)
    }

    entries <- data
    data <- list()

    for (entry in entries) {
      # If file path is pass in, read the file and store it as a vector
      if (length(entry) == 1 && file.exists(entry)) {
        entry <- readLines(entry)
      }
      entry <- paste0(entry, collapse = "\n")
      data <- append(data, entry)
    }

    rm(entries, entry)

    method <- "addModel"
    callJS()
  }

#' @rdname add_model
#' @export
m_add_models <-
  function(id,
           data,
           format = c("pdb", "sdf", "xyz", "pqr", "mol2", "cif")) {
    format <- match.arg(format)

    # If file path is pass in, read the file and store it as a vector
    if (length(data) == 1 && file.exists(data)) {
      data <- readLines(data)
    }
    data <- paste0(data, collapse = "\n")
    method <- "addModels"
    callJS()
  }

#' Construct isosurface from volumetric data in gaussian cube format
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param data Path of input data path or a vector of data.
#' @param isoSpec Volumetric data shape specification
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_isosurface(
#'     data = cube_benzene_homo,
#'     isoSpec = list(
#'       isoval = -0.01,
#'       color = "red",
#'       opacity = 0.95
#'     )
#'   ) %>%
#'   m_set_style(
#'     sel = list(cartoon = list()),
#'     style = list(stick = list())
#'   ) %>%
#'   m_zoom_to()
m_add_isosurface <- function(id, data, isoSpec) {
  # If file path is pass in, read the file and store it as a vector
  if (length(data) == 1 && file.exists(data)) {
    data <- readLines(data)
  }
  data <- paste0(data, collapse = "\n")
  method <- "addIsosurface"
  callJS()
}

#' Create and add model to viewer
#'
#' Create and add model to viewer. Given multimodel file and its format,
#' different atomlists are stored in model's frame
#' property and model's atoms are set to the 0th frame
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param data Path of input data path or a vector of data.
#' @param format Input format (see
#' <http://3dmol.csb.pitt.edu/doc/types.html#FileFormats>).
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_models_as_frames(data = xyz_multiple, format = "xyz") %>%
#'   m_animate(options = list(loop = "forward", reps = 1)) %>%
#'   m_set_style(style = list(stick = list(colorscheme = "magentaCarbon"))) %>%
#'   m_zoom_to()
m_add_models_as_frames <- function(id, data, format) {
  # If file path is pass in, read the file and store it as a vector
  if (length(data) == 1 && file.exists(data)) {
    data <- readLines(data)
  }
  data <- paste0(data, collapse = "\n")
  method <- "addModelsAsFrames"
  callJS()
}

#' Add residue labels
#'
#' Add residue labels. This will generate one label per a
#' residue within the selected atoms. The label will be at the
#' centroid of the atoms and styled according to the passed style.
#' The label text will be \code{resn}\code{resi}
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param sel Atom selection specification
#' @param style Style spec to add to specified atoms
#' @param byframe if true, create labels for every individual frame, not just
#' current
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_model(data = pdb_1j72, format = "pdb") %>%
#'   m_set_style(
#'     style = list(stick = list(radius = 0.15), cartoon = list())
#'   ) %>%
#'   m_add_res_labels(
#'     sel = list(resn = "GLY"),
#'     style = list(
#'       font = "Arial",
#'       fontColor = "white",
#'       backgroundColor = "black",
#'       showBackground = TRUE
#'     )
#'   ) %>%
#'   m_zoom_to()
m_add_res_labels <- function(id, sel, style, byframe) {
  method <- "addResLabels"
  callJS()
}


#' Add surface representation to atoms
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param type Surface type (VDW, MS, SAS, or SES)
#' @param style Optional style specification for surface material (e.g. for
#' different coloring scheme, etc).
#' @param atomsel Show surface for atoms in this selection.
#' @param allsel Use atoms in this selection to calculate surface; may be larger
#' group than \code{atomsel}.
#' @param focus Optionally begin rendering surface specified atoms.
#' @param surfacecallback function to be called after setting the surface.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
#'
m_add_surface <- function(id,
                          type,
                          style,
                          atomsel,
                          allsel,
                          focus,
                          surfacecallback) {
  method <- "addSurface"
  callJS()
}

#' @rdname m_unit_cell
#' @export
m_add_unit_cell <- function(id, model, spec) {
  method <- "addUnitCell"
  callJS()
}

#' @rdname m_unit_cell
#' @export
m_replicate_unit_cell <- function(id, a, b, c, model) {
  method <- "replicateUnitCell"
  callJS()
}

#' Add custom shape component from user supplied function
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param spec Style specification
#' (see: <http://3dmol.csb.pitt.edu/doc/types.html#CustomShapeSpec>).
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' r <- 20
#'
#' vertices <- list(
#'   m_vector3(0, 0, 0),
#'   m_vector3(r, 0, 0),
#'   m_vector3(0, r, 0)
#' )
#'
#' normals <- list(
#'   m_vector3(0, 0, 1),
#'   m_vector3(0, 0, 1),
#'   m_vector3(0, 0, 1)
#' )
#'
#' colors <- list(
#'   list(r = 1, g = 0, b = 0),
#'   list(r = 0, g = 1, b = 0),
#'   list(r = 0, g = 0, b = 1)
#' )
#'
#' faces <- 0:2
#'
#' r3dmol() %>%
#'   m_add_custom(spec = list(
#'     vertexArr = vertices,
#'     normalArr = normals,
#'     faceArr = faces,
#'     color = colors
#'   ))
m_add_custom <- function(id, spec) {
  method <- "addCustom"
  callJS()
}

m_add_volumetric_render <- function(id, data, spec) {
  # If file path is pass in, read the file and store it as a vector
  if (length(data) == 1 && file.exists(data)) {
    data <- readLines(data)
  }
  data <- paste0(data, collapse = "\\n")
  method <- "addVolumetricRender"
  callJS()
}
