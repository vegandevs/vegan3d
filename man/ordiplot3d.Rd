\name{ordiplot3d}
\alias{ordiplot3d}

\title{Three-Dimensional Ordination Graphics }
\description{
  Function \code{ordiplot3d} displays three-dimensional ordination
  graphics using \code{\link[scatterplot3d]{scatterplot3d}}. Function 
  works with all ordination results form \pkg{vegan} and all ordination 
  results known by \code{\link[vegan]{scores}} function. 
}
\usage{
ordiplot3d(object, display = "sites", choices = 1:3, ax.col = 2,
        arr.len = 0.1, arr.col = 4, envfit, xlab, ylab, zlab, ...)
}
\arguments{
  \item{object}{An ordination result or any object known by 
    \code{\link[vegan]{scores}}. }
  \item{display}{Display \code{"sites"} or \code{"species"} or other
    ordination object recognized by \code{\link[vegan]{scores}}. }
  \item{choices}{Selected three axes.}
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
  diagrams using \code{\link[scatterplot3d]{scatterplot3d}}. 
  Function uses most default settings of underlying graphical functions,
  and you must consult their help pages to change graphics to suit your
  taste (see \code{\link[scatterplot3d]{scatterplot3d}}).
  Function will display only one selected set of \code{\link[vegan]{scores}},
  typically either \code{"sites"} or \code{"species"}, but
  for instance \code{\link[vegan]{cca}} also has \code{"lc"} scores. In
  constrained ordination (\code{\link[vegan]{cca}}, \code{\link[vegan]{rda}},
  \code{\link[vegan]{capscale}}), biplot arrows and centroids are always
  displayed similarly as in two-dimensional plotting function
  \code{\link[vegan]{plot.cca}}.  Alternatively, it is possible to display
  fitted environmental vectors or class centroids from
  \code{\link[vegan]{envfit}}.  These are displayed similarly as
  the results of constrained ordination, and they can be shown only for
  non-constrained ordination. The user must remember to specify at least
  three axes in \code{\link[vegan]{envfit}} if the results are used with these
  functions. 

  Function \code{ordiplot3d} plots only points. However, it returns
  invisibly an object inheriting from \code{\link[vegan]{ordiplot}} so 
  that you can use \code{\link[vegan]{identify.ordiplot}} to identify
  \code{"points"} or \code{"arrows"}. The underlying
  \code{\link[scatterplot3d]{scatterplot3d}} function accepts
  \code{type = "n"} so that only the axes, biplot arrows and centroids
  of environmental variables will be plotted, and the ordination
  scores can be added with \code{\link[vegan]{text.ordiplot}} or
  \code{\link[vegan]{points.ordiplot}}. Further, you can use any functions
  from the \code{\link[vegan]{ordihull}} family with the invisible result of
  \code{ordiplot3d}, but you must remember to specify the
  \code{display} as \code{"points"} or \code{"arrows"}. To change the
  viewing angle, orientation etc.{} you must see
  \code{\link[scatterplot3d]{scatterplot3d}}. Only one kind of scores
  will be plotted.  See Examples for plotting both species and
  site scores.
}
 
\value{

  Function \code{ordiplot3d} returns invisibly an object of class
  \code{"ordiplot3d"} inheriting from \code{\link[vegan]{ordiplot}}. 
  The return object will contain the coordinates projected onto two
  dimensions for \code{points}, and the projected coordinates of
  \code{origin}, and possibly the projected coordinates of the heads
  of \code{arrows} and \code{centroids} of environmental variables.
  Functions like \code{\link[vegan]{identify.ordiplot}},
  \code{\link[vegan]{points.ordiplot}}, \code{\link[vegan]{text.ordiplot}} 
  can use this result, as well as \code{\link[vegan]{ordihull}} and other
  functions documented with the latter. The result will also contain the 
  object returned by \code{\link[scatterplot3d]{scatterplot3d}}, including
  function \code{xyz.convert} which projects three-dimensional
  coordinates onto the plane used in the current plot (see
  Examples). In addition, there is a function \code{envfit.convert}
  that projects a three-dimensional \code{\link{envfit}} object to the
  current plot.
}

\author{Jari Oksanen }

\section{Warning}{
  Function \code{ordiplot3d} is based on
  \code{\link[scatterplot3d]{scatterplot3d}} which does not allow
  exactly setting equal aspect ratio for axes.  The function tries to
  circumvent this by setting equal plotting ranges for all axes so that
  the plot should be a cube.  Depending on the dimensions of plotting
  device, this may fail, and the user should verify that the axes are
  approximately equal.

  Please note that \code{\link[scatterplot3d]{scatterplot3d}} sets
  internally some graphical parameters (such as \code{mar} for margins)
  and does not honour default settings.  It is advisable to study
  carefully the documentation and examples of
  \code{\link[scatterplot3d]{scatterplot3d}}.
}

\seealso{   \code{\link[scatterplot3d]{scatterplot3d}},
  \code{\link[vegan]{ordiplot}}, \code{\link[vegan]{identify.ordiplot}}, 
  \code{\link[vegan]{text.ordiplot}}, \code{\link[vegan]{points.ordiplot}},
  \code{\link[vegan]{ordihull}}, \code{\link[vegan]{plot.cca}}, 
  \code{\link[vegan]{envfit}}.
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
}
\keyword{ hplot }

