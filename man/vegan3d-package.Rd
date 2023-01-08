\name{vegan3d-package}
\alias{vegan3d-package}
\alias{vegan3d}
\docType{package}
\title{
Dynamic and Static 3D Plotting for Ordination and Clustering
}

\description{

The \pkg{vegan3d} package provides 3D plotting for all \CRANpkg{vegan}
ordination methods or any other ordination method that \CRANpkg{vegan}
\code{\link[vegan]{scores}} function can handle. It can also display
\code{\link{hclust}} results in 3D over a 2D plane. Dynamic 3D plots
are based on the \CRANpkg{rgl} package and static plots are drawn with the
\CRANpkg{scatterplot3d} package.

\packageIndices{vegan3d}

}

\section{Drawing with rgl Functions}{

The \CRANpkg{rgl} graphics are dynamic 3D plots that can be spinned and
zoomed by mouse. The \pkg{vegan3d} package provides interface to
ordination and clustering objects. The functions use \CRANpkg{rgl} setting
and conventions and do not change the user settings. For general
configuration of the plots, users should check \pkg{\link{rgl}}
documentation. For instance, general look and feel of drawn items can
be configured with \code{\link[rgl]{material3d}}.

The \CRANpkg{rgl} package may not be available in all platforms, and
therefore the package is not automatically attached. If you want to
use \CRANpkg{rgl} functions, you must either prefix commands with
\code{rgl::} or call \code{library(rgl)} in your session.

Function \code{\link{ordirgl}} is simalar as
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

\section{Drawing with scatterplot3d Functions}{

The \CRANpkg{scatterplot3d} package draws static 3D graphics, and
\pkg{vegan3d} provides an interface for ordination and clustering
objects. You must consult the
\code{\link[scatterplot3d]{scatterplot3d}} documentation for
configuring your plots.

Function \code{\link{ordiplot3d}} is similar to \code{\link{ordirgl}}
or \code{\link[vegan]{ordiplot}} and draws a static 3D plot in the
standard graphical device. It returns invisibly a plotting object
which contains the projected points, and \CRANpkg{vegan} \code{ordi*}
prefix functions can use this object. For instance,
\code{\link[vegan]{ordiellipse}} will add ellipses on the projected
points.

Function \code{\link{orditree3d}} will draw an \code{\link{hclust}}
dendrogram over a plane similarly as \code{\link{ordirgltree}}.

}

\keyword{package}
\keyword{multivariate}
\keyword{hplot}
\keyword{dynamic}
