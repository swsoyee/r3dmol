#' Overwrite Previous Style
#'
#' Takes a selection and overwrites previous styling with given styles.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param sel Atom selection specification with \code{m_sel()}
#' @param style Style spec to apply to specified atoms using m_style_*()
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#'
#' @examples
#' library(r3dmol)
#'
#' # Add style to model
#' r3dmol() %>%
#'   m_add_model(data = pdb_1j72, format = "pdb") %>%
#'   m_add_style(style = m_style_cartoon()) %>%
#'   m_zoom_to()
#'
#' # Set style to model
#' r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_set_style(style = m_style_cartoon()) %>%
#'   m_set_style(
#'     sel = m_sel(chain = "A"),
#'     style = m_style_stick(
#'       radius = 0.5,
#'       colorScheme = "magentaCarbon"
#'     )
#'   ) %>%
#'   m_zoom_to()
#' @export
m_add_style <- function(id,
                        style = m_style_cartoon(),
                        sel = m_sel()) {
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

#' Add arrow shape
#'
#' Add an arrow from start to end, additional customisation through
#' \code{m_shape_spec()}.
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param start Start location of arrow Can be either \code{m_sel()} or
#' \code{m_vector3()}.
#' @param end End location of arrow. Can be either \code{m_sel()} or
#' \code{m_vector3()}.
#' @param radius Radius of base cylinder for arrow.
#' @param spec Additional shape specifications defined with
#' \code{m_shape_spec()}.
#' @param radiusRatio Ratio of arrow point to the base cylinder.
#' Default 1.618034.
#' @param mid Relative position of the arrow point base, along the length of
#' arrow object. Default to 0.618034.
#' @param hidden Hide object if TRUE.
#'
#' @examples
#' \dontrun{
#' r3dmol() %>%
#'   m_add_model(data = m_fetch_pdb("1bna")) %>%
#'   m_zoom_to(sel = m_sel(resi = 1)) %>%
#'   m_add_arrow(
#'     start = m_sel(resi = 1),
#'     end = m_sel(resi = 3),
#'     spec = m_shape_spec(color = "green")
#'   )
#' }
#' @export
m_add_arrow <- function(
                        id,
                        start,
                        end,
                        radius = 0.2,
                        radiusRatio = 1.62,
                        mid = 0.62,
                        spec = m_shape_spec(),
                        hidden = FALSE) {
  arglist <- list(
    start = start,
    end = end,
    radius = radius,
    radiusRatio = radiusRatio,
    mid = mid,
    hidden = hidden
  )

  spec <- c(spec, arglist)
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

#' Add a cylinder shape to scene.
#'
#' Creates cylinder shape from start to end, with styling spec from
#' \code{m_shape_spec()}.
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()}).
#' @param start Start location of cylinder. Can be either \code{m_sel()} or
#' \code{m_vector3()}.
#' @param end End location of cylinder. Can be either \code{m_sel()} or
#' \code{m_vector3()}.
#' @param radius Radius of cylinder.
#' @param fromCap Cap at start of cylinder. 0 for none, 1 for flat,
#' 2 for rounded.
#' @param toCap Cap at end of cylinder. 0 for none, 1 for flat, 2 for rounded.
#' @param dashed Boolean, dashed style cylinder instead of solid.
#' @param spec Additional shape specifications defined with
#' @param color Color value for cylinder.
#' \code{m_shape_spec()}.
#' @noRd
#' @keywords internal
.m_add_cylinder <- function(
                            id,
                            start,
                            end,
                            radius = 0.1,
                            fromCap = 1,
                            toCap = 1,
                            dashed = FALSE,
                            color,
                            hidden,
                            wireframe,
                            alpha,
                            spec = m_shape_spec()) {
  arglist <- list(
    start = start,
    end = end,
    radius = radius,
    fromCap = fromCap,
    toCap = toCap,
    dashed = dashed,
    color = color,
    hidden = hidden,
    wireframe = wireframe,
    alpha = alpha
  )

  spec <- c(arglist, spec)

  method <- "addCylinder"
  callJS()
}

#' Add Cylinder Between Points
#'
#' Add cynliders between the given points. Will match starting point/s with
#' ending point/s to create a line between each point. Styling options can be
#' supplied as one option, or a vector of length equal to the number of lines.
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()}).
#' @param start Starting position (or \code{list()} of positions) of line. Can
#' be a single position or \code{list()} of positions. Format either
#' \code{m_sel()} or \code{m_vector3()}.
#' @param end Ending position (or \code{list()} of positions) of line. Can
#' be a single position or \code{list()} of positions. Format either
#' \code{m_sel()} or \code{m_vector3()}.
#' @param radius Radius of cylinder.
#' @param color Color value for cylinders. Either 1 or vector of colors equal
#' in length to \code{start}.
#' @param fromCap Cap at start of cylinder. 0 for none, 1 for flat,
#' 2 for rounded.
#' @param toCap Cap at end of cylinder. 0 for none, 1 for flat, 2 for rounded.
#' @param dashed Boolean, dashed style cylinder instead of solid.
#' @param hidden Logical, whether or not to hide the cylinder.
#' @param wireframe Logical, display as wireframe.
#' @param alpha Alpha value for transparency.
#' @param spec Additional shape specifications defined with
#' \code{m_shape_spec()}.
#' @examples
#' ## Add a cylinder between residue 1 & 2 of Chain "A"
#' r3dmol() %>%
#'   m_add_model(pdb_6zsl) %>%
#'   m_zoom_to(sel = m_sel(resi = 1)) %>%
#'   m_add_cylinder(
#'     start = m_sel(resi = 1, chain = "A"),
#'     end = m_sel(resi = 2, chain = "A"),
#'     dashed = TRUE,
#'     radius = 0.1
#'   )
#'
#' # Add two cylinders.
#' # Blue cylinder is between residues 1 & 2
#' # Green cylinder is between residues 3 & 4
#' r3dmol() %>%
#'   m_add_model(pdb_6zsl) %>%
#'   m_zoom_to(sel = m_sel(resi = 1:4, chain = "A")) %>%
#'   m_add_cylinder(
#'     start = list(
#'       m_sel(resi = 1, chain = "A"),
#'       m_sel(resi = 3, chain = "A")
#'     ),
#'     end = list(
#'       m_sel(resi = 2, chain = "A"),
#'       m_sel(resi = 4, chain = "A")
#'     ),
#'     dashed = TRUE,
#'     radius = 0.1,
#'     color = c("blue", "green")
#'   ) %>%
#'   m_add_res_labels(m_sel(resi = 1:4, chain = "A"))
#'
#' # The same scene achieved with m_multi_resi_sel()
#' r3dmol() %>%
#'   m_add_model(pdb_6zsl) %>%
#'   m_zoom_to(sel = m_sel(resi = 1:4, chain = "A")) %>%
#'   m_add_cylinder(
#'     start = m_multi_resi_sel(resi = c(1, 3), chain = "A"),
#'     end = list(
#'       m_sel(resi = 2, chain = "A"),
#'       m_sel(resi = 4, chain = "A")
#'     ),
#'     dashed = TRUE,
#'     radius = 0.1,
#'     color = c("blue", "green")
#'   ) %>%
#'   m_add_res_labels(m_sel(resi = 1:4, chain = "A"))
#' @export
m_add_cylinder <- function(
                           id,
                           start,
                           end,
                           radius = 0.1,
                           fromCap = 1,
                           toCap = 1,
                           dashed = FALSE,
                           color = "black",
                           alpha = FALSE,
                           wireframe = FALSE,
                           hidden = FALSE,
                           spec = m_shape_spec()) {
  if (methods::is(start)[1] == "AtomSelectionSpec") {
    start <- list(start)
  }
  if (methods::is(end)[1] == "AtomSelectionSpec") {
    end <- list(end)
  }

  cylinder_specs <- .m_multi_spec(
    starts = start,
    ends = end
  )

  .test_length(radius, start)
  .test_length(fromCap, start)
  .test_length(toCap, start)
  .test_length(dashed, start)
  .test_length(color, start)
  .test_length(hidden, start)
  .test_length(wireframe, start)
  .test_length(alpha, start)

  aesthetics <- data.frame(
    line_num = seq_along(start),
    radius = radius,
    fromCap = fromCap,
    toCap = toCap,
    dashed = dashed,
    color = color,
    hidden = hidden,
    wireframe = wireframe,
    alpha = alpha
  )

  counter <- 0
  for (cylinder_spec in cylinder_specs) {
    counter <- counter + 1

    id <- id %>%
      .m_add_cylinder(
        start = cylinder_spec$start,
        end = cylinder_spec$end,
        radius = aesthetics$radius[counter],
        fromCap = aesthetics$fromCap[counter],
        toCap = aesthetics$toCap[counter],
        dashed = aesthetics$dashed[counter],
        color = aesthetics$color[counter],
        hidden = aesthetics$hidden[counter],
        wireframe = aesthetics$wireframe[counter],
        alpha = aesthetics$alpha[counter]
      )
  }
  id
}

#' Add Line Between Points
#'
#' Add a line between the given points.
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()}).
#' @param start Start location of line Can be either \code{m_sel()} or
#' \code{m_vector3()}.
#' @param end End location of line. Can be either \code{m_sel()} or
#' \code{m_vector3()}.
#' @param dashed Boolean, whether or not to draw line as dashed.
#' @param color Color value for line.
#' @param spec Additional shape specifications defined with
#' \code{m_shape_spec()}.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()}).
#' @noRd
#' @keywords internal
.m_add_line <- function(
                        id,
                        start,
                        end,
                        dashed,
                        color,
                        opacity,
                        hidden) {
  # ensure that the arguments are correct
  if (is.null(dashed)) {
    dashed <- FALSE
  }

  spec <- list(
    start = start,
    end = end,
    dashed = dashed,
    color = color,
    opacity = opacity,
    hidden = hidden
  ) %>% .cleanup_nulls()

  method <- "addLine"
  callJS()
}

#' Add Lines Between Points
#'
#' Add lines between the given points. Will match starting point/s with ending
#' point/s to create a line between each point. Styling options can be supplied
#' as one option, or a vector of length equal to the number of lines.
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()}).
#' @param start Starting position (or \code{list()} of positions) of line. Can
#' be a single position or \code{list()} of positions. Format either
#' \code{m_sel()} or \code{m_vector3()}.
#' @param end Ending position (or \code{list()} of positions) of line. Can
#' be a single position or \code{list()} of positions. Format either
#' \code{m_sel()} or \code{m_vector3()}.
#' @param dashed Logical whether the lines are dashed.
#' @param color Either single or list of color values equal to number of lines.
#' @param opacity Either single or list of opacity values equal to number of
#' lines.
#' @param hidden Either single or list of hidden values equal to number of
#' lines.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#'
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_model(data = pdb_6zsl) %>%
#'   m_set_style(style = m_style_cartoon()) %>%
#'   m_zoom_to() %>%
#'   m_add_style(
#'     sel = m_sel(resi = 1:10),
#'     style = c(
#'       m_style_stick(),
#'       m_style_sphere(scale = 0.3)
#'     )
#'   ) %>%
#'   m_add_line(
#'     start = list(
#'       m_sel(resi = 1, chain = "A"),
#'       m_sel(resi = 1, chain = "A")
#'     ),
#'     end = list(
#'       m_sel(resi = 10, chain = "A"),
#'       m_sel(resi = 10, chain = "B")
#'     ),
#'     dashed = TRUE
#'   )
m_add_line <- function(
                       id,
                       start,
                       end,
                       dashed = TRUE,
                       color = "black",
                       opacity = 1,
                       hidden = FALSE) {
  if (missing(start) | missing(end)) {
    stop("At least 1 `start` and 1 `end` must be passed in.")
  }

  if (methods::is(start)[1] == "AtomSelectionSpec") {
    start <- list(start)
  }
  if (methods::is(end)[1] == "AtomSelectionSpec") {
    end <- list(end)
  }

  if (length(start) != length(end)) {
    stop("length of `start` must be equal to length of `end`.")
  }

  line_specs <- .m_multi_spec(
    starts = start,
    ends = end
  )

  .test_length(dashed, start)
  .test_length(color, start)
  .test_length(opacity, start)
  .test_length(hidden, start)

  aesthetics <- data.frame(
    line_num = seq_along(start),
    dashed = dashed,
    color = color,
    opacity = opacity,
    hidden = hidden
  )

  counter <- 0

  for (line_spec in line_specs) {
    counter <- counter + 1

    id <- id %>%
      .m_add_line(
        start = line_spec$start,
        end = line_spec$end,
        dashed = aesthetics$dashed[counter],
        color = aesthetics$color[counter],
        opacity = aesthetics$opacity[counter],
        hidden = aesthetics$hidden[counter]
      )
  }
  id
}

#' Add Sphere Shape
#'
#' Adds sphere at given location, with given radius.
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param center center point of sphere. Can be \code{m_sel()}.
#' @param radius radius of sphere.
#' @param spec Additional shape specifications defined with
#' \code{m_shape_spec()}.
#' @param ... Additional shape specifcations, that can be called outside of
#' \code{m_shape_spec()} such as \code{color = 'blue'}
#' @examples
#' r3dmol() %>%
#'   m_add_model(data = m_fetch_pdb("1bna")) %>%
#'   m_add_sphere(
#'     center = m_sel(resi = 1),
#'     spec = m_shape_spec(color = "green", wireframe = TRUE)
#'   ) %>%
#'   m_zoom_to(sel = m_sel(resi = 1))
#' @export
m_add_sphere <- function(id,
                         center,
                         radius = 1,
                         spec = m_shape_spec(),
                         ...) {
  spec <- c(list(center = center, radius = radius), spec, ...)

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
#' @param prop Property name ()
#' @param sel Atom selection specification
#' @param style Style spec to add to specified atoms
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
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
#' @export
m_add_property_labels <- function(id,
                                  prop,
                                  sel = m_sel(),
                                  style = m_style_label()) {
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
#' @param style Label style specification
#' @param sel Set position of label to center of this selection
#' @param noshow if \code{TRUE}, do not immediately display label - when adding
#' multiple labels this is more efficient
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
#'     text = "Label",
#'     sel = m_vector3(-6.89, 0.75, 0.35),
#'     style = m_style_label(
#'       backgroundColor = "#666666",
#'       backgroundOpacity = 0.9
#'     )
#'   ) %>%
#'   m_zoom_to()
m_add_label <-
  function(id,
           text,
           style = m_style_label(),
           sel = m_sel(),
           noshow = TRUE) {
    # keeping consistent style convention throughout package
    # `options` is required for function though
    options <- style
    method <- "addLabel"
    callJS()
  }

#' @rdname add_model
#' @export
m_add_model <-
  function(id,
           data,
           format = c("pdb", "sdf", "xyz", "pqr", "mol2", "cif"),
           keepH = FALSE,
           options = list()) {
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

    options <- c(options, list(keepH = keepH))

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
#'   m_set_style(style = m_style_stick(colorScheme = "magentaCarbon")) %>%
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

#' Add Residue Labels
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
#'     style = c(
#'       m_style_stick(radius = 0.15),
#'       m_style_cartoon()
#'     )
#'   ) %>%
#'   m_add_res_labels(
#'     sel = m_sel(resn = "GLY"),
#'     style = m_style_label(
#'       font = "Arial",
#'       fontColor = "white",
#'       backgroundColor = "black",
#'       showBackground = TRUE
#'     )
#'   ) %>%
#'   m_zoom_to()
m_add_res_labels <- function(id,
                             sel = m_sel(),
                             style = m_style_label(),
                             byframe) {
  method <- "addResLabels"
  callJS()
}


#' Add surface representation to atoms
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param type Surface type ('VDW', 'MS', 'SAS', or 'SES')
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
m_add_surface <- function(id,
                          type,
                          style = m_style_surface(),
                          atomsel = m_sel(),
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


#' Add colored outline to all objects in scene.
#'
#' Adds a colored outline to all objects in the scene, helping the viewer
#' to distinguish depth in often complex molecular scenes.
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param width Width of the outline, defaults to 0.1
#' @param color Color of the outline, defaults to black.
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_model(data = pdb_1j72) %>%
#'   m_set_style(style = m_style_stick()) %>%
#'   m_add_outline()
#' @export
m_add_outline <- function(id,
                          width = 0.1,
                          color = "black") {
  style <- list(
    style = "outline",
    color = color,
    width = width
  )
  method <- "setViewStyle"
  callJS()
}
