#' Selection Function for r3dmol
#'
#' Provides documentation for some basic useful selection criteria.
#' For more advanced selection options, see the
#' \href{https://3dmol.csb.pitt.edu/doc/types.html#AtomSelectionSpec}{Official
#' Documenation}
#'
#' @param model a single model or list of models from which atoms should be
#' selected. Can also specify by numerical creation order.
#' Reverse indexing is allowed (-1 specifies last added model).
#' @param resi Residue number/s. (vector)
#' @param resn Parent residue name as 3-letter code (e.g. "ALA", "GLY",
#' "CYS"...)
#' @param bonds overloaded to select number of bonds, e.g. \code{bonds = 0}
#' will select all non-bonded atoms
#' @param invert Logical, if \code{invert = TRUE}, Inverts the selection
#' criteria.
#' @param byres Logical, if \code{byres = TRUE}, expands the selection to
#' entire residues that include any selected atoms.
#' @param expand Expand selection to include atoms within a specified distance
#' from current selection.
#' all atoms of any residue that has any atom already selected.
#' @param elem element abbreviation (e.g 'H', 'Ca', etc)
#' @param chain String, chain this atom belongs to (e.g. 'A' for chain A)
#' @param atom Atom name, may be more specific than 'elem' (e.g. 'CA' for alpha
#' carbon)
#' @param ss Secondary structure identifier. 'h' for helix, 's' for beta-sheet.
#' @param b Atom b factor data
#' @param clickable Set this flag to true to enable click selection handling
#' for this atom
#' @param callback Callback click handler function to be executed on this atom
#' and its parent viewer.
#'
#' @return sel \code{list()} for selecting atoms.
#' @examples
#' library(r3dmol)
#' \dontrun{
#' r3dmol() %>%
#'   m_add_model(data = m_fetch_pdb("1bna")) %>%
#'   m_add_style(
#'     style = m_style_stick(),
#'     sel = m_sel(resi = 1:2)
#'   ) %>%
#'   m_zoom_to(sel = m_sel(resi = 1))
#'
#' # Expand example
#' r3dmol() %>%
#'   m_add_model(data = m_fetch_pdb("1bna")) %>%
#'   m_add_style(
#'     style = m_style_stick(),
#'     sel = m_sel(
#'       resi = 1,
#'       expand = 10,
#'       byres = TRUE
#'     )
#'   ) %>%
#'   m_zoom_to(sel = m_sel(resi = 1))
#' }
#' @export
#'
m_sel <- function(
                  model = NULL,
                  resi = NULL,
                  resn = NULL,
                  invert = NULL,
                  chain = NULL,
                  elem = NULL,
                  atom = NULL,
                  byres = NULL,
                  b = NULL,
                  expand = NULL,
                  bonds = NULL,
                  ss = NULL,
                  clickable = NULL,
                  callback = NULL) {

  ## Create the list of values from inputs
  m_sel <- list(
    resi = resi,
    resn = resn,
    chain = chain,
    model = model,
    byres = byres,
    expand = expand,
    bonds = bonds,
    elem = elem,
    atom = atom,
    ss = ss,
    b = b,
    invert = invert,
    clickable = clickable,
    callback = callback
  ) %>% .cleanup_nulls()

  class(m_sel) <- "AtomSelectionSpec"

  m_sel
}

#' Selection Across Multiple Residues
#'
#' Behaves just like the \code{m_sel()}, but returns a new selection for each
#' residue specified with \code{resi}.
#'
#' The \code{m_sel(resi = 1:10)} returns a selection of all 10 residues.
#' The \code{m_multi_resi_sel(resi = 1:10)} returns 10 individual selections,
#' each containing only 1 of the residues.
#'
#' @param model a single model or list of models from which atoms should be
#' selected. Can also specify by numerical creation order.
#' Reverse indexing is allowed (-1 specifies last added model).
#' @param resi Residue number/s. (vector)
#' @param resn Parent residue name as 3-letter code (e.g. "ALA", "GLY",
#' "CYS"...)
#' @param bonds overloaded to select number of bonds, e.g. \code{bonds = 0}
#' will select all non-bonded atoms
#' @param invert Logical, if \code{invert = TRUE}, Inverts the selection
#' criteria.
#' @param byres Logical, if \code{byres = TRUE}, expands the selection to
#' entire residues that include any selected atoms.
#' @param expand Expand selection to include atoms within a specified distance
#' from current selection.
#' all atoms of any residue that has any atom already selected.
#' @param elem element abbreviation (e.g 'H', 'Ca', etc)
#' @param chain String, chain this atom belongs to (e.g. 'A' for chain A)
#' @param atom Atom name, may be more specific than 'elem' (e.g. 'CA' for alpha
#' carbon)
#' @param ss Secondary structure identifier. 'h' for helix, 's' for beta-sheet.
#' @param b Atom b factor data
#' @param clickable Set this flag to true to enable click selection handling
#' for this atom
#' @param callback Callback click handler function to be executed on this atom
#' and its parent viewer.
#'
#' @return sel \code{list()} for selecting atoms.
#' @export
#'
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_model(data = pdb_6zsl) %>%
#'   m_set_style(style = m_style_cartoon()) %>%
#'   m_zoom_to() %>%
#'   m_add_style(
#'     sel = m_sel(resi = 1:10),
#'     style = c(
#'       m_style_stick(),
#'       m_style_sphere(scale = 0.3)
#'     )
#'   ) %>%
#'   m_add_line(
#'     start = m_multi_resi_sel(resi = rep(1, 9), chain = "A"),
#'     end = m_multi_resi_sel(
#'       resi = 2:10,
#'       chain = "B"
#'     )
#'   )
m_multi_resi_sel <- function(
                             resi = NULL,
                             resn = NULL,
                             chain = NULL,
                             model = NULL,
                             elem = NULL,
                             atom = NULL,
                             invert = NULL,
                             byres = NULL,
                             b = NULL,
                             expand = NULL,
                             bonds = NULL,
                             ss = NULL,
                             clickable = NULL,
                             callback = NULL) {
  sel_list <- list()

  for (i in seq_along(resi)) {
    sel_list[[i]] <- m_sel(
      resi = resi[i],
      resn = resn,
      chain = chain,
      model = model,
      byres = byres,
      expand = expand,
      bonds = bonds,
      elem = elem,
      atom = atom,
      ss = ss,
      b = b,
      invert = invert,
      clickable = clickable,
      callback = callback
    )
  }
  sel_list
}
