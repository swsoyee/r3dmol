library(hexSticker)
library(showtext)
library(magick)

# add font
font_add_google("Courier Prime", "courier")

# logo output path
logo_path <- "man/figures/logo.png"

# create the high resolution logo
sticker(
  subplot = "man/figures/cartoon.png",
  package = "r3dmol",
  s_x = 1.05,
  s_y = 0.75,
  s_width = 1,
  s_height = 1,
  dpi = 1000,
  p_family = "courier",
  p_size = 9,
  p_y = 1.37,
  filename = logo_path,
  p_color = "gray90",
  h_color = "gray5",
  h_fill = "#49545B",
  h_size = 1.2,
)

# load the logo png back
logo <- image_read(logo_path)

# resizing
logo.min <- image_scale(logo, 640)

# output the mini size file
image_write(image = logo.min, path = logo_path)
