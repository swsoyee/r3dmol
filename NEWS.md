# r3dmol 0.1.3

### Bugs Fixed

* Fix the incorrect layout of `m_button()` in the rmarkdown ([#31](https://github.com/swsoyee/r3dmol/pull/31)).
* Fix `colorScheme="default"` overriding user-specified colors ([#34](https://github.com/swsoyee/r3dmol/pull/34))
* Fix the bug that surface cannot be rendered correctly when using `m_png()`
with `m_add_surface()` at the same time, and optimize the default image size 
setting of `m_png()` ([#35](https://github.com/swsoyee/r3dmol/issues/35)).

# r3dmol 0.1.2

### Features

* Add `m_button()` function to support adding custom features in the viewer, 
such as switching the style of the model, etc ([#29](https://github.com/swsoyee/r3dmol/pull/29)).
* Add `m_png()` to support convert widget to png ([#27](https://github.com/swsoyee/r3dmol/pull/27)).
* Add `m_grid()` to support multiple viewers ([#25](https://github.com/swsoyee/r3dmol/pull/25)).
* Quickly look at structures with `m_glimpse()`. Initializes the viewer with 
a range of useful defaults. Allows for quickly visually inspecting the structure
and further customization of the viewer to speed up setup.
* Add multiple lines and cylinders in one function call are supported ([#17](https://github.com/swsoyee/r3dmol/pull/17)). Refer to [this article](https://swsoyee.github.io/r3dmol/articles/multi-selections.html) for 
more information.
* Add `speed` option for `m_spin()` and option for `keepH` in `m_add_model()` ([#13](https://github.com/swsoyee/r3dmol/pull/13)).

### Others

* Add logo for `{r3dmol}` ([#16](https://github.com/swsoyee/r3dmol/pull/16)).
* Function `m_set_view_style()` is deprecated and replaced by `m_add_outline()`.
* Upgrade `3Dmol.js` to the latest version (v1.6.2) ([#12](https://github.com/swsoyee/r3dmol/pull/12)).

# r3dmol 0.1.1

* Introduce new friendly functions for addition of styles, and selection algebra. New functions for adding model from `{bio3d}` and fetching model from [RCSB PDB](https://www.rcsb.org/) ([#6](https://github.com/swsoyee/r3dmol/pull/6)).

# r3dmol 0.1.0

* Added a `NEWS.md` file to track changes to the package.
* Main functions of [`3Dmol.js`](http://3dmol.csb.pitt.edu/doc/$3Dmol.GLViewer.html) are now available in `Rmarkdown` and `shiny`.
