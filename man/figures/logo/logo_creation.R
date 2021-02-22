library(hexSticker)
library(showtext)

font_add_google("Courier Prime", "courier")

stick <- sticker(
  subplot = "man/figures/logo/cartoon.png",
  package = "r3dmol",
  s_x = 1.05,
  s_y = 0.8,
  s_width = 1,
  s_height = 1,
  dpi = 600,
  p_family = "courier",
  p_size = 6,
  filename = "man/figures/logo/logo.png",
  p_color = "gray5",
  h_color = "gray20",
  h_fill = "#6CCBFA"
)


