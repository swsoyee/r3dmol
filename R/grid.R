#' Create a grid of viewers that share a WebGL canvas
#'
#' @param viewer A list contains sub-viewers.
#' @param element_id HTML string identifier.
#' @param rows Number of rows in viewer grid.
#' @param cols Number of columns in viewer grid.
#' @param control_all Logical, simaultaneous mouse control of all windows in the
#'  grid.
#' @param viewer_config Viewer specification to apply to all subviewers.
#' @param width Fixed width for combined viewer (in css units). Ignored when
#' used in a Shiny app -- use the \code{width} parameter in
#' \code{\link[r3dmol]{r3dmolOutput}}.
#' It is not recommended to use this parameter because the widget knows how to
#' adjust its width automatically.
#' @param height Fixed height for combined viewer (in css units). It is
#' recommended to not use this parameter since the widget knows how to adjust
#' its height automatically.
#'
#' @return An \code{r3dmol} object (the output from \code{r3dmol()}).
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' m1 <- r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_zoom_to()
#'
#' m2 <- m1 %>%
#'   m_set_style(style = m_style_cartoon(color = "spectrum"))
#'
#' m3 <- m1 %>%
#'   m_set_style(style = m_style_stick())
#'
#' m4 <- m1 %>%
#'   m_set_style(style = m_style_sphere())
#'
#' m_grid(
#'   viewer = list(m1, m2, m3, m4),
#'   control_all = TRUE,
#'   viewer_config = m_viewer_spec(
#'     backgroundColor = "black"
#'   )
#' )
m_grid <- function(viewer,
                   element_id,
                   rows = NULL,
                   cols = NULL,
                   control_all = TRUE,
                   viewer_config = m_viewer_spec(),
                   width = NULL,
                   height = NULL) {
  if (missing(element_id)) {
    element_id <- (sample(256, 10, replace = TRUE) - 1) %>%
      as.hexmode() %>%
      format(width = 2) %>%
      paste(collapse = "")
  }

  if (is.null(rows)) {
    rows <- ceiling(sqrt(length(viewer)))
  }

  if (is.null(cols)) {
    cols <- ceiling(length(viewer) / rows)
  }

  configs <- list(
    rows = rows,
    cols = cols,
    control_all = control_all
  )

  x <- list(
    viewer = viewer,
    element_id = element_id,
    configs = configs,
    viewer_config = viewer_config,
    api = "grid"
  )

  widget <- htmlwidgets::createWidget(
    name = "r3dmol",
    x,
    width = width,
    height = height,
    package = "r3dmol",
    elementId = element_id,
    sizingPolicy = htmlwidgets::sizingPolicy(
      defaultWidth = "100%",
      knitr.figure = FALSE,
      browser.fill = TRUE,
      padding = 0
    )
  )

  return(widget)
}
