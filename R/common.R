#' Render current state of viewer
#'
#' Render current state of viewer, after adding/removing models,
#' applying styles, etc. In most cases, the model will render automatically,
#' only call it when manual rendering is required.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#'
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_render()
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
#' r3dmol(width = 400,
#'        height = 400,
#'        backgroundColor = "0xeeeeee") %>%
#'   m_add_model(data = xyz,
#'               format = "xyz",
#'               options = list(vibrate = list(frames = 10, amplitude = 1))) %>%
#'   m_set_style(style = list(stick = list())) %>%
#'   m_animate(list(loop = "backAndForth")) %>%
#'   m_zoom_to()
m_animate <- function(id, options) {
  method <- "animate"
  callJS()
}
