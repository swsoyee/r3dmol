#' Render current state of viewer
#'
#' Render current state of viewer, after adding/removing models,
#' applying styles, etc.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#'
#' @export
#'
#' @examples
m_render <- function(id) {
  method <- "render"
  callJS()
}

#' Enable/disable fog for content far from the camera
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param fog whether to enable or disable the fog, default is \code{TRUE}.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_set_style(style = list(cartoon = list())) %>%
#'   m_enable_fog(fog = F)
m_enable_fog <- function(id, fog = TRUE) {
  method <- "enableFog"
  callJS()
}


#' Re-center the viewer around the provided selection
#'
#' Re-center the viewer around the provided selection (unlike zoomTo, does not zoom).
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param sel Selection specification specifying model and atom
#' properties to select. Default: all atoms in viewer
#' @param animationDuration an optional parameter of milliseconds \code{numeric} that
#' denotes the duration of a zoom animation
#' @param fixedPath  if \code{true} animation is constrained to
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
#'   m_set_style(style = list(cartoon = list())) %>%
#'   m_center(animationDuration = 1000)
m_center <- function(id, sel, animationDuration, fixedPath) {
  method <- "center"
  callJS()
}

#' Animate all models in viewer from their respective frames
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param options can specify \code{interval} (speed of animation), \code{loop} (direction
#' of looping, \code{'backward'}, \code{'forward'} or \code{'backAndForth'}), step interval
#' between frames (\code{'step'}), and \code{reps} (number of repetitions, \code{0}
#' indicates infinite loop)
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
m_animate <- function(id, options) {
  animate <- "animate"
  callJS()
}
