test_that("r3dmol()", {
  expect_error(
    r3dmol(elementId = "100"),
    "ElementId is not validate. Please use id that starts with letter."
  )
})
