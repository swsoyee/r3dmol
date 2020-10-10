#' Run examples of using \code{r3dmol} in a Shiny app
#'
#'
#' @examples
#' if (interactive()) {
#'   m_shiny_demo()
#' }
#' @export
m_shiny_demo <- function() {
  app_dir <- system.file("example", package = "r3dmol")
  if (app_dir == "") {
    stop("Could not find example directory. Try re-installing `r3dmol`.",
      call. = FALSE
    )
  }

  shiny::runApp(app_dir, display.mode = "normal")
}
