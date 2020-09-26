#' Rotate scene by angle degrees around axis
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param angle Angle, in degrees \code{numeric}, to rotate by.
#' @param axis Axis (\code{"x"}, \code{"y"}, \code{"z"}, \code{"vx"}, \code{"vy"}, \code{"vz"})
#' to rotate around. Default \code{"y"}. View relative (rather than model relative) axes are
#'  prefixed with \code{"v"}. Axis can also be specified as a vector.
#' @param animationDuration an optional parameter of milliseconds \code{numeric} that denotes
#' the duration of the rotation animation. Default \code{0} (no animation)
#' @param fixedPath if \code{true} animation is constrained to
#' requested motion, overriding updates that happen during the animation
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#' r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_rotate(angle = 90, axis = "y", animationDuration = 1000)
m_rotate <- function(id, angle, axis = "v", animationDuration = 0, fixedPath) {
  if (!axis %in% c("x", "y", "z", "vx", "vy", "vz") && class(axis) != "Vector3") {
    stop("Unknow axis.")
  }
  method <- "rotate"
  callJS()
}

#' Continuously rotate a scene around the specified axis
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param axis Axis (\code{"x"}, \code{"y"}, \code{"z"}, \code{"vx"}, \code{"vy"}, \code{"vz"})
#' to rotate around. Default \code{"y"}. View relative (rather than model relative) axes are
#'  prefixed with \code{"v"}.
#'
#' @return R3dmol id or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#' r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_zoom_to() %>%
#'   m_spin()
m_spin <- function(id, axis = "y") {
  if (!axis %in% c("x", "y", "z", "vx", "vy", "vz")) {
    stop("Unknow axis.")
  }
  method <- "spin"
  callJS()
}

#' Stop animation of all models in viewer
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#'
#' @export
#'
m_stop_animate <- function(id) {
  method <- "stopAnimate"
  callJS()
}


#' @rdname m_translate
#' @export
m_translate <- function(id, x, y, animationDuration, fixedPath) {
  method <- "translate"
  callJS()
}

#' @rdname m_translate
#' @export
m_translate_scene <- function(id, x, y, animationDuration, fixedPath) {
  method <- "translateScene"
  callJS()
}


#' Zoom current view by a constant factor
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param factor Magnification \code{numeric} factor. Values greater than \code{1} will
#' zoom in, less than one will zoom out. Default \code{2}.
#' @param animationDuration an optional parameter of milliseconds \code{numeric} that
#' denotes the duration of a zoom animation
#' @param fixedPath if \code{true} animation is constrained to
#' requested motion, overriding updates that happen during the animation
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_zoom_to() %>%
#'   m_zoom(factor = 2, animationDuration = 1000)
m_zoom <- function(id, factor = 2, animationDuration, fixedPath) {
  method <- "zoom"
  callJS()
}

#' Zoom to center of atom selection
#'
#' Zoom to center of atom selection. The slab will be set appropriately for
#' the selection, unless an empty selection is provided, in which case there will be no slab.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param sel Selection specification specifying model and atom
#' properties to select. Default: all atoms in viewer.
#' @param animationDuration an optional parameter of milliseconds \code{numeric} that
#' denotes the duration of a zoom animation
#' @param fixedPath if \code{true} animation is constrained to
#' requested motion, overriding updates that happen during the animation
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_zoom_to()
m_zoom_to <- function(id, sel, animationDuration, fixedPath) {
  method <- "zoomTo"
  callJS()
}


#' Add model's vibration
#'
#' If atoms have dx, dy, dz properties (in some xyz files),
#' vibrate populates each model's frame property based on parameters.
#' Models can then be animated.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param numFrames Number of frames to be created, default to 10
#' @param amplitude Amplitude of distortion, default to 1 (full)
#' @param bothWays If true, extend both in positive and negative directions by numFrames
#' @param arrowSpec Specification for drawing animated arrows. If color isn't specified,
#' atom color (sphere, stick, line preference) is used.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' xyz <- "4
#' * (null), Energy   -1000.0000000
#' N     0.000005    0.019779   -0.000003   -0.157114    0.000052   -0.012746
#' H     0.931955   -0.364989    0.000003    1.507100   -0.601158   -0.004108
#' H    -0.465975   -0.364992    0.807088    0.283368    0.257996   -0.583024
#' H    -0.465979   -0.364991   -0.807088    0.392764    0.342436    0.764260
#' "
#'
#' r3dmol() %>%
#'   m_add_model(data = xyz, format = "xyz") %>%
#'   m_set_style(style = list(stick = list())) %>%
#'   m_vibrate(numFrames = 10, amplitude = 1) %>%
#'   m_animate(options = list(loop = "backAndForth", reps = 0)) %>%
#'   m_zoom_to()
m_vibrate <- function(id, numFrames, amplitude, bothWays, arrowSpec) {
  method <- "vibrate"
  callJS()
}
