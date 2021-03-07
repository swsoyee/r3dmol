#' Create a grid of viewers that share a WebGL canvas
#'
#' @param viewer a list contains sub-viewers.
#' @param element_id HTML string identifier.
#' @param configs grid configuration.
#' @param viewer_config viewer specification to apply to all subviewers.
#' @param width Fixed width for viewer (in css units). Ignored when used in a
#' Shiny app -- use the \code{width} parameter in
#' \code{\link[r3dmol]{r3dmolOutput}}.
#' It is not recommended to use this parameter because the widget knows how to
#' adjust its width automatically.
#' @param height Fixed height for viewer (in css units). It is recommended to
#' not use this parameter since the widget knows how to adjust its height
#' automatically.
#'
#' @return
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
#'   configs = list(rows = 2, cols = 2, control_all = TRUE),
#'   viewer_config = list(backgroundColor = "black")
#' )
m_grid <- function(viewer,
                   element_id,
                   configs,
                   viewer_config = list(),
                   width = NULL,
                   height = NULL) {
  if (missing(element_id)) {
    element_id <- (sample(256, 10, replace = TRUE) - 1) %>%
      as.hexmode() %>%
      format(width = 2) %>%
      paste(collapse = "")
  }
  if (missing(configs)) {
    configs <- list(
      rows = 1,
      cols = length(viewer),
      control_all = TRUE
    )
  }

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
