% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/button.R
\name{m_button_zoom_to}
\alias{m_button_zoom_to}
\title{Add a button for zooming to a selection}
\usage{
m_button_zoom_to(
  id,
  sel = m_sel(),
  label = "Zoom",
  duration = 500,
  zoomOut = TRUE,
  zoomOutLabel = "Zoom Out"
)
}
\arguments{
\item{id}{R3dmol \code{id} or a \code{r3dmol} object (the output from
\code{r3dmol()}).}

\item{sel}{Atom selection specification with \code{m_sel()}}

\item{label}{String for button label.}

\item{duration}{Duration of the zoom animation in milliseconds. (Default 500)}

\item{zoomOut}{Logical, whether to also create a button that will reset the
view to encompass the entire scene.}

\item{zoomOutLabel}{String for zoom out button label.}
}
\value{
R3dmol \code{id} or a \code{r3dmol} object (the output from
\code{r3dmol()})
}
\description{
Add a button for zooming to a selection
}
\examples{
# Add buttons to zoom in and out of a specific selection
r3dmol() \%>\%
  m_add_model(data = pdb_1j72, format = "pdb") \%>\%
  m_zoom_to() \%>\%
  m_set_style(m_style_cartoon()) \%>\%
  m_add_style(m_style_stick(), m_sel(resi = 100:110)) \%>\%
  m_button_zoom_to(sel = m_sel(resi = 100:110))
}
