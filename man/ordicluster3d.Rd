\name{ordicluster3d}
\alias{ordicluster3d}

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

  \item{\dots}{
    Arguments passed to \code{\link[vegan]{scores}}, \code{\link{points}} or
    \code{\link{segments}}.}
}

\value{
  Function returns invisibly a
  \code{\link[scatterplot3d]{scatterplot3d}} result object amended
  with items \code{leaves} and \code{nodes} that give the projected
  coordinates of ordination scores and internal nodes.
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
