#' Specify Styling for Sphere
#'
#' Returns a list for the \code{style = list(sphere = list())} function,
#' for setting the sphere specifications.
#'
#' @param hidden Boolean - do not show atom. Default \code{FALSE}.
#' @param radius Override van der waals radius.
#' @param scale Scale radius by specified amount.
#' @param colorscheme Specify scheme to color the atoms by. Default is
#' "default". Other choies are "Carbon", ssPyMOL", "ssJmol", "Jmol",
#' "default", "amino",
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

  sphere_style <- cleanup_nulls(sphere_style)

  # sphere_style
  sphere <- list(sphere = sphere_style)
  sphere
}

#' Specify Styling for Cartoon
#'
#' Returns a list for the \code{style = list(cartoon = list())} function,
#' for setting the cartoon specifications.
#'
#' @param color Block color values. Strand color, may specify as 'spectrum'
#' which will apply
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
#' @param colorfunc Allows the user to provide a function for setting the
#' colorschemes, written in javascript.
#' \href{https://3dmol.csb.pitt.edu/doc/types.html#CartoonStyleSpec}{Official
#' Documentation}
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
                            opacity = NULL,
                            colorfunc = NULL) {
  cartoon_style <- list(
    color = color,
    style = style,
    ribbon = ribbon,
    arrows = arrows,
    tubes = tubes,
    thickness = thickness,
    width = width,
    opacity = opacity,
    colorfunc = colorfunc
  )

  cartoon_style <- cleanup_nulls(cartoon_style)

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
#' @param colorScheme Specify scheme to color the atoms by. Default is
#' "default". Other choies are "Carbon", ssPyMOL", "ssJmol", "Jmol",
#' "default", "amino",
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

  stick_style <- cleanup_nulls(stick_style)

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
#' @param showBackground Logical, show background rounded rectangle, default
#' \code{TRUE}.
#' @param fixed Logical, setes the label to change with the model when zooming.
#' @param alignment String, how to orient the label with respect to position:
#' 'topLeft' (default), 'topCenter', 'topRight', 'centerLeft', 'center',
#' 'centerRight', 'bottomLeft', 'bottomCenter', 'bottomRight'.
#' @param frame If set, only display in this frame of an animation.
#' @examples
#' r3dmol() %>%
#'   m_add_model(data = pdb_1j72, format = "pdb") %>%
#'   m_set_style(style = m_style_stick()) %>%
#'   m_add_res_labels(style = m_style_label(fontSize = 14,
#'   backgroundColor = "green")) %>%
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
                          alignment = c("topLeft", "topCenter", "topRight",
                                        "centerLeft", "center", "centerRight",
                                        "bottomLeft", "bottomCenter",
                                        "bottomRight"),
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

  label_style <- cleanup_nulls(label_style)

  label_style
}

#' Specify Styling for Lines
#'
#' Returns a list for the \code{style = list(line = list())} function
#' for setting the line specifications.
#'
#' @param colorScheme Specify scheme to color the atoms by. Default is
#' "default". Other choies are "Carbon", ssPyMOL", "ssJmol", "Jmol",
#' "default", "amino",
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

  line_style <- cleanup_nulls(line_style)

  line <- list(line = line_style)
  line
}

#' Specify Styling for Surface
#'
#' Must be used inside \code{m_add_surface()} not any other styling function.
#' Returns a list for setting the surface specifications.
#' @param opacity Opacity, 0 for transparent, 1 for opaque.
#' @param colorScheme Specify scheme to color the atoms by. Default is
#' "default". Other choies are "Carbon", ssPyMOL", "ssJmol", "Jmol",
#' "default", "amino",
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

  surface_style <- cleanup_nulls(surface_style)

  surface_style
}

#' Specify Styling for Generic Shapes
#'
#' @param color Solid color values.
#' @param alpha Transparency value. 1 for opaque, 0 for invisible.
#' @param wireframe Draw as wireframe, not solid surface.
#' @param hidden If true, do not display object.
#' @param frame If set, only display in this frame of an animation.
#' @param clickable If true, user can click on object to trigger callback.
#' @param callback Function to call on click.
#' @param hoverable Logical, enabling hover_callback and unhover_callback
#' functions to be called. Set hoverDuration in the viewer_spec() of r3dmol().
#' @param hover_callback Function to be called upon hover.
#' @param unhover_callback Function to be called upon hover stopping.
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
                         callback = NULL,
                         hoverable = NULL,
                         hover_callback = NULL,
                         unhover_callback = NULL) {
  shape_spec <- list(
    color = color,
    alpha = alpha,
    wireframe = wireframe,
    hidden = hidden,
    frame = frame,
    clickable = clickable,
    callback = callback,
    hoverable = hoverable,
    hover_callback = hover_callback,
    unhover_callback = unhover_callback
  )
  shape_spec <- cleanup_nulls(shape_spec)
  shape_spec
}
