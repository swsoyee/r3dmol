% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/button.R
\name{m_button_animate}
\alias{m_button_animate}
\title{Add a button for starting and stopping animations}
\usage{
m_button_animate(
  id,
  interval = 50,
  loop = "backAndForth",
  step = 1,
  reps = 0,
  label = "Play Animation",
  stopButton = TRUE,
  stopLabel = "Stop Animation"
)
}
\arguments{
\item{id}{R3dmol \code{id} or a \code{r3dmol} object (the output from
\code{r3dmol()}).}

\item{interval}{Time in milliseconds between frames.}

\item{loop}{Direction of animation loop. \code{'backward'}, \code{'forward'}
or \code{'backAndForth'}}

\item{step}{How many frames to step through. 1 plays every frame, 2 skips
every second frame etc.}

\item{reps}{How many times to repeat the animation. 0 loops indefinitely.}

\item{label}{String for button label.}

\item{stopButton}{Logical, whether to also create a button to stop the
currently playing animation.}

\item{stopLabel}{String for stop for stop animation button label.}
}
\value{
R3dmol \code{id} or a \code{r3dmol} object (the output from
\code{r3dmol()})
}
\description{
Add a button for starting and stopping animations
}
\examples{

xyz <- "4
* (null), Energy   -1000.0000000
N     0.000005    0.019779   -0.000003   -0.157114    0.000052   -0.012746
H     0.931955   -0.364989    0.000003    1.507100   -0.601158   -0.004108
H    -0.465975   -0.364992    0.807088    0.283368    0.257996   -0.583024
H    -0.465979   -0.364991   -0.807088    0.392764    0.342436    0.764260
"

r3dmol(
  backgroundColor = "0xeeeeee"
) \%>\%
  m_add_model(
    data = xyz,
    format = "xyz",
    options = list(vibrate = list(frames = 10, amplitude = 1))
  ) \%>\%
  m_set_style(style = m_style_stick()) \%>\%
  m_animate(list(loop = "backAndForth")) \%>\%
  m_zoom_to() \%>\%
  m_button_animate(step = 1, reps = 0, interval = 50)
}
