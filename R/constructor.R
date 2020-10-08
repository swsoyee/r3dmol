#' Create a 3 dimensional vector
#'
#' @param x x coordinate, \code{character} and \code{numeric} are both accepted.
#' @param y y coordinate, \code{character} and \code{numeric} are both accepted.
#' @param z z coordinate, \code{character} and \code{numeric} are both accepted.
#'
#' @return 3 dimensional list object
#' @export
#'
#' @examples
#' library(r3dmol)
#' m_vector3(1, 2, 3)
m_vector3 <- function(x = 0,
                      y = 0,
                      z = 0) {
  if (missing(x) || missing(y) || missing(z)) {
    stop("3 dimensional should by passed.")
  }

  vector_char <- as.character(c(x, y, z))
  vector_number <- tryCatch(
    {
      as.numeric(vector_char)
    },
    warning = function(w) {
      stop("Dimensional is not number.")
    },
    error = function(e) {
      stop("Dimensional format error.")
    }
  )

  result <- list(
    x = vector_number[1],
    y = vector_number[2],
    z = vector_number[3]
  )
  class(result) <- "Vector3"
  return(result)
}
