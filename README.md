
<!-- README.md is generated from README.Rmd. Please edit that file -->

# r3dmol

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/r3dmol)](https://CRAN.R-project.org/package=r3dmol)
[![Codecov test
coverage](https://codecov.io/gh/swsoyee/r3dmol/branch/master/graph/badge.svg)](https://codecov.io/gh/swsoyee/r3dmol?branch=master)
[![R build
status](https://github.com/swsoyee/r3dmol/workflows/R-CMD-check/badge.svg)](https://github.com/swsoyee/r3dmol/actions)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

This is an R package that provides support for
[`3Dmol.js`](https://3dmol.csb.pitt.edu/index.html) as a
[`htmlwidgets`](https://www.htmlwidgets.org/).

## Installation

> **Important**: This package is still very early in its development
> stages. Please give the repository a star on Github if you find the
> package is useful. In addition, we need your feedback to improve the
> package, feel free to create an issue if you have any question or
> feature requirement. You are more than welcome to submit a PR to make
> any feasible improvements.

You could install the released version of r3dmol from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("r3dmol")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("swsoyee/r3dmol")
```

## Example

``` r
library(r3dmol)
r3dmol() %>%
  m_add_model(data = pdb_6zsl, format = "pdb") %>%
  m_zoom_to() %>%
  m_set_style(style = m_style_cartoon(color = 'spectrum'))
```

![picture](https://user-images.githubusercontent.com/20528423/92235475-aff64180-eeee-11ea-94b8-304ea64425b5.png)

## About `3Dmol.js`

> Nicholas Rego, David Koes, [3Dmol.js: molecular visualization with
> WebGL](https://academic.oup.com/bioinformatics/article/31/8/1322/213186),
> Bioinformatics, Volume 31, Issue 8, 15 April 2015, Pages 1322–1324,
