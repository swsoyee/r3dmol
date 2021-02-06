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

test_that("`m_style_sphere()` create a `SphereStyleSpec` object of selection setting and has default value", {
  default <- list(
    color = NULL,
    style = "rectangle",
    ribbon = FALSE,
    arrows = TRUE,
    tubes = FALSE,
    thickness = 0.4,
    width = NULL,
    opacity = 1,
    colorfunc = NULL
  )

  m_style_cartoon <- m_style_cartoon()

  expect_s3_class(m_style_cartoon$cartoon, "CartoonStyleSpec")
  options_check(default, m_style_cartoon$cartoon)
})

test_that("`m_style_cartoon()` options are able to set", {
  # Just for test the options can be set correctly
  options <- list(
    color = "#000000",
    style = "style",
    ribbon = TRUE,
    arrows = FALSE,
    tubes = TRUE,
    thickness = 1,
    width = 1,
    opacity = 0.5,
    colorfunc = "colorfunc"
  )

  m_style_cartoon <- do.call(m_style_cartoon, options)

  options_check(options, m_style_cartoon$cartoon)
})

test_that("`m_style_stick()` create a `StickStyleSpec` object of selection setting and has default value", {
  default <- list(
    radius = 0.4,
    singleBonds = FALSE,
    colorScheme = "default",
    color = NULL,
    opacity = 1,
    hidden = FALSE
  )

  m_style_stick <- m_style_stick()

  expect_s3_class(m_style_stick$stick, "StickStyleSpec")
  options_check(default, m_style_stick$stick)
})

test_that("`m_style_stick()` options are able to set", {
  # Just for test the options can be set correctly
  options <- list(
    radius = 1,
    singleBonds = TRUE,
    colorScheme = "Carbon",
    color = "#000000",
    opacity = 0.5,
    hidden = TRUE
  )

  m_style_stick <- do.call(m_style_stick, options)

  options_check(options, m_style_stick$stick)
})

test_that("`m_style_label()` create a `StickStyleSpec` object of selection setting and has default value", {
  default <- list(
    font = "sans-serif",
    fontSize = 18,
    fontColor = "white",
    fontOpacity = 1,
    backgroundColor = "black",
    backgroundOpacity = 1,
    borderOpacity = 1,
    borderThickness = 0,
    borderColor = "black",
    inFront = TRUE,
    showBackground = TRUE,
    fixed = FALSE,
    alignment = "topLeft",
    position = NULL,
    frame = NULL
  )

  m_style_label <- m_style_label()

  expect_s3_class(m_style_label, "LabelSpec")
  options_check(default, m_style_label)
})

test_that("`m_style_label()` options are able to set", {
  # Just for test the options can be set correctly
  options <- list(
    font = "A",
    fontSize = 20,
    fontColor = "black",
    fontOpacity = 0.5,
    backgroundColor = "white",
    backgroundOpacity = 0,
    borderOpacity = 0,
    borderThickness = 1,
    borderColor = "white",
    inFront = FALSE,
    showBackground = FALSE,
    fixed = TRUE,
    alignment = "topCenter",
    position = "position",
    frame = "frame"
  )

  m_style_label <- do.call(m_style_label, options)

  options_check(options, m_style_label)
})

test_that("`m_style_line()` create a `LineStyleSpec` object of selection setting and has default value", {
  default <- list(
    colorScheme = "default",
    color = NULL,
    opacity = 1,
    hidden = FALSE
  )

  m_style_line <- m_style_line()

  expect_s3_class(m_style_line$line, "LineStyleSpec")
  options_check(default, m_style_line$line)
})

test_that("`m_style_line()` options are able to set", {
  # Just for test the options can be set correctly
  options <- list(
    colorScheme = "Carbon",
    color = "#ffffff",
    opacity = 0.5,
    hidden = TRUE
  )

  m_style_line <- do.call(m_style_line, options)

  options_check(options, m_style_line$line)
})

test_that("`m_style_surface()` create a `SurfaceStyleSpec` object of selection setting and has default value", {
  default <- list(
    opacity = 1,
    colorScheme = "default",
    color = NULL
  )

  m_style_surface <- m_style_surface()

  expect_s3_class(m_style_surface, "SurfaceStyleSpec")
  options_check(default, m_style_surface)
})

test_that("`m_style_surface()` options are able to set", {
  # Just for test the options can be set correctly
  options <- list(
    opacity = 0.5,
    colorScheme = "Carbon",
    color = "#ffffff"
  )

  m_style_surface <- do.call(m_style_surface, options)

  options_check(options, m_style_surface)
})
