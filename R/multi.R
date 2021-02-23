#' List of multiple start/stop locations.
#'
#' For use in addition of lines, arrows, cylinders, when multiple
#' locations are specified in a single call.
#'
#' @param starts Start locations, either \code{m_vector3()} or \code{m_sel()}
#' @param ends End locations, either \code{m_vector3()} or \code{m_sel()}
#' @param pairwise Logical, TRUE returns all possible combinations of start
#' and end locations.

.m_multi_spec <- function(
                          starts,
                          ends,
                          pairwise = FALSE) {
  l.starts <- length(starts)
  l.ends <- length(ends)

  if (l.starts == 0 | l.ends == 0) {
    stop("Must provide starting and ending positions.")
  }

  if (l.starts != l.ends) {
    pairwise <- TRUE
    warning(paste(
      "The number of start positions does not equal the number of",
      "end positions. Defaulting to pairwise combinations."
    ))
  }

  line_list <- list()

  if (pairwise == TRUE) {
    if (l.starts == l.ends) {
      message("Pairwise combinations selected.")
    }

    n.comb <- l.starts * l.ends
    comb <- expand.grid(starts, ends)

    for (i in 1:n.comb) {
      spec <- list(
        start = comb[i, ][[1]][[1]],
        end = comb[i, ][[2]][[1]]
      )
      line_list[[i]] <- spec
    }
    line_list
  } else {
    n.comb <- l.starts

    for (i in 1:n.comb) {
      spec <- list(
        start = starts[[i]],
        end = ends[[i]]
      )
      line_list[[i]] <- spec
    }
    line_list
  }
}
