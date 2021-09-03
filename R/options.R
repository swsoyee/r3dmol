#' Specifying setup options for viewer
#'
#' Returns a list for the setup \code{r3dmol()} function, to set
#' overall settings for the viewer going forward.
#'
#' @param defaultcolors Object defining default atom colors as atom => color
#' property value pairs for all models within this viewer.
#' @param nomouse Whether to disable handling of mouse events. Disabled will
#' prevent user interaction.
#' @param backgroundColor color of the canvas's background.
#' @param id id of the canvas.
#' @param cartoonQuality Defaults to \code{5}.
#' @param lowerZoomLimit Specify how far the user can zoom in.
#' @param upperZoomLimit Specify how far the user can zoom out.
#' @param antialias Logical, disable to decrease quality but improve
#' performance.
#' @param orthographic Logical. Setting orthographic instead of perspective
#' representation.
#' @param disableFog Logical, disable fog, defaults to \code{FALSE}
#' @export
m_viewer_spec <- function(id = NULL,
                          defaultcolors = NULL,
                          cartoonQuality = 5,
                          antialias = TRUE,
                          nomouse = FALSE,
                          backgroundColor = "white",
                          lowerZoomLimit = 5,
                          upperZoomLimit = 400,
                          orthographic = FALSE,
                          disableFog = FALSE) {
  viewer_spec <- list(
    defaultcolors = defaultcolors,
    nomouse = nomouse,
    backgroundColor = backgroundColor,
    id = id,
    cartoonQuality = cartoonQuality,
    lowerZoomLimit = lowerZoomLimit,
    upperZoomLimit = upperZoomLimit,
    antialias = antialias,
    orthographic = orthographic,
    disableFog = disableFog
  ) %>% .cleanup_nulls()

  class(viewer_spec) <- "ViewerSpec"
  viewer_spec
}
