#' Specify Styling for Sphere
#'
#' Returns a list for the \code{style = list(sphere = list())} function,
#' for setting the sphere specifications.
#'
#' @param hidden Boolean - do not show atom. Default \code{FALSE}.
#' @param radius Override van der waals radius.
#' @param scale Scale radius by specified amount.
#' @param colorscheme Specify scheme to color the atoms by. Default is "default". Other choies are "Carbon", ssPyMOL", "ssJmol", "Jmol", "default", "amino",
#' "shapely", "nucleic", "chain", "chainHetatm", "prop".
#' @param color Discrete, fixed coloring, overrides any colorscheme.
#' @param opacity Opacity of spheres, 0 being invisible. Must be the same for
#' all atoms in the model.
#'
#' @return List of values for input inside \code{style = list()} for sphere.
#' @examples
#' r3dmol() %>%
#'   m_add_model(data = pdb_1j72, format = "pdb") %>%
#'   m_set_style(style = m_style_sphere(radius = 0.5)) %>%
#'   m_zoom_to()
#' @export
m_style_sphere <- function(
                           hidden = NULL,
                           radius = NULL,
                           scale = NULL,
                           colorscheme = NULL,
                           color = NULL,
                           opacity = NULL) {
  sphere_style <- list(
    hidden = hidden,
    radius = radius,
    scale = scale,
    colorscheme = colorscheme,
    color = color,
    opacity = opacity
  )

  for (i in names(sphere_style)) {
    if (is.null(sphere_style[[i]])) {
      sphere_style[[i]] <- NULL
    }
  }

  # sphere_style
  sphere <- list(sphere = sphere_style)
  sphere
}

#' Specify Styling for Cartoon
#'
#' Returns a list for the \code{style = list(cartoon = list())} function,
#' for setting the cartoon specifications.
#'
#' @param color Strand color, may specify as 'spectrum' which will apply
#' reversed gradient based on residue number.
#' @param style style of cartoon rendering (trace, oval, rectangle (default),
#' parabola, edged).
#' @param ribbon whether to use constant strand width, disregarding secondary
#' structure; use thickness to adjust radius.
#' @param arrows whether to add arrows showing beta-sheet directionality;
#' does not apply to trace or ribbon.
#' @param tubes whether to display alpha helices as simple cylinders; does not
#' apply to trace.
#' @param thickness cartoon strand thickness, default is 0.4.
#' @param width cartoon strand width, default is secondary structure-dependent;
#' does not apply to trace or ribbon.
#' @param opacity set opacity from 0-1; transparency is set per-chain with a
#' warning outputted in the event of ambiguity.
#' @examples
#' r3dmol() %>%
#'   m_add_model(data = pdb_1j72, format = "pdb") %>%
#'   m_set_style(style = m_style_cartoon(color = "spectrum")) %>%
#'   m_zoom_to()
#' @export
m_style_cartoon <- function(
                            color = NULL,
                            style = NULL,
                            ribbon = NULL,
                            arrows = NULL,
                            tubes = NULL,
                            thickness = NULL,
                            width = NULL,
                            opacity = NULL) {
  cartoon_style <- list(
    color = color,
    style = style,
    ribbon = ribbon,
    arrows = arrows,
    tubes = tubes,
    thickness = thickness,
    width = width,
    opacity = opacity
  )

  for (i in names(cartoon_style)) {
    if (is.null(cartoon_style[[i]])) {
      cartoon_style[[i]] <- NULL
    }
  }

  cartoon <- list(cartoon = cartoon_style)
  cartoon
}

#' Specify Styling for Stick
#'
#' Returns a list for the \code{style = list(cartoon = list())} function,
#' for setting the stick specifications.
#'
#' @param hidden Do not show.
#' @param radius Radius of sticks.
#' @param singleBonds Draw all bonds as single bonds if \code{TRUE}.
#' @param colorScheme Specify scheme to color the atoms by. Default is "default". Other choies are "Carbon", ssPyMOL", "ssJmol", "Jmol", "default", "amino",
#' "shapely", "nucleic", "chain", "chainHetatm", "prop".
#' @param color Fixed coloring, overrides colorScheme.
#' @param opacity Opacity, must be the same for all atoms in the model.
#' @examples
#' r3dmol() %>%
#'   m_add_model(data = pdb_1j72, format = "pdb") %>%
#'   m_set_style(style = m_style_stick(opacity = 0.4)) %>%
#'   m_zoom_to()
#' @export
m_style_stick <- function(
                          radius = NULL,
                          singleBonds = NULL,
                          colorScheme = NULL,
                          color = NULL,
                          opacity = NULL,
                          hidden = NULL) {
  stick_style <- list(
    hidden = hidden,
    radius = radius,
    singleBonds = singleBonds,
    colorscheme = colorScheme,
    color = color,
    opacity = opacity
  )

  for (i in names(stick_style)) {
    if (is.null(stick_style[[i]])) {
      stick_style[[i]] <- NULL
    }
  }

  stick <- list(stick = stick_style)
  stick
}

#' Specify Styling for Labels
#'
#' Returns a list for the \code{m_add_res_labels(style = list())} function,
#' for setting the label specifications.
#'
#' @param font Font name, default sans-serif.
#' @param fontSize Height of text, default 18.
#' @param fontColor Font color, default white.
#' @param fontOpacity Font opacity, default 1.
#' @param borderThickness Line width of border around label, default 0.
#' @param borderColor Color of border, default backgroundColor.
#' @param borderOpacity Opacity of border, default 1.
#' @param backgroundColor Color of background, default black.
#' @param backgroundOpacity Opacity of background, default 1.
#' @param position x,y,z coordinates for label (for custom positioning).
#' @param inFront Logical, if \code{TRUE} always put in front of model.
#' @param showBackground Logical, show background rounded rectangle, default \code{TRUE}.
#' @param fixed Logical, setes the label to change with the model when zooming.
#' @param alignment String, how to orient the label with respect to position: 'topLeft' (default), 'topCenter', 'topRight', 'centerLeft', 'center', 'centerRight', 'bottomLeft', 'bottomCenter', 'bottomRight'.
#' @param frame If set, only display in this frame of an animation.
#' @examples
#' r3dmol() %>%
#'   m_add_model(data = pdb_1j72, format = "pdb") %>%
#'   m_set_style(style = m_style_stick()) %>%
#'   m_add_res_labels(style = m_style_label(fontSize = 14, backgroundColor = "green")) %>%
#'   m_zoom_to()
#' @export
m_style_label <- function(
                          font = NULL,
                          fontSize = NULL,
                          fontColor = NULL,
                          fontOpacity = NULL,
                          borderThickness = NULL,
                          borderColor = NULL,
                          borderOpacity = NULL,
                          backgroundColor = NULL,
                          backgroundOpacity = NULL,
                          position = NULL,
                          inFront = NULL,
                          showBackground = NULL,
                          fixed = NULL,
                          alignment = c("topLeft", "topCenter", "topRight", "centerLeft", "center", "centerRight", "bottomLeft", "bottomCenter", "bottomRight"),
                          frame = NULL) {
  alignment <- match.arg(alignment)

  if (length(alignment) > 1) {
    alignment <- alignment[1]
  }

  label_style <- list(
    font = font,
    fontSize = fontSize,
    fontColor = fontColor,
    fontOpacity = fontOpacity,
    backgroundColor = backgroundColor,
    backgroundOpacity = backgroundOpacity,
    borderColor = borderColor,
    borderThickness = borderThickness,
    borderOpacity = borderOpacity,
    position = position,
    inFront = inFront,
    showBackground = showBackground,
    fixed = fixed,
    alignment = alignment,
    frame = frame
  )

  for (i in names(label_style)) {
    if (is.null(label_style[[i]])) {
      label_style[[i]] <- NULL
    }
  }

  label_style
}

#' Specify Styling for Lines
#'
#' Returns a list for the \code{style = list(line = list())} function
#' for setting the line specifications.
#'
#' @param colorScheme Specify scheme to color the atoms by. Default is "default". Other choies are "Carbon", ssPyMOL", "ssJmol", "Jmol", "default", "amino",
#' "shapely", "nucleic", "chain", "chainHetatm", "prop".
#' @param color Fixed coloring, overrides \code{colorScheme}.
#' @param opacity Opacity, must be the same for all atoms in the model.
#' @param hidden Logical, do not show line.
#' @examples
#' r3dmol() %>%
#'   m_add_model(data = pdb_1j72, format = "pdb") %>%
#'   m_set_style(style = m_style_line(color = "blue")) %>%
#'   m_zoom_to()
#' @export
m_style_line <- function(
                         colorScheme = NULL,
                         color = NULL,
                         opacity = NULL,
                         hidden = NULL) {
  line_style <- list(
    colorscheme = colorScheme,
    color = color,
    opacity = opacity,
    hidden = hidden
  )

  for (i in names(line_style)) {
    if (is.null(line_style[[i]])) {
      line_style[[i]] <- NULL
    }
  }

  line <- list(line = line_style)
  line
}

#' Specify Styling for Surface
#'
#' Must be used inside \code{m_add_surface()} not any other styling function.
#' Returns a list for setting the surface specifications.
#' @param opacity Opacity, 0 for transparent, 1 for opaque.
#' @param colorScheme Specify scheme to color the atoms by. Default is "default". Other choies are "Carbon", ssPyMOL", "ssJmol", "Jmol", "default", "amino",
#' "shapely", "nucleic", "chain", "chainHetatm", "prop".
#' @param color Fixed coloring, overrides colorScheme.
#' @examples
#' r3dmol() %>%
#'   m_add_model(data = pdb_1j72, format = "pdb") %>%
#'   m_set_style(style = m_style_stick()) %>%
#'   m_add_surface(style = m_style_surface(opacity = 0.4)) %>%
#'   m_zoom_to()
#' @export
m_style_surface <- function(
                            opacity = NULL,
                            colorScheme = NULL,
                            color = NULL) {
  surface_style <- list(
    opacity = opacity,
    colorscheme = colorScheme,
    color = color
  )

  for (i in names(surface_style)) {
    if (is.null(surface_style[[i]])) {
      surface_style[[i]] <- NULL
    }
  }

  surface_style
}

#' Specify Styling for Generic Shapes
#'
#'
#' @param color Solid color values.
#' @param alpha Transparency value. 1 for opaque, 0 for invisible.
#' @param wireframe Draw as wireframe, not solid surface.
#' @param hidden If true, do not display object.
#' @param frame If set, only display in this frame of an animation.
#' @param clickable If true, user can click on object to trigger callback.
#' @param callback Function to call on click.
#' @examples
#' r3dmol() %>%
#'   m_add_model(data = m_fetch_pdb("1bna")) %>%
#'   m_add_sphere(
#'     center = m_sel(resi = 1),
#'     spec = m_shape_spec(color = "green", wireframe = TRUE)
#'   ) %>%
#'   m_zoom_to(sel = m_sel(resi = 1))
#' @export
m_shape_spec <- function(
                         color = NULL,
                         alpha = NULL,
                         wireframe = NULL,
                         hidden = NULL,
                         frame = NULL,
                         clickable = NULL,
                         callback = NULL) {
  shape_spec <- list(
    color = color,
    alpha = alpha,
    wireframe = wireframe,
    hidden = hidden,
    frame = frame,
    clickable = clickable,
    callback = callback
  )

  for (i in names(shape_spec)) {
    if (is.null(shape_spec[[i]])) {
      shape_spec[[i]] <- NULL
    }
  }

  shape_spec
}
