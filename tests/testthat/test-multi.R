describe(".m_multi_spec()", {
  it("arguments check", {
    expect_error(
      .m_multi_spec(ends = m_sel(resi = 1)),
      'argument "starts" is missing, with no default'
    )
  })
  it("returns matched start and end points, #spec == #starts == #ends", {
    expect_length(
      .m_multi_spec(
        starts = m_multi_resi_sel(resi = c(1, 10)),
        ends = list(m_sel(resi = 2), m_sel(resi = 3))
      ), 2
    )
  })

  it("error if mismatch in input lengths", {
    model <- r3dmol() %>%
      m_add_model(data = pdb_6zsl)

    expect_error(
      model %>%
        m_add_line(
          starts = list(m_sel(resi = 1), m_sel(resi = 2)),
          ends = list(m_sel(resi = 3), m_sel(resi = 4)),
          dashed = c(TRUE, FALSE, TRUE)
        ),
      paste("dashed options must of length 1 or equal to the number of line",
            "starts & stops.")
    )
    expect_error(
      model %>%
        m_add_line(
          starts = list(m_sel(resi = 1), m_sel(resi = 2)),
          ends = list(m_sel(resi = 3), m_sel(resi = 4)),
          hidden = c(TRUE, FALSE, TRUE)
        ),
      paste("hidden options must of length 1 or equal to the number of line",
            "starts & stops.")
    )
    expect_error(
      model %>%
        m_add_line(
          starts = list(m_sel(resi = 1), m_sel(resi = 2)),
          ends = list(m_sel(resi = 3), m_sel(resi = 4)),
          color = c("blue", "red", "green")
        ),
      paste("color options must of length 1 or equal to the number of line",
            "starts & stops.")
    )
  })
})
