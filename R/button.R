#' Add button into viewer
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()}).
#' @param name Name for button.
#' @param label Label for button.
#' @param func The function executed when the button is clicked.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_model(data = pdb_1j72, format = "pdb") %>%
#'   m_zoom_to() %>%
#'   m_button(
#'     name = "cartoon",
#'     label = "Cartoon",
#'     func = "
#'       function(){
#'         viewer.setStyle({cartoon:{}});
#'         viewer.render();
#'       }
#'     "
#'   )
m_button <- function(id,
                     name,
                     label,
                     func) {
  if (missing(label)) {
    stop("`label` is a required argument.")
  }
  if (missing(func)) {
    stop("`func` is a required argument.")
  }
  method <- "button"
  callJS()
}
