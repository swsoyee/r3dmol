# r3dmol 0.1.1.9000

### Features

* Add multiple lines and cylinders in one function call are supported ([#17](https://github.com/swsoyee/r3dmol/pull/17)). Refer to [this article](https://swsoyee.github.io/r3dmol/articles/multi-selections.html) for 
more information.
* Add `speed` option for `m_spin()` and option for `keepH` in `m_add_model()` ([#13](https://github.com/swsoyee/r3dmol/pull/13)).

### Documentation

* Add logo for `{r3dmol}` ([#16](https://github.com/swsoyee/r3dmol/pull/16)).

### Others

* Function `m_set_view_style()` is deprecated and replaced by `m_add_outline()`.
* Upgrade `3Dmol.js` to the latest version (v1.6.2) ([#12](https://github.com/swsoyee/r3dmol/pull/12)).

# r3dmol 0.1.1

* Introduce new friendly functions for addition of styles, and selection algebra. New functions for adding model from `{bio3d}` and fetching model from [RCSB PDB](https://www.rcsb.org/) ([#6](https://github.com/swsoyee/r3dmol/pull/6)).

# r3dmol 0.1.0

* Added a `NEWS.md` file to track changes to the package.
* Main functions of [`3Dmol.js`](http://3dmol.csb.pitt.edu/doc/$3Dmol.GLViewer.html) are now available in `Rmarkdown` and `shiny`.
