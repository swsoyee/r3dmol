#' Set viewer properties
#'
#' Functions of setting viewer properties, such as width, height, background color, etc.
#' The viewer size can be adjusted automatically under normal circumstances.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param width,height Weight and height \code{numeric} in pixels
#' @param hex Hex code specified background color, or standard color spec \code{character}
#' @param alpha Alpha level \code{numeric} (default \code{1.0})
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @name m_set_viewer
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'  m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'  m_zoom_to() %>%
#'  m_set_width(300) %>%
#'  m_set_background_color("#666666", alpha = 0.9)
NULL

#' Sets the view to the specified translation, zoom, rotation and style
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param arg Vector formatted view setting,
#' \code{c(pos.x, pos.y, pos.z, rotationGroup.position.z, q.x, q.y, q.z, q.w)}. Requires
#' any one of \code{q.x}, \code{q.y}, \code{q.z}, \code{q.w} to be set to \code{1} to
#' enable mouse control, otherwise only static image is rendered.
#' @param style css style object in list.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @name m_set_view
#'
#' @examples
#' library(r3dmol)
#'
#' r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_set_style(style = list(cartoon = list())) %>%
#'   m_set_view(arg = c(20,-20, 10,-200, 0, 1, 0, 0)) %>%
#'   m_set_view_style(style = list(style = "outline", color = "blue"))
NULL

#' Create and add model to viewer
#'
#' Create and add model to viewer, given molecular data and its format. If multi-model
#' file is provided, use \code{\link{m_add_models}} adding atom data to the viewer as 
#' separate models.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param data Path of input data path or a vector of data.
#' @param format Input format (\code{'pdb'}, \code{'sdf'}, \code{'xyz'}, \code{'pqr'},
#'  or \code{'mol2'}).
#' @param options Format dependent options. Attributes depend on the input file format.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#'
#' @name add_model
#' @examples
#' library(r3dmol)
#' 
#' # Single-model file with m_add_model() function
#' r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb")
#'
#' # Multi-model file with m_add_models() function
#' r3dmol() %>%
#'   m_add_models(data = sdf_multiple, "sdf") %>%
#'   m_zoom_to()
#'
#' # Multi-model file with m_add_model() function
#' r3dmol() %>%
#'   m_add_model(data = sdf_multiple, "sdf") %>%
#'   m_zoom_to()
NULL

#' Unit cell visualization
#' 
#' Use \code{\link{m_add_unit_cell}} to create and add unit cell visualization, 
#' and \code{\link{m_remove_unit_cell}} to remove it from model. Use 
#' \code{\link{m_replicate_unit_cell}} to replicate atoms in model to form a super cell
#' of the specified dimensions. Original cell will be centered as much as possible.
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param a number of times to replicate cell in X dimension.
#' @param b number of times to replicate cell in Y dimension. If absent, X value is used.
#' @param c number of times to replicate cell in Z dimension. If absent, Y value is used.
#' @param model Model with unit cell information (e.g., pdb derived).
#' If omitted uses most recently added model.
#' @param spec Visualization style.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @name m_unit_cell
#'
#' @examples
#' library(r3dmol)
#'
#' # Create model
#' mol <- r3dmol() %>%
#'   m_add_model(
#'     data = cif_254385,
#'     "cif",
#'     options = list(doAssembly = TRUE, normalizeAssembly = TRUE)
#'   ) %>%
#'   m_set_style(style = list(
#'     sphere = list(colorscheme = "Jmol", scale = 0.25),
#'     stick = list(colorscheme = "Jmol")
#'   )) %>%
#'   m_add_unit_cell(spec = list(
#'     alabel = "x",
#'     blabel = "y",
#'     clabel = "z",
#'     box = list(hidden = TRUE)
#'   )) %>%
#'   m_zoom_to()
#' 
#' # Render model
#' mol
#' 
#' # Remove unit cell
#' mol %>%
#'   m_remove_unit_cell()
#' 
#' # Replicate atoms in model to form a super cell
#' r3dmol() %>%
#'   m_add_model(data = cif_254385, format = "cif") %>%
#'   m_set_style(style = list(sphere = list(scale = 0.25))) %>%
#'   m_add_unit_cell() %>%
#'   m_zoom_to() %>%
#'   m_replicate_unit_cell(a = 3, b = 2, c = 1)
NULL

#' Set or set style properties to all selected atoms
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param sel Atom selection specification
#' @param style Style spec to apply to specified atoms
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @name m_style
#'
#' @examples
#' library(r3dmol)
#' 
#' # Add style to model
#' r3dmol() %>%
#'   m_add_model(data = pdb_1j72, format = "pdb") %>%
#'   m_add_style(style = list(cartoon = list())) %>%
#'   m_zoom_to()
#' 
#' # Set style to model
#' r3dmol() %>%
#'   m_add_model(data = pdb_6zsl, format = "pdb") %>%
#'   m_set_style(style = list(cartoon = list())) %>%
#'   m_set_style(sel = list(chain = "A"),
#'            style = list(stick = list(
#'              radius = 0.5,
#'              colorscheme = "magentaCarbon"
#'            ))) %>%
#'   m_zoom_to()
NULL

#' Create and add shape
#'
#' @param id R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @param spec Shape style specification.
#'
#' @return R3dmol \code{id} or a \code{r3dmol} object (the output from \code{r3dmol()})
#' @name m_add_anyShape
#'
#' @examples
#' library(r3dmol)
#'
#' # Add arrow
#' r3dmol() %>%
#'   m_add_arrow(
#'     spec = list(
#'       start = m_vector3(-10, 0, 0),
#'       end = m_vector3(0,-10, 0),
#'       radius = 1,
#'       radiusRadio = 1,
#'       mid = 1,
#'       clickable = TRUE,
#'       callback =
#'         "function(){
#'           this.color.setHex(0xFF0000FF);
#'           view.render()
#'         }"
#'     )
#'   )
#' 
#' # Add curve
#' r3dmol() %>%
#'   m_add_curve(
#'     spec = list(
#'       points = list(
#'         m_vector3(0, 0, 0),
#'         m_vector3(5, 3, 0),
#'         m_vector3(5, 7, 0),
#'         m_vector3(0, 10, 0)
#'       ),
#'       radius = 0.5,
#'       smooth = 10,
#'       fromArrow = FALSE,
#'       toArrow = TRUE,
#'       color = 'orange'
#'     )
#'   )
#' 
#' # Add cylinder
#' r3dmol() %>%
#'   m_add_cylinder(
#'     spec = list(
#'       start = list(x = 0.0, y = 0.0, z = 0.0),
#'       end = list(x = 10.0, y = 0.0, z = 0.0),
#'       radius = 1.0,
#'       fromCap = 1,
#'       toCap = 2,
#'       color = "red",
#'       hoverable = TRUE,
#'       clickable = TRUE,
#'       callback = "
#'       function(){
#'         this.color.setHex(0x00FFFF00);
#'         view.render();
#'       }",
#'       hover_callback = "
#'       function(){
#'         view.render();
#'       }",
#'       unhover_callback = "
#'       function(){
#'         this.color.setHex(0xFF000000);
#'         view.render();
#'       }"
#'     )
#'   )
#' 
#' # Add line
#' r3dmol() %>%
#'   m_add_line(spec = list(
#'     dashed = TRUE,
#'     start = m_vector3(0, 0, 0),
#'     end = m_vector3(30, 30, 30)
#'   ))
#' 
#' # Add box
#' r3dmol() %>%
#'   m_add_box(spec = list(
#'     center = m_vector3(0, 5, 0),
#'     demensions = list(w = 3, h = 4, d = 2),
#'     color = "magenta"
#'   ))
#' 
#' # Add sphere
#' r3dmol() %>%
#'   m_add_sphere(spec = list(
#'     center = m_vector3(0, 0, 0),
#'     radius = 10,
#'     color = "red"
#'   ))
NULL
