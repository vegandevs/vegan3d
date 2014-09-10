\name{ordirgl}
\alias{ordirgl}
\alias{orglpoints}
\alias{orgltext}
\alias{orglsegments}
\alias{orglspider}

\title{Three-Dimensional Dynamic Ordination Graphics }
\description{
  Function \code{ordirgl} displays three-dimensional dynamic ordination 
  graphs which can be rotated and zoomed into using \code{\link[rgl]{rgl}}
  package. Function workw with all ordination
  results form \code{vegan} and all ordination results known by
  \code{\link{scores}} function. 
}
\usage{
ordirgl(object, display = "sites", choices = 1:3, type = "p", 
        ax.col = "red", arr.col = "yellow", text, envfit, ...)
orglpoints(object, display = "sites", choices = 1:3, ...)
orgltext(object, text, display = "sites", choices = 1:3, justify = "center", 
        adj = 0.5, ...)
orglsegments(object, groups, display = "sites", choices = 1:3, ...)
orglspider(object, groups, display = "sites", w = weights(object, display),
        choices = 1:3, ...)
}
\arguments{
  \item{object}{An ordination result or any object known by \code{\link{scores}}. }
  \item{display}{Display \code{"sites"} or \code{"species"} or other
    ordination object recognized by \code{\link{scores}}. }
  \item{choices}{Selected three axes. }
    \item{arr.len}{'Length' (width) of arrow head passed to
    \code{\link{arrows}} function. }
  \item{type}{The type of plots: \code{"p"} for points or \code{"t"} for
    text labels.}
  \item{ax.col}{Axis colour (concerns only the crossed axes through the
    origin).}
  \item{arr.col}{Colour of biplot \code{\link{arrows}} and centroids of
    environmental variables. }
  \item{text}{Text to override the default with \code{type = "t"}.}
  \item{envfit}{Fitted environmental variables from \code{\link{envfit}}
    displayed in the graph.}
  \item{justify, adj}{Text justification passed to
    \code{\link[rgl]{rgl.texts}}. One of these is used depending on the
    version of \pkg{rgl} installed.}
  \item{groups}{Factor giving the groups for which the graphical item is
    drawn.}
  \item{w}{Weights used to find the average within group. Weights are
    used automatically for \code{\link{cca}}
    and \code{\link{decorana}} results, unless undone by the
    user. \code{w=NULL} sets equal weights to all points. }
  \item{\dots}{Other parameters passed to graphical functions. }
}
\details{

  Function \code{ordirgl} plots dynamic graphics using OpenGL with
  \code{\link[rgl]{rgl}}.  Function uses most default settings of
  underlying graphical functions, and you must consult their help
  pages to change graphics to suit your taste (\code{\link[rgl]{rgl}},
  \code{\link[rgl]{rgl.points}},\code{\link[rgl]{rgl.texts}}).
  Functions will display only one selected set of
  \code{\link[vegan]{scores}}, typically either \code{"sites"} or
  \code{"species"}, but for instance \code{\link[vegan]{cca}} also has
  \code{"lc"} scores. In constrained ordination
  (\code{\link[vegan]{cca}}, \code{\link[vegan]{rda}},
  \code{\link[vegan]{capscale}}), biplot arrows and centroids are
  always displayed similarly as in two-dimensional plotting function
  \code{\link[vegan]{plot.cca}}.  Alternatively, it is possible to
  display fitted environmental vectors or class centroids from
  \code{\link[vegan]{envfit}} in both graphs.  These are displayed
  similarly as the results of constrained ordination, and they can be
  shown only for non-constrained ordination. The user must remember to
  specify at least three axes in \code{\link[vegan]{envfit}} if the
  results are used with these functions.

  Function \code{ordigl} makes a dynamic three-dimensional graph that
  can be rotated with mouse, and zoomed into with mouse buttons or
  wheel (but Mac users with one-button mouse should see
  \code{\link[rgl]{rgl.viewpoint}}, or try ctrl-button). MacOS X users
  must start \code{X11} before calling \code{\link[rgl]{rgl}}
  commands.  Function \code{ordirgl} uses default settings, and you
  should consult the underlying functions
  \code{\link[rgl]{rgl.points}}, \code{\link[rgl]{rgl.texts}} to see
  how to control the graphics. Function \code{ordirgl} always cleans
  its graphic window before drawing.  Functions \code{orglpoints} adds
  points and \code{orgltext} adds text to existing \code{ordirgl}
  windows.  In addition, function \code{orglsegments} combines points
  within \code{"groups"} with line segments similarly as
  \code{\link[vegan]{ordisegments}}. Function \code{orglspider} works
  similarly as \code{\link[vegan]{ordispider}}: it connects points to
  their weighted centroid within \code{"groups"}, and in constrained
  ordination it can connect \code{"wa"} or weighted averages scores to
  corresponding \code{"lc"} or linear combination scores if
  \code{"groups"} is missing. In addition, basic \code{rgl} functions
  \code{\link[rgl]{rgl.points}}, \code{\link[rgl]{rgl.texts}},
  \code{\link[rgl]{rgl.lines}} and many others can be used.

}
 
\value{

  Function \code{ordirgl} returns nothing.

}

\author{Jari Oksanen }

\section{Warning}{Function \code{ordirgl} uses OpenGL package
  \code{\link[rgl]{rgl}}
  which may not be functional in all platforms, and can crash R in some:
  use \code{\link{save.image}} before trying \code{ordirgl}.
  Mac users must start \code{X11} (and first install \code{X11} and some other
  libraries) before being able to use \code{\link[rgl]{rgl}}. It seems
  that \code{\link[rgl]{rgl.texts}} does  not always position the text
  like supposed, and it may be safe to verify text location with
  corresponding points.
}

\note{
  The function was originally written for \pkg{rgl} version
  0.64-0, but its user interface was upgraded to 0.65-0. However, more
  modern features of \pkg{rgl} are not used.  
}

\seealso{
  \code{\link[rgl]{rgl}}, \code{\link[rgl]{rgl.points}},
  \code{\link[rgl]{rgl.texts}}, \code{\link[rgl]{rgl.viewpoint}},
  \code{\link[vegan]{envfit}}.
}
\examples{
## Examples are not run, because they need user interaction.
\dontrun{
ordirgl(ord, size=2)
ordirgl(ord, display = "species", type = "t")
rgl.quit()
}
}
\keyword{ hplot }
\keyword{ dynamic }
