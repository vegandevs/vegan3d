## What is vegan3d?

**vegan3d** is an R package of 3D plotting routines split apart from
**vegan**. It can be used for dynamic plots based on **rgl** package,
and for static 3D plots based on **scatterplot3d** package.

The package contains the following functions:

 * `ordirgl` with its support functions `orglpoints`, `orgltext`, `orglsegments`,
   `orglellipse`, `orglspider`, `orglcluster` and `orglspantree`.  These
   require **rgl** package and provide dynamic ordination graphics.

 * **rgl** based support functions `rgl.isomap` to display `isomap`
     results, and `rgl.renyiaccum` to display `renyiaccum` results.

 * `ordiplot3d` for static 3D ordination diagrams. This requires
   **scatterplot3d** package.

 * `orditree3d` and `ordirgltree` functions to display a coloured
    dendrogram tree over a 2D plane. The first is a
    static function based on **scatterplot3d** and the latter a
    dynamic spinnable plot based on **rgl**. The method was initially
    designed for showing dendrograms over ordination plane
    but it can use other planes, for instance a map of locations of points.
