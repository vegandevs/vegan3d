\name{vegan3d-package}
\alias{vegan3d-package}
\alias{vegan3d}
\docType{package}
\title{
Dynamic and Static 3D and Interactive 2D Plots for Ordination
}

\description{

The \pkg{vegan3d} package provides 3D plotting for all \CRANpkg{vegan}
ordination methods or any other ordination method that \CRANpkg{vegan}
\code{\link[vegan]{scores}} function can handle. It can also display
\code{\link{hclust}} results in 3D over a 2D plane. Dynamic 3D plots
are based on the \CRANpkg{rgl} package and static plots are drawn with
\CRANpkg{scatterplot3d} and \CRANpkg{lattice} packages. The package
also provides 2D editable interactive plots for ordination. The points
are fixed at their ordination scores, but labels can be moved to
better position, and the result can be saved in various graphics
formats or saved in \R{} session and re-created with \R{} plot
commands.

\packageIndices{vegan3d}

}

\section{Drawing with rgl Functions}{

The \CRANpkg{rgl} graphics are dynamic 3D plots that can be spinned and
zoomed with mouse. The \pkg{vegan3d} package provides interface to
ordination and clustering objects. The functions use \CRANpkg{rgl} setting
and conventions and do not change the user settings. For general
configuration of the plots, users should check \pkg{rgl}
documentation. For instance, general look and feel of drawn items can
be configured with \code{\link[rgl]{material3d}}.

The \CRANpkg{rgl} package may not be available on all platforms, and
the package is not automatically loaded. If you want to use
\CRANpkg{rgl} functions, you must either prefix commands with
\code{rgl::} or call \code{library(rgl)} in your session. If you
cannot launch \code{rgl} window (or widget) on your platform, check
the instructions on the \CRANpkg{rgl}. In most cases, it should be
possible to use \pkg{rgl} at least on a compatible browser.

Function \code{\link{ordirgl}} is similar to
\code{\link[vegan]{ordiplot}} in \CRANpkg{vegan}, and any ordination
result can be drawn with similar conventions. Functions with
\code{orgl} prefix add items to existing plots, for instance,
\code{\link{orglellipse}} is analogous to
\code{\link[vegan]{ordiellipse}}.

Function \code{\link{ordirgltree}} draws an \code{\link{hclust}}
dendrogram over a plane. It was originally developed for 2D ordination
planes, but any other plane can be used, for instance a projected map.

Functions \code{\link{rgl.isomap}} and \code{\link{rgl.renyiaccum}}
provide alternative dynamic 3D plots for \CRANpkg{vegan}
\code{\link[vegan]{isomap}} and \code{\link[vegan]{renyiaccum}}
functions.

}

\section{Drawing with scatterplot3d and lattice Functions}{

The \CRANpkg{scatterplot3d} package draws static 3D graphics, and
\pkg{vegan3d} provides an interface for ordination and clustering
objects. You must consult the
\code{\link[scatterplot3d]{scatterplot3d}} documentation for
configuring your plots. \pkg{vegan3d} function
\code{\link{ordilattice3d}} is similar, but is based on the
\CRANpkg{lattice} package, and can be modified using \pkg{lattice}
commands and arguments.

Function \code{\link{ordiplot3d}} is similar to \code{\link{ordirgl}}
or \code{\link[vegan]{ordiplot}} and draws a static 3D plot in the
standard graphical device. It returns invisibly a plotting object
which contains the projected points, and \CRANpkg{vegan} \code{ordi*}
prefix functions can use this object. For instance,
\code{\link[vegan]{ordiellipse}} will add ellipses on the projected
points.

Function \code{\link{ordilattice3d}} is a similar to
\code{\link{ordiplot3d}} in \pkg{lattice} graphics, but currently more
limited than \code{ordiplot3d}. The \pkg{lattice} package is not
loaded and you need to use \code{library(lattice)} or prefix your
\pkg{lattice} commands with \code{lattice::}. There are obvious ways
of improving the function. Contributions are welcome.

Function \code{\link{orditree3d}} will draw an \code{\link{hclust}}
dendrogram over a plane similarly as \code{\link{ordirgltree}}.
}

\section{Editable Graphics with Tcl/Tk based orditkplot}{

Function draws ordination scores in a new Tcl/Tk window with fixed
points and their editable labels. The labels can be moved to better
positions which helps with crowded plots. It is also possible to zoom
into graph to display only a part of the complete graph. The edited
result can be saved in various graphical formats or saved as an \R{}
object in the session for further manipulation or re-creating the graph
with standard \R{} plotting tools.

Tcl/Tk is not available on all platforms or \R{} installations. Use
command \code{capabilities("tcltk")} to see if you have it in your
system.

There are obvious ways of improving the function. Contributions are
welcome.
}

\keyword{package}
\keyword{multivariate}
\keyword{hplot}
\keyword{dynamic}
