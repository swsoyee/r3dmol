#' Quickly View Given Structure
#'
#' Creates a scene with a number of simple defaults in order to quickly view
#' the structure without having to write multiple lines of code.
#'
#' @param model Model to add to scene. Can be \code{{bio3d}} pdb object or PDB
#' id code string (i.e "4ozs").
#' @param highlight Given selection will additionally have 'ball-n-stick'
#' representation. View will also zoom to selection.
#' @param zoom Logical. FALSE will not zoom onto highlighted selection.
#' @param spin TRUE / FALSE will enable or disable spin. A numeric value will
#' change spin speed and negative will reverse the direction.
#' @param nomouse Logical. Enables / disables mouse input.
#' @param ribbon Logical. Enables / disables ribbon representation.
#' @param outline Logical. Enables / disables black outline.
#' @param backgroundColor String of simple colour names or hex code to change
#' background color of viewer.
#'
#' @examples
#' library(r3dmol)
#'
#' # write/read demo structure as {bio3d} object
#' tmp <- tempfile()
#' write(pdb_6zsl, tmp)
#' pdb <- bio3d::read.pdb(tmp)
#'
#' # quickly preview structure
#' pdb %>%
#'   m_glimpse()
#'
#' # preview structure, highlighting particular region.
#' pdb %>%
#'   m_glimpse(m_sel(resi = 1:10, chain = "A"), spin = 0.2)
#' \dontrun{
#'
#' # Fetch given PDB string and quickly preview structure
#' "4ozs" %>%
#'   m_glimpse(spin = TRUE)
#' }
#' @export
m_glimpse <- function(model,
                      highlight = m_sel(),
                      zoom = TRUE,
                      spin = FALSE,
                      nomouse = FALSE,
                      ribbon = FALSE,
                      outline = TRUE,
                      backgroundColor = "white") {
  if (is.character(model)) {
    model <- m_fetch_pdb(model)
  } else if (methods::is(model) == "pdb") {
    model <- m_bio3d(model)
  }

  zoom_highlight <- highlight

  if (length(names(highlight)) == 0) {
    highlight <- m_sel(invert = TRUE)
  }

  id <- r3dmol(
    viewer_spec = m_viewer_spec(
      cartoonQuality = 10,
      nomouse = nomouse,
      backgroundColor = backgroundColor
    )
  ) %>%
    m_add_models(model) %>%
    m_set_style(m_style_cartoon(
      color = "spectrum",
      ribbon = ribbon
    )) %>%
    m_add_style(
      style = c(
        m_style_stick(),
        m_style_sphere(scale = 0.3)
      ),
      sel = highlight
    ) %>%
    m_zoom_to() %>%
    m_spin(speed = as.numeric(spin))

  if (outline == TRUE) {
    id <- id %>%
      m_add_outline()
  }

  if (zoom == TRUE) {
    id <- id %>%
      m_zoom_to(zoom_highlight)
  }

  id
}
