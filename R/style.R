#' Specify Styling for Sphere
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


m_sphere_style <- function(
  hidden = NULL,
  radius = NULL,
  scale = NULL,
  colorscheme = NULL,
  color = NULL,
  opacity = NULL
  ) {


  sphere_style <- list(
    hidden = hidden,
    radius = radius,
    scale = scale,
    colorscheme = colorscheme,
    color = color,
    opacity = opacity
  )

  for (i in names(sphere_style)) {
    if(is.null(sphere_style[[i]])) {
      sphere_style[[i]] <- NULL
    }
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
  color = NULL,
  style = NULL,
  ribbon = NULL,
  arrows = NULL,
  tubes = NULL,
  thickness = NULL,
  width = NULL,
  opacity = NULL
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

  for (i in names(cartoon_style)){
    if(is.null(cartoon_style[[i]])) {
      cartoon_style[[i]] <- NULL
    }
  }

  cartoon_style
}


#' Specify styling for Stick
#'
#' Returns a list for the \code{style = list(cartoon = list())} function,
#' for setting the stick specifications.
#'
#'@param hidden do no show
#'@param radius radius of sticks
#'@param singleBonds Draw all bonds as single bonds if \code{TRUE}
#'@param colorscheme element based coloring
#'@param color fixed coloring, overrides colorscheme
#'@param opacity opacity, must be the same for all atoms in the model
#'@export

m_stick_style <- function(
  hidden = NULL,
  radius = NULL,
  singleBonds = NULL,
  colorscheme = NULL,
  color = NULL,
  opacity = NULL
) {

  stick_style <- list(
    hidden = hidden,
    radius = radius,
    singleBonds = singleBonds,
    colorscheme = colorscheme,
    color = color,
    opacity = opacity
  )

  for (i in names(stick_style)) {
    if(is.null(stick_style[[i]])) {
      stick_style[[i]] <- NULL
    }
  }

  stick_style
}




#' Specify styling for Labels
#'
#' Returns a list for the \code{m_add_res_labels(style = list())} function,
#' for setting the label specifications.
#'
#'@param font font name, default sans-serif
#'@param fontSize height of text, default 18
#'@param fontColor font color, default white
#'@param fontOpacity font opacity, default 1
#'@param borderThickness line width of border around label, default 0
#'@param borderColor color of border, default backgroundColor
#'@param borderOpacity opacity of border, default 1
#'@param backgroundColor color of background, default black
#'@param backgroundOpacity opacity of background, default 1
#'@param position x,y,z coordinates for label (for custom positioning)
#'@param inFront Logical, if \code{TRUE} always put in front of model
#'@param showBackground Logical, show background rounded rectangle, default \code{TRUE}
#'@param fixed Logical, setes the label to change with the model when zooming
#'@param alignment String, how to orient the label with respect to position: 'topLeft' (default), 'topCenter', 'topRight', 'centerLeft', 'center', 'centerRight', 'bottomLeft', 'bottomCenter', 'bottomRight'
#'@export

m_label_style <- function(
  font = NULL,
  fontSize = NULL,
  fontColor = NULL,
  fontOpacity = NULL,
  borderThickness = NULL,
  borderColor = NULL,
  borderOpacity = NULL,
  backgroundColor = NULL,
  backgroundOpacity = NULL,
  position = NULL,
  inFront = NULL,
  showBackground = NULL,
  fixed = NULL,
  alignment = c('topLeft', 'topCenter', 'topRight', 'centerLeft', 'center', 'centerRight', 'bottomLeft', 'bottomCenter', 'bottomRight'),
  frame = NULL
) {
  alignment <- match.arg(alignment)

  if(length(alignment) > 1) {
    alignment <- alignment[1]
  }

  m_label_style <- list(
   font = font,
   fontSize = fontSize,
   fontColor = fontColor,
   fontOpacity = fontOpacity,
   borderThickness = borderThickness,
   borderColor = borderColor,
   borderOpacity = borderOpacity,
   backgroundOpacity = backgroundOpacity,
   position = position,
   inFront = inFront,
   showBackground = showBackground,
   fixed = fixed,
   alignment = alignment,
   frame = frame
  )

  for (i in names(m_label_style)) {
    if (is.null(m_label_style[[i]])) {
      m_label_style[[i]] <- NULL
    }
  }

  m_label_style
}



#' Specify styling for Lines
#'
#' Returns a list for the \code{style = list(line = list())} function
#' for setting the line specifications.
#'
#'@param colorscheme element based coloring
#'@param color fixed coloring, overrides colorscheme
#'@param opacity opacity, must be the same for all atoms in the model
#'@param hidden Logical, do not show line
#'
#'@export

m_line_style <- function(
  colorscheme = NULL,
  color = NULL,
  opacity = NULL,
  hidden = NULL
) {

  m_line_style <- list(
    colorscheme = colorscheme,
    color = color,
    opacity = opacity,
    hidden = hidden
  )

  for (i in names(m_line_style)) {
    if (is.null(m_line_style[[i]])) {
      m_line_style[[i]] <- NULL
    }
  }

  m_line_style
}
