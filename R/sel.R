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
#' @export
#'
m_sel <- function(
                  model = NULL,
                  resi = NULL,
                  resn = NULL,
                  invert = FALSE,
                  byres = FALSE,
                  expand = FALSE,
                  elem = NULL,
                  chain = NULL,
                  atom = NULL,
                  bonds = NULL,
                  ss = NULL,
                  b = NULL,
                  clickable = FALSE,
                  callback = NULL) {

  ## Create the list of values from inputs
  m_sel <- list(
    model = model,
    bonds = bonds,
    invert = invert,
    byres = byres,
    expand = expand,
    resn = resn,
    elem = elem,
    chain = chain,
    resi = resi,
    atom = atom,
    bonds = bonds,
    ss = ss,
    b = b,
    clickable = clickable,
    callback = callback,
    invert = invert
  )
  m_sel <- cleanup_nulls(m_sel)
  m_sel
}
