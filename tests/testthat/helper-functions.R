options_check <- function(options, result) {
  for(index in seq_along(options)) {
    name <- names(options[index])
    expect_equal(result[[name]], options[[name]])
  }
}
