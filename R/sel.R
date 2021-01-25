#' Selection Function for r3dmol
#'
#' Provides documentation for some basic useful selection criteria.
#' For more advanced selection options, see the
#' \href{https://3dmol.csb.pitt.edu/doc/types.html#AtomSelectionSpec}{Official Documenation}
#'
#'@param model a single model or list of models from which atoms should be
#'selected. Can also specify by numerical creation order.
#'Reverse indexing is allowed (-1 specifies last added model).
#'@param resi Residue number/s. (vector)
#'@param bonds overloaded to select number of bonds, e.g. \code{bonds = 0}
#'will select all non-bonded atoms
#'@param invert Logical, if \code{invert = TRUE}, Inverts the selection criteria.
#'@param byres Logical, if \code{byres = TRUE}, expands the selection to include
#'all atoms of any residue that has any atom already selected.
#'@param resn Parent residue name. (3-Letter AA codes)
#'@param elem element abbreviation (e.g 'H', 'Ca', etc)
#'@param chain String, chain this atom belongs to (e.g. 'A' for chain A)
#'@param atom Atom name, may be more specific than 'elem' (e.g. 'CA' for alpha carbon)
#'@param ss Secondary structure identifier (for cartoon render; e.g. 'h' for helix)
#'@param b Atom b factor data
#'@param clickable Set this flag to true to enable click selection handling for this atom
#'@param callback Callback click handler function to be executed on this atom and its parent viewer.
#'
#' @return sel \code{list()} for selecting atoms.
#' @export
#'


m_sel <- function(
  model=NULL,
  resi=NULL,
  resn=NULL,
  invert=NULL,
  byres=NULL,
  expand=NULL,
  elem=NULL,
  chain=NULL,
  atom=NULL,
  bonds=NULL,
  ss=NULL,
  b=NULL,
  clickable=NULL,
  callback=NULL
){

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

  ## Check for inputs, make NULL if lacking
  for(i in names(m_sel)) {
    if(is.null(m_sel[[i]])) {
      m_sel[[i]] <- NULL
    }
  }

  ## Return the list for selection
  m_sel
}
