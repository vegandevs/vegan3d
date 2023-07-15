## What is vegan3d?

**vegan3d** is an R package of 3D plotting routines split apart from
**vegan**. It can be used for dynamic plots based on **rgl** package,
and for static 3D plots based on **scatterplot3d** package.

The package contains the following functions:

 * `ordirgl` with its support functions `orglpoints`, `orgltext`,
   `orglsegments`, `orglellipse`, `orglspider`, `orglcluster` and
   `orglspantree`.  These require **rgl** package and provide dynamic
   ordination graphics.  In general, the `orglXXXX` functions are
   similar as 2D `ordiXXXX` functions in **vegan**.

 * **rgl** based support functions `rgl.isomap` to display `isomap`
     results, and `rgl.renyiaccum` to display `renyiaccum` results.

 * `ordiplot3d` for static 3D ordination diagrams. This requires
   **scatterplot3d** package.

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
[![CRAN version](http://www.r-pkg.org/badges/version/vegan3d)](http://cran.rstudio.com/web/packages/vegan3d/index.html) [![](http://cranlogs.r-pkg.org/badges/grand-total/vegan3d)](http://cran.rstudio.com/web/packages/vegan3d/index.html)

#### Build status
[![R build
status](https://github.com/vegandevs/vegan3d/workflows/R-CMD-check/badge.svg)](https://github.com/vegandevs/vegan3d/actions)

