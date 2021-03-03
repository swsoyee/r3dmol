describe("m_add_line()", {
  model <- r3dmol() %>%
    m_add_model(data = pdb_6zsl)

  it("missing start and length check", {
    expect_error(
      model %>%
        m_add_line(
          start = list(
            m_sel(resi = 1, chain = "A"),
            m_sel(resi = 1, chain = "A")
          )
        ),
      "At least 1 `start` and 1 `end` must be passed in."
    )
  })

  it("start and end length check", {
    expect_error(
      model %>%
        m_add_line(
          start = list(
            m_sel(resi = 1, chain = "A"),
            m_sel(resi = 1, chain = "A")
          ),
          end = list(
            m_sel(resi = 10, chain = "A")
          ),
          dashed = TRUE
        ),
      "length of `start` must be equal to length of `end`."
    )
  })
})
