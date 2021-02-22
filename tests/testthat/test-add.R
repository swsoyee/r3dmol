describe("m_add_lines()", {
  it("arguments check", {
  model <- r3dmol() %>%
    m_add_model(data = pdb_6zsl)

  line_specs <- NULL

  expect_error(
    model %>% m_add_lines(line_specs = line_specs),
    "`line_specs` should be passed in."
  )
  expect_error(
    model %>% m_add_lines(),
    "`line_specs` should be passed in."
  )
  })
})
