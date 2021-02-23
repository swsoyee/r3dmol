describe("m_fetch_pdb()", {
  it("stop the function if pdb isn't a string", {
    expect_error(
      m_fetch_pdb(1),
      "pdb must be character string. e.g.'1bna'"
    )
  })
})
