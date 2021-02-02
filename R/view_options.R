#' Specifying setup options for Viewer
#'
#' Returns a list for the setup \code{r3dmol()} function, to set
#' overall settings for the viewer going forward.
#'
#' @param defaultcolors Object defining default atom colors as atom => color
#' property value pairs for all models within this viewer
#' @param nomouse Whether to disable handling of mouse events. Disabled will
#' prevent user interaction.
#' @param backgroundColor color of the canvas's background.
#' @param id id of the canvas
#' @param cartoonQuality Defaults to 5
#' @param lowerZoomLimit Specify how far the user can zoom in.
#' @param upperZoomLimit Specify how far the user can zoom out.
#' @param antialias Logical whether to enable antialiasing, improving graphical
#' quality. (can slow down large structures)
#' @param orthographic Logical. Setting orthographic instead of perspective
#' representation.
#' @param disableFog Logical, disable fog, defaults to \code{FALSE}
#' @export
m_viewer_spec <- function(
                          id = NULL,
                          defaultcolors = NULL,
                          cartoonQuality = 5,
                          antialias = FALSE,
                          nomouse = FALSE,
                          backgroundColor = "white",
                          lowerZoomLimit = NULL,
                          upperZoomLimit = NULL,
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
  )
  viewer_spec <- cleanup_nulls(viewer_spec)
  viewer_spec
}
