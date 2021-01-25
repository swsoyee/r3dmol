#' Load structure from package bio3d
#'
#' Function to take bio3d structure and use in the r3dmol app.
#'
#' @param structure bio3d object containing coordinates for desired structure
#'
#' @export


m_bio3d <- function(structure) {
  capture.output(bio3d::write.pdb(pdb = structure, file = ""))
}

#' Fetch Structure from PDB
#'
#' Using specified pdb id, retrieved .pdb file using bio3d::get.pdb() function.
#' Will always query the only PDB for structure, and not store on local drive.
#' May take some time to fetch information, every time it is run.
#'
#' @param PDB PDB ID string for structure.
#' @param save.pdb Logical, whether or not to save the PDB to local drive. Will
#' speed up subsequent load times. Defaults to \code{FALSE}
#' @param path If \code{save.pdb = TRUE}, determines the location for file to
#' be saved. Defaults to \code{getwd()}.
#'
#' @examples
#' r3dmol() %>%
#'  m_add_model(data = m_fetch_pdb("1bna")) %>%
#'  m_set_style(style = list(cartoon = m_cartoon_style(),
#'                           stick = m_stick_style())) %>%
#'  m_zoom_to()
#'
#' @export
#'


m_fetch_pdb <- function(PDB, save.pdb = FALSE, path = NULL) {
  if(!is.character(PDB)) {
    stop("PDB Must be character string.")
  }

  if (is.null(path)) {
    path <- getwd()
  }

  if(save.pdb == T) {
    ## Download pdb file and read in file
    pdb <- bio3d::read.pdb(bio3d::get.pdb(PDB, path = path))

    ## Read PDB file, then write directly to console.
    capture.output(write.pdb(pdb, file = ""))

  } else if (save.pdb == F) {

  ## Pulls pdb data from online PDB database, without saving to local drive.
  readLines(bio3d::get.pdb(PDB, URLonly = TRUE))

  }
}

