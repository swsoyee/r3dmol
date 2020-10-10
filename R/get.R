#' Return specified model
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @param modelId Retrieve model with specified id
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
#'
m_get_model <- function(id, modelId) {
  method <- "getModel"
  callJS()
}


#' Get viewer animate status
#'
#' Return true if viewer is currently being animated, false otherwise
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#'
#' @return \code{logical}
#' @export
#'
m_is_animated <- function(id) {
  method <- "isAnimated"
  callJS()
}
