\name{ordilattice3d}
\alias{ordilattice3d}
\alias{panel.ordi3d}
\alias{prepanel.ordi3d}

\title{ 3D Trellis (Lattice) Plots for Ordination }
\description{
  Function \code{ordicloud} provides an interface to plot ordination
  results using Trellis function \code{\link[lattice]{cloud}} in package
  \pkg{lattice}.
}

\usage{
ordilattice3d(x, data = NULL, formula, display = "sites", choices = 1:3,
    panel = "panel.ordi3d", prepanel = "prepanel.ordi3d",  ...)
}

\arguments{
  \item{x}{ An ordination result that \code{\link{scores}} knows: any
    ordination result in \pkg{vegan} and many others. }
  \item{data}{ Optional data to amend ordination results. The ordination
    results are found from \code{x}, but you may give here data for other
    variables needed in plots. Typically these are environmental data.}
  \item{formula}{ Formula to define the plots. A default formula will be
    used if this is omitted. The
    ordination axes must be called by the same names as in the
    ordination results (and these names vary among methods). In
    \code{ordisplom}, special character \code{.} refers to the
    ordination result. }
  \item{display}{ The kind of scores: an argument passed to
    \code{\link{scores}}. }
  \item{choices}{ The axes selected: an argument passed to
    \code{\link{scores}}. } 
  \item{panel, prepanel}{ The names of the panel and prepanel
    functions. }
  \item{\dots}{ Arguments passed to \code{\link{scores}} methods or
    \pkg{lattice} functions.}
}

\details{

  The functions provide an interface to the \pkg{lattice}
  function \code{\link[lattice]{cloud}}.
  All graphical parameters are passed to the \pkg{lattice}
  functions so that the graphs are configurable.

  The argument \code{x} must always be an ordination result. The scores
  are extracted with \pkg{vegan} function \code{\link{scores}} so that
  these functions work with all \pkg{vegan} ordinations and many others.

  The \code{formula} is used to define the models. Function has simple
  default formulae which is used if \code{formula} is missing.  If
  \code{formula} is given, ordination results must be referred to as
  \code{.} and other variables by their names. In other functions, the
  formula must use the names of ordination scores and names of
  \code{data}.

  The ordination scores are found from \code{x}, and \code{data} is
  optional. The \code{data} should contain other variables than
  ordination scores to be used in plots. Typically, they are
  environmental variables (typically factors) to define panels or plot
  symbols.

  The proper work is done by the panel function. The layout can be
  changed by defining own panel functions. See
  \code{\link[lattice]{panel.cloud}} for details and survey of
  possibilities.

  Ordination graphics should always be isometric: same scale should be
  used in all axes. The isometric scaling is defined in \code{panel} and
  \code{prepanel} functions. You must replace these functions if you
  want to have non-isometric scaling of graphs }

\value{
  The function return \code{\link[lattice]{Lattice}} objects of class
  \code{"trellis"}.   
}
\author{Jari Oksanen }
 
\seealso{
  \code{\link[lattice]{Lattice}},
  \code{\link[lattice]{cloud}},
  \code{\link[lattice]{panel.cloud}}
}
\examples{
data(dune, dune.env)
ord <- cca(dune)

ordilattice3d(ord, form = CA2 ~ CA3*CA1, groups = Manure, data = dune.env)
ordilattice3d(ord, form = CA2 ~ CA3*CA1 | Management, groups = Manure,
   data = dune.env, auto.key = TRUE, type = c("p","h"))
}

\keyword{ hplot }

