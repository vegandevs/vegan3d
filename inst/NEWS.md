Version 1.1-2
=============

* This is a maintenance release to accommodate more stringent tests in
  CRAN. There should be no user-visible changes.

Version 1.1-1
=============

* `ordiplot3d` failed if input was a scores matrix instead of being a
  list-style object.

* `rgl.isomap` could fail mysteriously with some extra arguments
  (_e.g._ with `type = "p"`).

Version 1.1-0
=============

* `ordiplot3d` can now set the exact aspect ratio in ordination
  plots. Earlier we had a kluge that gave approximately correct
  ratio. The package now depends on **scatterplot3d** version 0.3-40.

Version 1.0-1
=============

### Installation

* Documentation uses some macros that require **R** version 3.2.0 or
  higher.

### Bug Fixes

* `ordirgl` failed when `cex` was a variable instead of a number.

* `orglcluster` did not obey `display` argument but always showed
  `"sites"`.

### New Features

* `orglellipse` gained a new option `kind = "ehull"` to draw ellipsoid
  hulls or minimum volume ellipsoids that enclose all points of a
  `group`. The option is based on `ellipsoidhull()` function
  (**cluster** package).

* `ordirgl` allows suppressing display of environmental variables in
  constrained ordination with `envfit = NA`.

Version 1.0-0
=============

### General

* Package was updated to the current **rgl** (version 0.95) giving a
  facelift to the plots.

### Bug Fixes

 * `orglspider` was not exported.

### New Functions

* `orditree3d` (based on **scatterplot3d**) and `ordirgltree` (based
  on **rgl**) draw a cluster dendrogram over a 2D ordination or any
  other plane, for instance a map.

* `orglcluster` is similar to **vegan** `ordicluster` and adds a
  cluster dendrogam to an `ordirgl` plot.

* `orglellipse` is similar to **vegan** `ordiellipse` and adds
  standard deviation, standard error or confidence ellipsoids to an
  `ordirgl` plot.

* `orglspantree` is similar to **vegan** `lines.spantree` and adds a
  minimum spanning tree to an `ordirgl` plot.

### New Features

* Users have improved control of colours of plotted items. The
  `col`our can be a vector for points or text items plotted, or for
  `groups` of items drawn in the graph (`orglellipse`, `orglsegments`,
  `orglspider`). If the functions draws lines connecting points, the
  line colour is a mixture of `col`ours of connected points
  (`orditree3d`, `ordirgltree`, `orglcluster`, `orglspantree`,
  `rgl.isomap`).

* `ordirgl` uses now small spheres instead of points with better
  visual impact.

* `ordiplot3d` gained a `scores` function making easier to add 2D
  items with **vegan** `ordiellipse`, `ordihull`, `ordispider`,
  `ordisegments` etc.

Version 0.65-1
==============

* Maintenance release to adapt to new CRAN rules and changes in
  **vegan**.

Version 0.65-0
==============

* First release version was made by splitting 3D graphic functions
  from **vegan**. Most of these functions were published in early
  versions (2005 to 2009) of **vegan** and are are still based on old
  **rgl** (version 0.65) and do not use the full capabilities of the
  modern package.
