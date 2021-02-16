test_that("`m_sel()` create a `AtomSelectionSpec` with default value", {
  default <- list(
    model = NULL,
    resi = NULL,
    resn = NULL,
    invert = NULL,
    byres = NULL,
    expand = NULL,
    elem = NULL,
    chain = NULL,
    atom = NULL,
    bonds = NULL,
    ss = NULL,
    b = NULL,
    clickable = NULL,
    callback = NULL
  )

  m_sel <- m_sel()

  expect_s3_class(m_sel, "AtomSelectionSpec")
  options_check(default, m_sel)
})

test_that("`m_sel()` options are able to set", {
  # Just for test the options can be set correctly
  options <- list(
    model = "A",
    resi = "B",
    resn = "C",
    invert = "D",
    byres = "E",
    expand = "F",
    elem = "G",
    chain = "H",
    atom = "I",
    bonds = "J",
    ss = "K",
    b = "L",
    clickable = "M",
    callback = "N"
  )

  m_sel <- do.call(m_sel, options)

  options_check(options, m_sel)
})
