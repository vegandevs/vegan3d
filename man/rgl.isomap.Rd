\name{rgl.isomap}
\alias{rgl.isomap}

\title{
  Dynamic 3D plot of isomap ordination.
}
\description{
  Function displays a dynamic 3D plot from \code{\link[vegan]{isomap}}
  ordination. 
}
\usage{
rgl.isomap(x, web = "white", ...)
}

\arguments{

  \item{x}{Result from \code{\link[vegan]{isomap}}.}

  \item{web}{Colour of the web. If this is a vector matching the number
    of points, the colour of links is a mixture of joined points.}

  \item{\dots}{ Other parameters passed to \code{\link{ordirgl}} and
    \code{\link[vegan]{scores}}.}

}
\details{
  
  Function \code{rgl.isomap} displays dynamic 3D plots that can be
  rotated on the screen. The functions is based on
  \code{\link{ordirgl}}, but it adds the connecting lines. The
  function passes extra arguments to \code{\link[vegan]{scores}} or
  \code{\link{ordirgl}} functions so that you can select axes, or
  define colours and sizes of points.

}
\value{
  Function returns nothing.
}

\author{
  Jari Oksanen.
}
\note{
  This is a support function for \code{\link[vegan]{isomap}} ordination
  in the \pkg{vegan} package. 
}


\seealso{
  \code{\link[vegan]{isomap}}, \code{\link{ordirgl}}, 
  \code{\link[vegan]{scores}}.
}
\examples{
if (interactive() && require(rgl, quietly = TRUE)) {
data(BCI)
dis <- vegdist(BCI)
## colour points and links by the dominant species
dom <- factor(make.cepnames(names(BCI))[apply(BCI, 1, which.max)])
ord <- isomap(dis, k=3)
rgl.isomap(ord, col = as.numeric(dom), web = as.numeric(dom), lwd=2)
}
}

\keyword{ hplot }
\keyword{ dynamic }
