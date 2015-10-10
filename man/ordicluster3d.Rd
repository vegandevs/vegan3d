\name{ordicluster3d}
\alias{ordicluster3d}
\alias{orglcluster}

\title{
Draw Cluster Tree over an Ordination Plane
}

\description{
  Function draws a 3D plot where ordination result is at the bottom
  plane and and a \code{\link{hclust}} dendrogam is drawn above the
  plane.
}

\usage{
ordicluster3d(ord, cluster, choices = c(1, 2), display = "sites", ...)
orglcluster(ord, cluster, ...)
}

\arguments{
  \item{ord}{
    An ordination object or an \code{\link[vegan]{ordiplot}} object.}

  \item{cluster}{Result of hierarchic cluster analysis, such as
    \code{\link{hclust}} or \code{\link[cluster]{agnes}}.}

  \item{choices}{
    Choice of ordination axes.}

  \item{display}{
    Ordination scores displayed.}

  \item{\dots}{ Arguments passed to \code{\link[vegan]{scores}} and
    graphical functions.}
}

\details{
  \code{ordicluster3d} uses \pkg{scatterplot3d} package to draw a
  static 3D plot of the dendrogram over the ordinaation, and
  \code{orglcluster} uses \pkg{rgl} to make a dynamic, spinnable plot.
}

\value{
  Function \code{ordicluster3d} returns invisibly a
  \code{\link[scatterplot3d]{scatterplot3d}} result object amended
  with items \code{leaves} and \code{nodes} that give the projected
  coordinates of ordination scores and internal nodes. Function
  \code{orglcluster} returns nothing.
}

\author{
  Jari Oksanen.
}

\seealso{
  \code{\link[vegan]{ordicluster}} in \pkg{vegan}.
}
\examples{
  data(dune)
  d <- vegdist(dune)
  ordicluster3d(metaMDS(d), hclust(d), pch=16, col="blue")
}

\keyword{ hplot }
