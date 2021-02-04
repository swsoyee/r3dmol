test_that("`m_viewer_spec()` create a `ViewerSpec` object of viewer setting and has default value", {
  viewer_spec <- m_viewer_spec()

  expect_s3_class(viewer_spec, "ViewerSpec")

  expect_equal(viewer_spec$id, NULL)
  expect_equal(viewer_spec$defaultcolors, NULL)
  expect_equal(viewer_spec$cartoonQuality, 5)
  expect_equal(viewer_spec$antialias, TRUE)
  expect_equal(viewer_spec$nomouse, FALSE)
  expect_equal(viewer_spec$backgroundColor, "white")
  expect_equal(viewer_spec$lowerZoomLimit, 5)
  expect_equal(viewer_spec$upperZoomLimit, 400)
  expect_equal(viewer_spec$orthographic, FALSE)
  expect_equal(viewer_spec$disableFog, FALSE)
})

test_that("`m_viewer_spec()` options are able to changed", {
  viewer_spec <- m_viewer_spec(
    id = "1",
    defaultcolors = "#fff",
    cartoonQuality = 6,
    antialias = FALSE,
    nomouse = TRUE,
    backgroundColor = "#fff",
    lowerZoomLimit = 0,
    upperZoomLimit = 1000,
    orthographic = TRUE,
    disableFog = TRUE
  )

  expect_equal(viewer_spec$id, "1")
  expect_equal(viewer_spec$defaultcolors, "#fff")
  expect_equal(viewer_spec$cartoonQuality, 6)
  expect_equal(viewer_spec$antialias, FALSE)
  expect_equal(viewer_spec$nomouse, TRUE)
  expect_equal(viewer_spec$backgroundColor, "#fff")
  expect_equal(viewer_spec$lowerZoomLimit, 0)
  expect_equal(viewer_spec$upperZoomLimit, 1000)
  expect_equal(viewer_spec$orthographic, TRUE)
  expect_equal(viewer_spec$disableFog, TRUE)
})
