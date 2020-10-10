test_that("`m_vector3()` create a 3 dimensional vector", {
  vector3 <- m_vector3(1, 2, 3)

  expect_s3_class(vector3, "Vector3")
  expect_equal(vector3$x, 1)
  expect_equal(vector3$y, 2)
  expect_equal(vector3$z, 3)

  expect_error(m_vector3(1))
  expect_error(m_vector3(1, 2))
  expect_error(m_vector3("a", "b", "c"))
})
