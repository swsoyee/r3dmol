#' Load structure from package bio3d
#'
#' Function to take bio3d structure and use in the r3dmol app.
#'
#' @param pdb bio3d object containing coordinates for desired structure
#' @examples
#' library(bio3d)
#' library(r3dmol)
#'
#' # create bio3d object
#' pdb <- read.pdb("1bna")
#'
#' # inspect bio3d object
#' pdb
#'
#' # load bio3d object into r3dmol
#' r3dmol() %>%
#'   m_add_model(data = m_bio3d(pdb)) %>%
#'   m_zoom_to()
#' @export
m_bio3d <- function(pdb) {
  # register temporary file for writing to disk
  temp <- tempfile()
  # will delete temp file after funciton completes
  on.exit(unlink(temp))
  # write specified pdb to disk as the temp file
  bio3d::write.pdb(pdb = pdb, file = temp)
  # read written .pdb for passing to m_add_model*() functions.
  readLines(temp)
}

#' Fetch Structure from PDB
#'
#' Using specified pdb id, retrieved .pdb file using bio3d::get.pdb() function.
#' Will always query the only PDB for structure, and not store on local drive.
#' May take some time to fetch information, every time it is run.
#'
#' @param pdb PDB ID string for structure.
#' @param save.pdb Logical, whether or not to save the PDB to local drive. Will
#' speed up subsequent load times. Defaults to \code{FALSE}
#' @param path If \code{save.pdb = TRUE}, determines the location for file to
#' be saved. Defaults to \code{getwd()}.
#'
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_model(data = m_fetch_pdb("1bna")) %>%
#'   m_set_style(style = c(m_style_cartoon(), m_style_stick())) %>%
#'   m_zoom_to()
#' @export
m_fetch_pdb <- function(pdb, save.pdb = FALSE, path = NULL) {
  if (!is.character(pdb)) {
    stop("pdb must be character string. e.g.'1bna'")
  }

  if (is.null(path)) {
    path <- getwd()
  }

  if (save.pdb == T) {
    ## Download pdb file and read in file
    pdb <- bio3d::read.pdb(bio3d::get.pdb(pdb, path = path))

    ## Read PDB file, then write directly to console.
    m_bio3d(pdb)
    
  } else if (save.pdb == F) {

    ## Pulls pdb data from online PDB database, without saving to local drive.
    readLines(bio3d::get.pdb(pdb, URLonly = TRUE))
  }
}
