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

 * `ordirgl` with its support functions `orglpoints`, `orgltext`, `orglsegments`,
   `orglellipse`, `orglspider`, `orglcluster` and `orglspantree`.  These
   require **rgl** package and provide dynamic ordination graphics.

 * **rgl** based support functions `rgl.isomap` to display `isomap`
     results, and `rgl.renyiaccum` to display `renyiaccum` results.

 * `ordiplot3d` (based on **scatterplot3d**) and `ordilattice3d` (based on
    **lattice**) for static 3D ordination diagrams.

 * `orditree3d` and `ordirgltree` functions to display a coloured
    dendrogram tree over a 2D plane. The first is a
    static function based on **scatterplot3d** and the latter a
    dynamic spinnable plot based on **rgl**. The method was initially
    designed for showing dendrograms over ordination plane
    but it can use other planes, for instance a map of locations of points.
