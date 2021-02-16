options_check <- function(options, result) {
  for (index in seq_along(options)) {
    name <- names(options[index])
    if (!is.null(result[[name]])) {
      expect_equal(result[[name]], options[[name]])
    }
  }
}
