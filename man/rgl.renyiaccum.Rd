\name{rgl.renyiaccum}
\alias{rgl.renyiaccum}

\title{
  Dynamic Perspective Plot of Renyi Diversity Accumulation
}
\description{
  Function \code{rgl.renyiaccum} displays a dynamic 3D plot of the result
  of \code{\link[vegan]{renyiaccum}} function in the \CRANpkg{vegan} 
  package. Function \code{\link[vegan]{persp.renyiaccum}} (in 
  \CRANpkg{vegan}) produces similar static plots. 
}
\usage{
rgl.renyiaccum(x, rgl.height = 0.2, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
    A \code{\link[vegan]{renyiaccum}} result.
}
  \item{rgl.height}{
    Vertical scaling of the plot.
}
  \item{\dots}{
    Other arguments passed to the function (ignored).
}
}
\details{
  This is a graphical support function to \code{\link[vegan]{renyiaccum}}
  in \CRANpkg{vegan}. Similar static plots can be produced by 
  \code{\link[vegan]{persp.renyiaccum}}.
}
\value{
  Function returns nothing.
}

\author{
  Roeland Kindt.
}

\seealso{
  \code{\link[vegan]{renyiaccum}}, \code{\link[vegan]{persp.renyiaccum}},
  \code{\link[rgl]{rgl}}.
}
\examples{
if (interactive() && require(rgl, quietly = TRUE)){
data(BCI)
mod <- renyiaccum(BCI[1:12,])
persp(mod)
rgl.renyiaccum(mod)
}
}

\keyword{ hplot }
\keyword{ dynamic }
