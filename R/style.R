#' Specify styling for Sphere
#'
#' Returns a list for the \code{style = list(sphere = list())} function,
#' for setting the sphere specifications.
#'
#'@param hidden Boolean - do not show atom. Default \code{FALSE}
#'@param radius Override van der waals radius.
#'@param scale Scale radius by specified amount.
#'@param colorscheme Specify scheme to color the atoms by. Default is "default". Other choies are "Carbon", ssPyMOL", "ssJmol", "Jmol", "default", "amino",
#'"shapely", "nucleic", "chain", "chainHetatm", "prop".
#'@param color Discrete, fixed coloring, overrides any colorscheme.
#'@param opacity Opacity of spheres, 0 being invisible. Must be the same for
#'all atoms in the model.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from
#' \code{r3dmol()})
#' @export
#'


m_sphere_style <- function(hidden=F,
                           radius=1,
                           scale=1,
                           colorscheme="default",
                           color=NULL,
                           opacity=0) {

  if (!is.logical(hidden)){
    stop("Hidden must be TRUE or FALSE.")
  }

  if (!is.numeric(radius)) {
    stop("Radius must be numeric.")
  }
  if (!is.numeric(scale)) {
    stop("scale must be numeric.")
  }

  sphere_style <- list(
    hidden = hidden,
    radius = radius,
    scale = scale,
    colorscheme = colorscheme,
    color = color,
    opacity = opacity
  )

  if (is.null(color)){
    sphere_style$color <- NULL
  }

  sphere_style
}


#' Specify styling for Cartoon
#'
#' Returns a list for the \code{style = list(cartoon = list())} function,
#' for setting the cartoon specifications.
#'
#'@param color Strand color, may specify as 'spectrum' which will apply
#'reversed gradient based on residue number.
#'@param style style of cartoon rendering (trace, oval, rectangle (default),
#'parabola, edged)
#'@param ribbon whether to use constant strand width, disregarding secondary
#'structure; use thickness to adjust radius
#'@param arrows whether to add arrows showing beta-sheet directionality;
#'does not apply to trace or ribbon
#'@param tubes whether to display alpha helices as simple cylinders; does not
#'apply to trace
#'@param thickness cartoon strand thickness, default is 0.4
#'@param width cartoon strand width, default is secondary structure-dependent;
#'does not apply to trace or ribbon
#'@param opacity set opacity from 0-1; transparency is set per-chain with a
#'warning outputted in the event of ambiguity
#'
#'@export

m_cartoon_style <- function(
  color="spectrum",
  style = "default",
  ribbon = F,
  arrows = F,
  tubes = F,
  thickness = 0.4,
  width = 1,
  opacity = 1
) {
  cartoon_style <- list(
    color = color,
    style = style,
    ribbon = ribbon,
    arrows = arrows,
    tubes = tubes,
    thickness = thickness,
    width = width,
    opacity = opacity
  )

  cartoon_style
}


#' Specify styling for Stick
#'
#' Returns a list for the \code{style = list(cartoon = list())} function,
#' for setting the cartoon specifications.
#'
#'@param hidden do no show
#'@param radius radius of sticks
#'@param singleBonds Draw all bonds as single bonds if \code{TRUE}
#'@param colorscheme element based coloring
#'@param color fixed coloring, overrides colorscheme
#'@param opacity opacity, must be the same for all atoms in the model
#'@export

m_stick_style <- function(
  hidden = F,
  radius = 1,
  singleBonds = T,
  colorscheme = "default",
  color = "default",
  opacity = 1
) {

  stick_style <- list(
    hidden = hidden,
    radius = radius,
    singleBonds = singleBonds,
    colorscheme = colorscheme,
    color = color,
    opacity = opacity
  )

  stick_style
}




