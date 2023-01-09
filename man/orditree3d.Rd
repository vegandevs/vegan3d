\name{orditree3d}
\alias{orditree3d}
\alias{ordirgltree}

\title{
Draw Cluster Tree over a Plane
}

\description{
  Function draws a 3D plot where ordination result is at the bottom
  plane and a \code{\link{hclust}} dendrogram is drawn above the
  plane.
}

\usage{
orditree3d(ord, cluster, prune = 0, display = "sites", choices = c(1, 2),
    col = "blue", text, type = "p", ...)
ordirgltree(ord, cluster, prune = 0, display = "sites", choices = c(1, 2),
    col = "blue", text, type = "p", ...)
}

\arguments{

  \item{ord}{An ordination object or an \code{\link[vegan]{ordiplot}}
    object or any other structure defining a 2D plane.}

  \item{cluster}{Result of hierarchic cluster analysis, such as
    \code{\link{hclust}} or \code{\link[cluster]{agnes}} or any other
    clutering that can be coerced to a compliant format by
    \code{\link{as.hclust}}.}

  \item{prune}{Number of upper levels hierarchies removed from the
    tree. If \code{prune} > 0, tree will be cut into \code{prune + 1}
    disconnected trees.}

  \item{choices}{
    Choice of ordination axes.}

  \item{display}{
    Ordination scores displayed.}

  \item{col}{Colour of tree. The colour can be a vector and it is used
    for the points, text and terminal branches. The colour of internal
    branches is a mixture of connected leaves.}

  \item{text}{Text to replace the default of item labels when
    \code{type = "t"}. }

  \item{type}{Display of leaves: \code{"p"} for points, \code{"t"} for
    text, and \code{"n"} for no display.}

  \item{\dots}{ Arguments passed to \code{\link[vegan]{scores}} and
    graphical functions.}
}

\details{

  \code{orditree3d} uses \CRANpkg{scatterplot3d} package to draw a static
  3D plot of the dendrogram over the ordination, and
  \code{ordirgltree} uses \CRANpkg{rgl} to make a dynamic, spinnable plot.
  The functions were developed to plot a cluster dendrogram over a 2D
  ordination plane, but any other plane can be used, for instance, a
  map.

}

\value{
  Function \code{orditree3d} returns invisibly a
  \code{\link[scatterplot3d]{scatterplot3d}} result object amended
  with items \code{points} and \code{internal} that give the projected
  coordinates of ordination scores and internal nodes, and
  \code{col.points} and \code{col.internal} that give their
  colours. All matrix-like objects can be accessed with
  \code{scores}.

  Function \code{ordirgltree} returns nothing.
}

\author{
  Jari Oksanen.
}

\seealso{

  \code{\link{orglcluster}} and \code{\link[vegan]{ordicluster}} (in
  \CRANpkg{vegan}).

}

\examples{
  data(dune, dune.env)
  d <- vegdist(dune)
  m <- metaMDS(d)
  cl <- hclust(d, "aver")
  orditree3d(m, cl, pch=16, col=cutree(cl, 3))
  ## ordirgltree makes ordinary rgl graphics. It accepts
  ## material3d() settings, and you can add elements to the
  ## open graph (for instance, bbox3d()).
  if (interactive() && require(rgl, quietly = TRUE)) {
  with(dune.env, ordirgltree(m, cl, col = as.numeric(Management), size = 6,
     lwd = 2, alpha = 0.6))
  }
}

\keyword{ hplot }
