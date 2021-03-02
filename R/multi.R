#' List of multiple start/stop locations.
#'
#' For use in addition of lines, arrows, cylinders, when multiple
#' locations are specified in a single call.
#'
#' @param starts Start locations, either \code{m_vector3()} or \code{m_sel()}
#' @param ends End locations, either \code{m_vector3()} or \code{m_sel()}
#' and end locations.
#' @keywords internal
.m_multi_spec <- function(
                          starts,
                          ends) {
  # get number of starting and ending points
  length_starts <- length(starts)
  length_ends <- length(ends)

  # For each given start location, match it with an end location and combine
  # into a list of specifications, each with a start and end location.
  line_list <- list()

  for (i in 1:length_starts) {
    spec <- list(
      start = starts[[i]],
      end = ends[[i]]
    )
    line_list[[i]] <- spec
  }
  line_list
}
