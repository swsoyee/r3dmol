#' Specify Styling for Sphere
#'
#' Styling options for the sphere representation. Used inside
#' \code{m_add_style()} and \code{m_set_style()}.
#'
#' @param hidden Boolean - do not show atom. Default \code{FALSE}.
#' @param radius Override van der waals radius.
#' @param scale Scale radius by specified amount.
#' @param colorScheme Specify scheme to color the atoms by. Default is
#' "default". Other choies are "Carbon", ssPyMOL", "ssJmol", "Jmol",
#' "default", "amino",
#' "shapely", "nucleic", "chain", "chainHetatm", "prop".
#' @param color Discrete, fixed coloring, overrides any colorScheme.
#' @param opacity Opacity of spheres, 0 being invisible. Must be the same for
#' all atoms in the model.
#'
#' @examples
#' r3dmol() %>%
#'   m_add_model(data = pdb_1j72, format = "pdb") %>%
#'   m_set_style(style = m_style_sphere(radius = 0.5)) %>%
#'   m_zoom_to()
#' @export
m_style_sphere <- function(
                           scale = 1,
                           colorScheme = "default",
                           color = NULL,
                           radius = NULL,
                           hidden = FALSE,
                           opacity = 1) {
  sphere_style <- list(
    hidden = hidden,
    radius = radius,
    scale = scale,
    colorscheme = colorScheme,
    color = color,
    opacity = opacity
  ) %>% .cleanup_nulls()

  class(sphere_style) <- "SphereStyleSpec"

  list(sphere = sphere_style)
}

#' Specify Styling for Cartoon
#'
#' Styling options for the cartoon representation. Used inside
#' \code{m_add_style()} and \code{m_set_style()}.
#'
#' @param color Block color values. Strand color, may specify as 'spectrum'
#' which will apply
#' reversed gradient based on residue number.
#' @param style style of cartoon rendering ("trace", "oval", "rectangle"
#' (default), "parabola", "edged").
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
#' colorSchemes, written in javascript.
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
                            style = "rectangle",
                            ribbon = FALSE,
                            arrows = TRUE,
                            tubes = FALSE,
                            thickness = 0.4,
                            width = NULL,
                            opacity = 1,
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
  ) %>% .cleanup_nulls()

  class(cartoon_style) <- "CartoonStyleSpec"

  list(cartoon = cartoon_style)
}

#' Specify Styling for Stick
#'
#' Styling options for the stick representation. Used inside
#' \code{m_add_style()} and \code{m_set_style()}.
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
                          radius = 0.3,
                          singleBonds = FALSE,
                          colorScheme = "default",
                          color = NULL,
                          opacity = 1,
                          hidden = FALSE) {
  stick_style <- list(
    hidden = hidden,
    radius = radius,
    singleBonds = singleBonds,
    colorscheme = colorScheme,
    color = color,
    opacity = opacity
  ) %>% .cleanup_nulls()

  class(stick_style) <- "StickStyleSpec"

  list(stick = stick_style)
}

#' Specify Styling for Labels
#'
#' Styling options for the labels. Used inside \code{m_add_label()},
#' \code{m_add_res_labels()} and \code{m_add_property_labels()}.
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
#'   m_add_res_labels(style = m_style_label(
#'     fontSize = 14,
#'     backgroundColor = "green"
#'   )) %>%
#'   m_zoom_to()
#' @export
m_style_label <- function(
                          font = "sans-serif",
                          fontSize = 18,
                          fontColor = "white",
                          fontOpacity = 1,
                          backgroundColor = "black",
                          backgroundOpacity = 1,
                          borderOpacity = 1,
                          borderThickness = 0,
                          borderColor = backgroundColor,
                          inFront = TRUE,
                          showBackground = TRUE,
                          fixed = FALSE,
                          alignment = c(
                            "topLeft", "topCenter", "topRight",
                            "centerLeft", "center", "centerRight",
                            "bottomLeft", "bottomCenter",
                            "bottomRight"
                          ),
                          position = NULL,
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
  ) %>% .cleanup_nulls()

  class(label_style) <- "LabelSpec"

  label_style
}

#' Specify Styling for Lines
#'
#' Styling options for the line representation. Used inside
#' \code{m_add_style()} and \code{m_set_style()}. Can also be used for styling
#' when adding individual lines with \code{m_add_lines()}.
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
                         colorScheme = "default",
                         color = NULL,
                         opacity = 1,
                         hidden = FALSE) {
  line_style <- list(
    colorscheme = colorScheme,
    color = color,
    opacity = opacity,
    hidden = hidden
  ) %>% .cleanup_nulls()

  class(line_style) <- "LineStyleSpec"

  list(line = line_style)
}

#' Specify Styling for Surface
#'
#' Styling options for the surface representation. Used inside
#' \code{m_add_surface()}.
#'
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
                            opacity = 1,
                            colorScheme = "default",
                            color = NULL) {
  surface_style <- list(
    opacity = opacity,
    colorscheme = colorScheme,
    color = color
  ) %>% .cleanup_nulls()

  class(surface_style) <- "SurfaceStyleSpec"

  surface_style
}

#' Specify Styling for Generic Shapes
#'
#' Styling options for the various shapes. Used inside \code{m_add_sphere()},
#' \code{m_add_arrow()}, \code{m_add_cylinder()} etc.
#'
#' @param color Solid color values.
#' @param opacity Transparency value. 1 for opaque, 0 for invisible.
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
#' library(r3dmol)
#' \dontrun{
#' r3dmol() %>%
#'   m_add_model(data = m_fetch_pdb("1bna")) %>%
#'   m_add_sphere(
#'     center = m_sel(resi = 1),
#'     spec = m_shape_spec(color = "green", wireframe = TRUE)
#'   ) %>%
#'   m_zoom_to(sel = m_sel(resi = 1))
#' }
#' @export
m_shape_spec <- function(
                         color = NULL,
                         opacity = 1.0,
                         wireframe = FALSE,
                         hidden = FALSE,
                         frame = NULL,
                         clickable = FALSE,
                         callback = NULL,
                         hoverable = FALSE,
                         hover_callback = NULL,
                         unhover_callback = NULL) {
  shape_spec <- list(
    color = color,
    alpha = opacity,
    wireframe = wireframe,
    hidden = hidden,
    frame = frame,
    clickable = clickable,
    callback = callback,
    hoverable = hoverable,
    hover_callback = hover_callback,
    unhover_callback = unhover_callback
  ) %>% .cleanup_nulls()

  class(shape_spec) <- "ShapeSpec"

  shape_spec
}
