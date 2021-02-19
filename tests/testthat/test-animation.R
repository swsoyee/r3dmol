describe("m_spin", {
  model <- r3dmol() %>%
    m_add_model(data = pdb_6zsl, format = "pdb")

  it("invalid args validation", {
    expect_error(
      model %>% m_spin(axis = "a"),
      "Unknow axis."
    )
    expect_error(
      model %>% m_spin(speed = "a"),
      "Speed multiplier must be numeric."
    )
  })
})
