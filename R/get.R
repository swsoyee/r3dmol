#' Return specified model
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param modelId Retrieve model with specified id
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @export
#'
#' @examples
m_get_model <- function(id, modelId) {
  method <- "getModel"
  callJS()
}
