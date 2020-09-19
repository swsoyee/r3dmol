#' Set style properties to all selected atoms
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param sel Atom selection specification
#' @param style Style spec to apply to specified atoms
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#' r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_set_style(style = list(cartoon = list())) %>%
#'   m_set_style(sel = list(chain = "A"),
#'            style = list(stick = list(
#'              radius = 0.5,
#'              colorscheme = "magentaCarbon"
#'            ))) %>%
#'   m_zoom_to()
m_set_style <- function(id, sel = list(), style = list()) {
  if (missing(style)) {
    stop("The `style` argument must be passed.")
  }
  method <- "setStyle"
  callJS()
}

#' Set lower and upper limit stops for zoom
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param lower limit on zoom in (positive \code{numeric} number). Default \code{0}.
#' @param upper limit on zoom out (positive \code{numeric} number). Default \code{Inf}.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
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
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param scheme Either \code{orthographic} or \code{perspective}.
#' Default is \code{perspective}. Orthographic can also be enabled on viewer creation
#' by setting \code{orthographic} to true in the config object.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
m_set_projection <- function(id, scheme = "perspective") {
  if (!scheme %in% c("perspective", "orthographic")) {
    # TODO Nor work?
    stop("Unknow scheme")
  }
  method <- "setProjection"
  callJS()
}

#' Set slab of view
#'
#' Set slab of view (contents outside of slab are clipped).
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param near near clipping plane distance
#' @param far far clipping plane distance
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
m_set_slab <- function(id, near, far) {
  method <- "setSlab"
  callJS()
}

#' Set global view styles
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param style css style object in list.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_set_style(style = list(stick = list())) %>%
#'   m_zoom_to() %>%
#'   m_set_view_style(style = list(style = "outline", color = "blue"))
m_set_view_style <- function(id, style) {
  method <- "setViewStyle"
  callJS()
}


#' Set the duration of the hover delay
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param hoverDuration an optional parameter that denotes
#' the duration of the hover delay (in milliseconds) before the hover action is called
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
m_set_hover_duration <- function(id, hoverDuration) {
  method <- "setHoverDuration"
  callJS()
}


#' Get viewer animate status
#'
#' Return true if viewer is currently being animated, false otherwise
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#'
#' @return \code{logical}
#' @export
#'
#' @examples
m_is_animated <- function(id) {
  # TODO Fix return value in callJS()
  method <- "isAnimated"
  callJS()
}
