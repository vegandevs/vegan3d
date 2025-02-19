## What is vegan3d?

**vegan3d** is an R package of 3D plotting routines split apart from
**vegan**. It can be used for dynamic plots based on **rgl** package,
and for static 3D plots based on **scatterplot3d** package.

The package contains the following functions:
 * `orditkplot`: a Tcl/Tk-based 2D editable plot. Function opens
   a graphic window where labels can be moved with mouse, but
   points are fixed. It is also possible to edit labels and zoom into
   graph, and the final plot can be saved in various graphic formats
   or saved as an **R** object that can be further manipulated or
   plotted with standard **R** graphics commands.
   
 * `ordirgl` with its support functions `orglpoints`, `orgltext`,
   `orglsegments`, `orglellipse`, `orglspider`, `orglcluster` and
   `orglspantree`.  These require **rgl** package and provide dynamic
   ordination graphics.  In general, the `orglXXXX` functions are
   similar as 2D `ordiXXXX` functions in **vegan**.

 * **rgl** based support functions `rgl.isomap` to display `isomap`
     results, and `rgl.renyiaccum` to display `renyiaccum` results.

 * `ordiplot3d` for static 3D ordination diagrams. This requires
   **scatterplot3d** package.

 * `ordilattice3d` for static 3D ordination diagrams. This requires
   **lattice** package.

 * `orditree3d` and `ordirgltree` functions to display a coloured
    dendrogram tree over a 2D plane. The first is a
    static function based on **scatterplot3d** and the latter a
    dynamic spinnable plot based on **rgl**. The method was initially
    designed for showing dendrograms over ordination plane.

Special plotting functions based on **lattice** and **tcltk** packages
are still in **vegan**. **ggplot2**-based functions are in
[**ggvegan**](https://github.com/gavinsimpson/ggvegan) and
[**ggvegan2**](https://github.com/jarioksa/ggvegan2) packages.

#### Released version
[![CRAN version](https://www.r-pkg.org/badges/version/vegan3d)](https://cran.rstudio.com/web/packages/vegan3d/index.html) [![](https://cranlogs.r-pkg.org/badges/grand-total/vegan3d)](https://cran.rstudio.com/web/packages/vegan3d/index.html)

#### Build status
[![R build
status](https://github.com/vegandevs/vegan3d/workflows/R-CMD-check/badge.svg)](https://github.com/vegandevs/vegan3d/actions)

#### Install Current github Version from R-Universe

```
# Install 'vegan3d' in R:
install.packages('vegan3d',
    repos = c('https://vegandevs.r-universe.dev', 'https://cloud.r-project.org'))
```


