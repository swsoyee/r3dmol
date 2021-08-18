#' Add button into viewer
#'
#' Add additional buttons to the viewer and manually pass in JavaScript
#' functions to enable additional actions to be done when the button is clicked
#' (such as styling changes to the model). You can also use css flex layout to
#' control the layout of all added buttons.
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
#'   m_button_manual(
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
#'   m_button_manual(
#'     name = "stick",
#'     label = "Stick",
#'     func = "
#'       function() {
#'         viewer.setStyle({stick:{}});
#'         viewer.render();
#'       }
#'     "
#'   )
m_button_manual <- function(id,
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



#' Add button for Adding a Style
#'
#' Creates a button that will add the given style to the selection when pressed.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()}).
#' @param style Style spec to apply to specified atoms using \code{m_style_*()}.
#'   Multiple styles can be supplied inside a vector (i.e.)
#'   \code{c(m_style_cartoon(), m_style_stick())}.
#' @param sel Atom selection specification with \code{m_sel()}
#' @param label String for button label.
#'
#' @return
#' @export
#'
#' @examples
m_button_add_style <-
  function(id,
           style = m_style_cartoon(),
           sel = m_sel(),
           label = "Style") {
  m_button_manual(
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

#' Add a button for overwriting a style
#'
#' Adds a button that will overwrite the style for the given selection with the
#' new given styles.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()}).
#' @param style Style spec to apply to specified atoms using \code{m_style_*()}
#' @param sel Atom selection specification with \code{m_sel()}
#' @param label String for button label.
#'
#' @return
#' @export
#'
#' @examples
m_button_set_style <-
  function(id,
           style = m_style_cartoon(),
           sel = m_sel(),
           label = "Style") {
  m_button_manual(
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

#' Add a button for spinning the scene
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()}).
#' @param speed Speed multiplier for spin animation. Defaults to 1. Negative
#'   value reverses the direction of spin.
#' @param axis Axis (\code{"x"}, \code{"y"}, \code{"z"}, \code{"vx"},
#'   \code{"vy"}, \code{"vz"}) to rotate around. Default \code{"y"}. View
#'   relative (rather than model relative) axes are prefixed with \code{"v"}.
#' @param label String for button label.
#' @param stopButton Logical, whether to also create a button to stop the spin.
#' @param stopLabel String for the stop button label.
#'
#' @return
#' @export
#'
#' @examples
m_button_spin <-
  function(id,
           speed = 1,
           axis = "y",
           label = "Spin",
           stopButton = TRUE,
           stopLabel = "Stop") {

  id <- m_button_manual(
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

  if (stopButton) {
    id <- m_button_manual(
      id = id,
      name = "stopSpin",
      label = stopLabel,
      func = paste0("
          function() {
            viewer.spin(false);
            viewer.render();
        }
        ")
    )
  }

  id
}

#' Add a button for zooming to a selection
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()}).
#' @param sel Atom selection specification with \code{m_sel()}
#' @param label String for button label.
#' @param duration Duration of the zoom animation in milliseconds. (Default 500)
#' @param zoomOut Logical, whether to also create a button that will reset the
#'   view to encompass the entire scene.
#' @param zoomOutLabel String for zoom out button label.
#'
#' @return
#' @export
#'
#' @examples
m_button_zoom_to <- function(id,
                             sel = m_sel(),
                             label = "Zoom",
                             duration = 500,
                             zoomOut = TRUE,
                             zoomOutLabel = "Zoom Out") {

  id <- m_button_manual(
    id = id,
    name = label,
    label = label,
    func = paste0(
      "
      function() {
        viewer.zoomTo(", rjson::toJSON(sel), ",", duration ,");
      }"
    )
  )

  if (zoomOut) {
    id <- m_button_manual(
      id = id,
      name = zoomOutLabel,
      label = zoomOutLabel,
      func = paste0("
      function() {
        viewer.zoomTo({},", duration,");
      }")
    )
  }

  id
}


#' Add a button for adding a surface
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()}).
#' @param label String for button label.
#' @param type Surface type ('VDW', 'MS', 'SAS', or 'SES')
#' @param style Optional style specification for surface material created with \code{m_style_surface()} to alter color and opacity.
#' @param atomsel Show surface for atoms in this selection.
#' @param allsel Use different atoms to calculate the surface than to display
#'   it. May be a larger selection than \ocode{atomsel}.
#' @param removeSurface Logical, whether to also create a button that will
#'   remove all surfaces from the viewer.
#' @param removeLabel String for clear surface button label.
#'
#' @return
#' @export
#'
#' @examples
m_button_add_surface <- function(id,
                                 label = "Surface",
                                 type = "VDW",
                                 style = m_style_surface(),
                                 atomsel = m_sel(),
                                 allsel = NULL,
                                 removeSurface = TRUE,
                                 removeLabel = "Clear Surfaces") {

  if (is.null(allsel)) allsel <- atomsel

  id <- m_button_manual(
    id = id,
    name = "surface",
    label = label,
    func = paste0("
      function() {
        viewer.addSurface($3Dmol.SurfaceType.", type, ",",
      rjson::toJSON(style), ",",
      rjson::toJSON(atomsel), ",",
      rjson::toJSON(allsel),
      ");
        viewer.render();
      }")
  )

  if (removeSurface) {
    id <- m_button_manual(
      id = id,
      name = "clearSurface",
      label = removeLabel,
      func = paste0("
                    function() {
                      viewer.removeAllSurfaces();
                      viewer.render();
                    }")
    )
  }

  id
}

#' Add a button for adding residue labels
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()}).
#' @param sel Atom selection specification with \code{m_sel()}
#' @param style Style spec to add to specified atoms created with \code{m_style_label()}.
#' @param label String for button label.
#' @param byframe if TRUE, create labels for every individual frame in an
#'   animation, not just the current.
#' @param hideButton Logical, whether to also create a button for removing all
#'   labels from the viewer.
#' @param hideLabel String for hide labels button label.
#'
#' @return
#' @export
#'
#' @examples
m_button_add_res_labels <- function(id,
                                    sel = m_sel(),
                                    style = m_style_label(),
                                    label = "Show Labels",
                                    byframe = FALSE,
                                    hideButton = TRUE,
                                    hideLabel = "Hide Labels") {
  id <- m_button_manual(
    id = id,
    name = label,
    label = label,
    func = paste0("
                  function() {
                    viewer.addResLabels(", rjson::toJSON(sel),
                  ",",
                  rjson::toJSON(style),
                  ",",
                  ifelse(byframe, "true", "false"),
                  ");
                  viewer.render();

                  }")
  )

  if (hideButton) {
    id <- m_button_manual(
      id = id,
      name = hideLabel,
      label = hideLabel,
      func = "
      function() {
        viewer.removeAllLabels();
        viewer.render();
      }"
    )
  }

  id
}

#' Add a button for starting and stopping animations
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()}).
#' @param interval Time in milliseconds between frames.
#' @param loop Direction of animation loop. \code{'backward'}, \code{'forward'}
#'   or \code{'backAndForth'}
#' @param step How many frames to step through. 1 plays every frame, 2 skips
#'   every second frame etc.
#' @param reps How many times to repeat the animation. 0 loops indefinitely.
#' @param label String for button label.
#' @param stopButton Logical, whether to also create a button to stop the
#'   currently playing animation.
#' @param stopLabel String for stop for stop animation button label.
#'
#' @return
#' @export
#'
#' @examples
m_button_animate <- function(id,
                             interval = 50,
                             loop = "backAndForth",
                             step = 1,
                             reps = 0,
                             label = "Play Animation",
                             stopButton = TRUE,
                             stopLabel = "Stop Animation") {
  id <- m_button_manual(
    id = id,
    name = label,
    label = label,
    func = paste0("
    function() {
      viewer.animate(", rjson::toJSON(list(
        interval = interval,
                                           loop = loop,
                                           step = step,
                                           reps = reps)), ");
      viewer.render();
    }")
  )

  if (stopButton) {
    id <- m_button_manual(
      id = id,
      name = stopLabel,
      label = stopLabel,
      func = "
      function() {
        viewer.stopAnimate();
        viewer.render();
      }"
    )
  }

  id
}
