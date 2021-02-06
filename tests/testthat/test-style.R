test_that("`m_style_sphere()` create a `SphereStyleSpec` object of selection setting and has default value", {
  default <- list(
    hidden = FALSE,
    radius = 1,
    scale = 1,
    colorScheme = "default",
    color = NULL,
    opacity = 1
  )

  m_style_sphere <- m_style_sphere()

  expect_s3_class(m_style_sphere$sphere, "SphereStyleSpec")
  options_check(default, m_style_sphere$sphere)
})

test_that("`m_style_sphere()` options are able to set", {
  # Just for test the options can be set correctly
  options <- list(
    hidden = TRUE,
    radius = 2,
    scale = 2,
    colorScheme = "Carbon",
    color = "#000000",
    opacity = 0.5
  )

  m_style_sphere <- do.call(m_style_sphere, options)

  options_check(options, m_style_sphere$sphere)
})
