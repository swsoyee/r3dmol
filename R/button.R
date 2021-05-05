#' Add button into viewer
#'
#' Add additional buttons to the viewer and pass in JavaScript functions to
#' enable additional actions to be done when the button is clicked (such as
#' styling changes to the model). You can also use css flex layout to control
#' the layout of all added buttons.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()}).
#' @param name Name for button.
#' @param label Label for button.
#' @param func The function executed when the button is clicked.
#' @param align_items The css \code{align-items} property specifies the default
#' alignment for items inside the viewer.
#' @param justify_content The css \code{justify-content} property aligns the
#' buttons when the items do not use all available space on the main-axis
#' (horizontally).
#'
#' @details If more than one button is set, only the layout
#' (\code{justify-content} and \code{align-items}) of the first button will be
#' used.
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
#'     align_items = "flex-end",
#'     justify_content = "center",
#'     func = "
#'       function() {
#'         viewer.setStyle({cartoon:{}});
#'         viewer.render();
#'       }
#'     "
#'   ) %>%
#'   m_button(
#'     name = "stick",
#'     label = "Stick",
#'     func = "
#'       function() {
#'         viewer.setStyle({stick:{}});
#'         viewer.render();
#'       }
#'     "
#'   )
m_button <- function(id,
                     name,
                     label,
                     func,
                     align_items = "flex-start",
                     justify_content = "flex-start") {
  if (missing(label)) {
    stop("`label` is a required argument.")
  }
  if (missing(func)) {
    stop("`func` is a required argument.")
  }
  method <- "button"
  callJS()
}
