#' Run examples of using \code{r3dmol} in a Shiny app
#'
#'
#' @examples
#' if (interactive()) {
#'   m_shiny_demo()
#' }
#' @export
m_shiny_demo <- function() {
  appDir <- system.file("example", package = "r3dmol")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `r3dmol`.",
         call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
