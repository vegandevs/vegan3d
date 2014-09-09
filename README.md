## What is vegan3d?

**vegan3d** is a new package of 3D plotting routines split apart from
**vegan**.

This is a work in progress, and at the moment the package is still
rudimentary and not at all a valid **R** package.

The package contains the following functions:

 * `ordirgl` with its support functions `orglpoints`, `orglsegments`,
   `orglpoints`, `orglsegments`, `orglspider` and `orgltext`.  These
   require **rgl** package and provide dynamic ordination graphics.

 * **rgl** based support functions `rgl.isomap` to display `isomap`
     results, and `rgl.renyiaccum` to display `renyiaccum` results.

 * `ordiplot3d` for static 3D ordination diagrams. This requires
   **scatterplot3d** package.

Special plotting functions based on **lattice** and **tcltk** packages
are still in **vegan**.

The **rgl** functions are based on the release 0.65-0. They work with
more modern **rgl** but do not use its full capabilities.
