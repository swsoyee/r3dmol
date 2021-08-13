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



##### Test functions for making custom buttons
library(r3dmol)


to_selection <- function(sel) {
  string <- gsub("\\\"", "", sel)
  string <- gsub("(?=\\d+)", "\"", string)
  string
}

rjson::toJSON(m_sel(resi = c(1,10))) %>%
  to_selection()

m_sel(resi = c(1,10), chain = "A", resn = c("ALA", "GLY")) %>% rjson::toJSON()

m_2json <- function(sel) {

  print(names(sel))
  unlist(sel)
  paste0(
    "{", names(),"}"
  )
}



m_button_style <- function(id, style = m_style_cartoon(), sel = m_sel(), label = "style") {



  m_button(
    id = id,
    name = "cartoon",
    label = label,
    align_items = "flex-end",
    justify_content = "center",
    func = paste0("
        function() {
          viewer.addStyle(", rjson::toJSON(sel), ",", rjson::toJSON(style), ");
          viewer.render();
        }
      "
    )
  )
}

m_button_style2 <- function(id){
  m_button(
    id = id,
    name = "stick",
    label = "Stick",
    func = "
      function() {
        viewer.setStyle({stick:{}});
        viewer.render();
      }
    "
  )
}

m_button_spin <- function(id, speed = 1, axis = "y", label = "Spin"){
  m_button(
    id = id,
    name = "spin",
    label = label,
    func = paste0("
        function() {
          viewer.spin(\"", axis, "\",", speed, ");
          viewer.render();
      }
      ")
  )
}

m_button_stop_spin <- function(id, label = "Stop!") {
  m_button(
    id = id,
    name = "stopspin",
    label = "Stop!",
    func = paste0("
                  function() {
                    viewer.spin(false);
                    viewer.render()
                  }")
  )
}

m_button_zoom <- function(id, sel = m_sel(), label = "Zoom!") {
  m_button(
    id = id,
    name = "zoom",
    label = label,
    func = paste0(
      "
      function() {
        viewer.zoomTo(", rjson::toJSON(sel), ");
        viewer.render();
      }"
    )
  )
}

m_function() {
  paste0(
    "
    function() {

    }"
  )
}

m_button_make <- function(x) {
  print(environment(x))
}

m_button_make(c())

m_glimpse("4ozs")

m_button_style(sel = m_sel(resn = c("ALA", "GLY")),
               style = m_style_stick(color = "red"),
               label = "Sticks") %>%
  m_button_style(style = m_style_cartoon(color = "spectrum"),
                 label = "Cartoon") %>%
  # m_button_style2() %>%
  m_button_spin(speed = 0.2) %>%
  m_button_spin(speed = -0.2, label = "Reverse!") %>%
  m_button_stop_spin() %>%
  m_button_zoom(m_sel(resi = 1:30)) %>%
  m_button_zoom(label = "Zoom out!")
