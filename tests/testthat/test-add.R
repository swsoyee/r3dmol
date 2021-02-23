describe("m_add_lines()", {
  it("arguments check", {
  model <- r3dmol() %>%
    m_add_model(data = pdb_6zsl)

  expect_error(
    model %>% m_add_lines(starts = NULL, ends = m_sel(resi = 1)),
    "Must provide starting and ending positions."
  )
  expect_error(
    model %>% m_add_lines(),
    "At least 1 start and 1 end must be passed in."
  )
  })
})
