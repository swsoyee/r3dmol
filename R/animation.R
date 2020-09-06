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
#' r3dmol(data_path = pdb_6zsl) %>%
#'   m_rotate(angle = 90, axis = "y", animationDuration = 1000)
m_rotate <- function(id, angle, axis = "v", animationDuration = 0, fixedPath) {
  if (!axis %in% c("x", "y", "z", "vx", "vy", "vz")) {
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
#' r3dmol(data_path = pdb_6zsl) %>%
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
#' @examples
m_stop_animate <- function(id) {
  method <- "stopAnimate"
  callJS()
}


#' Translate current view by x,y screen coordinates
#'
#' This pans the camera rather than translating the model.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param x Relative change \code{numeric} in view coordinates of camera
#' @param y Relative change \code{numeric} in view coordinates of camera
#' @param animationDuration an optional parameter of milliseconds \code{numeric} that
#' denotes the duration of a zoom animation
#' @param fixedPath if \code{true} animation is constrained to
#' requested motion, overriding updates that happen during the animation
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
m_translate <- function(id, x, y, animationDuration, fixedPath) {
  method <- "translate"
  callJS()
}

#' Translate current models by x,y screen coordinates
#'
#' This translates the models relative to the current view. It does
#' not change the center of rotation.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param x Relative change \code{numeric} in view coordinates of camera
#' @param y Relative change \code{numeric} in view coordinates of camera
#' @param animationDuration an optional parameter of milliseconds \code{numeric} that
#' denotes the duration of a zoom animation
#' @param fixedPath if \code{true} animation is constrained to
#' requested motion, overriding updates that happen during the animation
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
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
m_zoom <- function(id, factor = 2, animationDuration, fixedPath) {
  method <- "zoom"
  callJS()
}
