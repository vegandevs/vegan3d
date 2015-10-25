\name{ordiplot3d}
\alias{ordiplot3d}
\alias{scores.ordiplot3d}

\title{Three-Dimensional Ordination Graphics }
\description{
  Function \code{ordiplot3d} displays three-dimensional ordination
  graphics using \code{\link[scatterplot3d]{scatterplot3d}}. Function 
  works with all ordination results form \pkg{vegan} and all ordination 
  results known by \code{\link[vegan]{scores}} function. 
}
\usage{
ordiplot3d(object, display = "sites", choices = 1:3, col = "black",
    ax.col = "red", arr.len = 0.1, arr.col = "blue", envfit,
    xlab, ylab, zlab, ...)
}
\arguments{
  \item{object}{An ordination result or any object known by 
    \code{\link[vegan]{scores}}. }
  \item{display}{Display \code{"sites"} or \code{"species"} or other
    ordination object recognized by \code{\link[vegan]{scores}}. }
  \item{choices}{Selected three axes.}
  \item{col}{Colours of points. Can be a vector, and factors are
    interpreted as their internal numerical codes.}
  \item{ax.col}{Axis colour (concerns only the crossed axes through the
    origin).}
  \item{arr.len}{'Length' (width) of arrow head passed to
    \code{\link{arrows}} function. }
  \item{arr.col}{Colour of biplot \code{\link{arrows}} and centroids of
    environmental variables. }
  \item{envfit}{Fitted environmental variables from \code{\link{envfit}}
    displayed in the graph.}
  \item{xlab, ylab, zlab}{Axis labels passed to
    \code{\link[scatterplot3d]{scatterplot3d}}. If missing, labels  are
    taken from the
    ordination result. Set to \code{NA} to suppress labels. }
  \item{\dots}{Other parameters passed to graphical functions. }
}

\details{
  Function \code{ordiplot3d} plots static three-dimensional scatter
  diagrams using \code{\link[scatterplot3d]{scatterplot3d}}.  Function
  uses most default settings of underlying graphical functions, and
  you must consult their help pages to change graphics to suit your
  taste (see \code{\link[scatterplot3d]{scatterplot3d}}).

  Function returns invisibly an object of class \code{ordiplot3d}
  which inherits from \code{\link{ordiplot}}. The result object
  contains the projected coordinates of plotted items and functions to
  convert 3D data to 2D (see
  \code{\link[scatterplot3d]{scatterplot3d}}). Function will display
  only one selected set of \code{\link[vegan]{scores}}, typically
  either \code{"sites"} or \code{"species"}. Examples show how to use
  the inivisble return object to add another set of points to the 2D
  projection.

  In constrained ordination (\code{\link[vegan]{cca}},
  \code{\link[vegan]{rda}}, \code{\link[vegan]{capscale}}), biplot
  arrows and centroids are always displayed similarly as in
  two-dimensional plotting function \code{\link[vegan]{plot.cca}}.
  Alternatively, it is possible to display fitted environmental
  vectors or class centroids from \code{\link[vegan]{envfit}}.  These
  are displayed similarly as the results of constrained ordination,
  and they can be shown only for non-constrained ordination. The user
  must remember to specify at least three axes in
  \code{\link[vegan]{envfit}} if the results are used with these
  functions.

  The function has a \code{scores} method to extract the projected
  coordinates from the invisible return object. Standard \pkg{vegan}
  functions can be used with the returned object.  You can use any
  function from the \code{\link[vegan]{ordihull}} and
  \code{\link[vegan]{ordiarrows}} families (see Examples).

}
\value{

  Function \code{ordiplot3d} returns invisibly an object of class
  \code{"ordiplot3d"} inheriting from \code{\link[vegan]{ordiplot}}.
  The return object will contain the coordinates projected onto two
  dimensions for \code{points}, and the projected coordinates of
  \code{origin}, and possibly the projected coordinates of the heads
  of \code{arrows} and \code{centroids} of environmental variables.
  The result will also contain the object returned by
  \code{\link[scatterplot3d]{scatterplot3d}}, including function
  \code{xyz.convert} which projects three-dimensional coordinates onto
  the plane used in the current plot (see Examples). In addition,
  there is a function \code{envfit.convert} that projects a
  three-dimensional \code{\link{envfit}} object to the current plot.

}

\author{Jari Oksanen }

\section{Warning}{

  Function \code{ordiplot3d} is based on
  \code{\link[scatterplot3d]{scatterplot3d}} which does not allow
  setting equal aspect ratio for axes.  The function tries to
  circumvent this by setting equal plotting ranges for all axes so
  that the plot should be a cube.  Depending on the dimensions of
  plotting device, this may fail, and the user should verify that the
  axes are approximately isometric.

  Please note that \code{\link[scatterplot3d]{scatterplot3d}} sets
  internally some graphical parameters (such as \code{mar} for margins)
  and does not honour default settings.  It is advisable to study
  carefully the documentation and examples of
  \code{\link[scatterplot3d]{scatterplot3d}}.

}

\seealso{ \code{\link[scatterplot3d]{scatterplot3d}},
  \code{\link[vegan]{ordiplot}}, \code{\link[vegan]{ordiarrows}},
  \code{\link[vegan]{ordihull}}.
}

\examples{
### Default 'ordiplot3d'
data(dune, dune.env)
ord <- cca(dune ~ A1 + Moisture, dune.env)
ordiplot3d(ord)
### A boxed 'pin' version
ordiplot3d(ord, type = "h")
### More user control
pl <- ordiplot3d(ord, scaling = 3, angle=15, type="n")
points(pl, "points", pch=16, col="red", cex = 0.7)
### identify(pl, "arrows", col="blue") would put labels in better positions
text(pl, "arrows", col="blue", pos=3)
text(pl, "centroids", col="blue", pos=1, cex = 1)
### Add species using xyz.convert function returned by ordiplot3d
sp <- scores(ord, choices=1:3, display="species", scaling=3)
text(pl$xyz.convert(sp), rownames(sp), cex=0.7, xpd=TRUE)
### Two ways of adding fitted variables to ordination plots
ord <- cca(dune)
ef <- envfit(ord ~ Moisture + A1, dune.env, choices = 1:3)
### 1. use argument 'envfit'
ordiplot3d(ord, envfit = ef)
### 2. use returned envfit.convert function for better user control
pl3 <- ordiplot3d(ord)
plot(pl3$envfit.convert(ef), at = pl3$origin)
### envfit.convert() also handles different 'choices' of axes
pl3 <- ordiplot3d(ord, choices = c(1,3,2))
plot(pl3$envfit.convert(ef), at = pl3$origin)
### vegan::ordiXXXX functions can add items to the plot
ord <- cca(dune)
pl4 <- with(dune.env, ordiplot3d(ord, col = Management, pch=16))
with(dune.env, ordiellipse(pl4, Management, draw = "poly", col = 1:4,
  alpha = 60))
with(dune.env, ordispider(pl4, Management, col = 1:4, label = TRUE))
}
\keyword{ hplot }

