describe("m_add_line()", {
  it("arguments check", {
    model <- r3dmol() %>%
      m_add_model(data = pdb_6zsl)

    expect_error(
      model %>% m_add_line(),
      "At least 1 start and 1 end must be passed in."
    )
  })
})
