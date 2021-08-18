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
#' @export
m_set_style <- function(id,
                        style = m_style_cartoon(),
                        sel = m_sel()) {
  if (missing(style)) {
    stop("The `style` argument must be passed.")
  }
  method <- "setStyle"
  callJS()
}

#' Set lower and upper limit stops for zoom
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param lower limit on zoom in (positive \code{numeric} number). Default
#' \code{0}.
#' @param upper limit on zoom out (positive \code{numeric} number). Default
#' \code{Inf}.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
m_set_zoom_limits <- function(id, lower = 0, upper = Inf) {
  method <- "setZoomLimits"
  callJS()
}

#' @rdname m_set_viewer
#' @export
m_set_width <- function(id, width) {
  method <- "setWidth"
  callJS()
}

#' @rdname m_set_viewer
#' @export
m_set_height <- function(id, height) {
  method <- "setHeight"
  callJS()
}

#' @rdname m_set_viewer
#' @export
m_set_background_color <- function(id, hex, alpha) {
  method <- "setBackgroundColor"
  callJS()
}

#' Set view projection scheme
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param scheme Either \code{orthographic} or \code{perspective}.
#' Default is \code{perspective}. Orthographic can also be enabled on viewer
#' creation by setting \code{orthographic} to true in the config object.
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
#'   m_set_style(style = m_style_cartoon()) %>%
#'   m_set_projection(scheme = "orthographic")
m_set_projection <- function(id, scheme = c("perspective", "orthographic")) {
  scheme <- match.arg(scheme)
  method <- "setProjection"
  callJS()
}

#' Set slab of view
#'
#' Set slab of view (contents outside of slab are clipped).
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param near near clipping plane distance
#' @param far far clipping plane distance
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
#'   m_set_style(style = m_style_cartoon()) %>%
#'   m_zoom_to() %>%
#'   m_set_slab(near = -90, far = 0)
m_set_slab <- function(id, near, far) {
  method <- "setSlab"
  callJS()
}



#' Set the duration of the hover delay
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param hoverDuration an optional parameter that denotes
#' the duration of the hover delay (in milliseconds) before the hover action is
#' called
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
m_set_hover_duration <- function(id, hoverDuration) {
  method <- "setHoverDuration"
  callJS()
}

#' Set the default cartoon quality for newly created models
#'
#' Set the default cartoon quality for newly created models. Default is
#' \code{5}.
#' Current models are not affected.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param quality Default cartoon quality.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_set_default_cartoon_quality(20) %>%
#'   m_add_model(data = pdb_1j72, format = "pdb") %>%
#'   m_set_style(style = m_style_cartoon()) %>%
#'   m_zoom_to()
m_set_default_cartoon_quality <- function(id, quality) {
  method <- "setDefaultCartoonQuality"
  callJS()
}

#' Set color by element
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param sel Atom selection.
#' @param colors Color hex code or name.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
#'
m_set_color_by_element <- function(id, sel, colors) {
  method <- "setColorByElement"
  callJS()
}

#' Set the distance between the model and the camera
#'
#' Essentially zooming. Useful while stereo rendering.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param dist Numeric distance.
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
#'   m_set_preceived_distance(dist = 200)
m_set_preceived_distance <- function(id, dist) {
  method <- "setPerceivedDistance"
  callJS()
}

#' @rdname m_set_view
#' @export
m_set_view <- function(id, arg, style) {
  method <- "setView"
  callJS()
}
