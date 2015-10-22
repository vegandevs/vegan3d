\name{ordirgl}
\alias{ordirgl}
\alias{orglellipse}
\alias{orglpoints}
\alias{orgltext}
\alias{orglsegments}
\alias{orglspider}
\alias{orglspantree}
\alias{orglcluster}

\title{Three-Dimensional Dynamic Ordination Graphics }
\description{
  Function \code{ordirgl} displays three-dimensional dynamic ordination 
  graphs which can be rotated and zoomed into using \code{\link[rgl]{rgl}}
  package. This function works with all ordination
  results from \code{vegan} and all ordination results known by the
  \code{\link{scores}} function. The \code{orglXXXX} functions add
  elements to the \code{ordirgl} graph similarly as \code{ordiXXXX}
  function in \pkg{vegan}.
}
\usage{
ordirgl(object, display = "sites", choices = 1:3, type = "p", col = "black",
    ax.col = "red", arr.col = "yellow", radius, text, envfit, ...)
orglpoints(object, display = "sites", choices = 1:3, radius, col = "black", ...)
orgltext(object, text, display = "sites", choices = 1:3, justify = "center", 
    adj = 0.5, col = "black", ...)
orglsegments(object, groups, display = "sites", choices = 1:3, col = 1, ...)
orglspider(object, groups, display = "sites", w = weights(object, display),
    choices = 1:3, col = 1, ...)
orglellipse(object, groups, display = "sites", w = weights(object, display),
    kind = c("sd", "se"), conf, choices = 1:3, alpha = 0.3, col = 2, ...)
orglspantree(object, spantree, display = "sites", choices = 1:3, col = 1,
    ...)
orglcluster(object, cluster, prune = 0, display = "sites", choices = 1:3,
    col = 1, ...)
}
\arguments{
  \item{object}{An ordination result or any object known by \code{\link{scores}}. }
  \item{display}{Display \code{"sites"} or \code{"species"} or other
    ordination object recognized by \code{\link{scores}}. }
  \item{choices}{Selected three axes. }
  \item{type}{The type of plots: \code{"p"} for points or \code{"t"} for
    text labels.}
  \item{ax.col}{Axis colour (concerns only the crossed axes through the
    origin).}
  \item{arr.col}{Colour of biplot \code{\link{arrows}} and centroids of
    environmental variables. }
  \item{radius}{Size of points in the units of ordination scores.}
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
  \item{kind}{Whether standard deviations of points (\code{"sd"}) or
    standard deviations of their averages (\code{"se"}) are used.}
  \item{conf}{Confidence limit for ellipses, e.g., 0.95. If not given,
    sd or se ellipses are drawn.}
  \item{col}{Colour of items, can be a vector corresponding to
    \code{groups}.}
  \item{alpha}{Transparency of colour between 0.0 (fully transparent)
    and 1.0 (non-transparent).}
  \item{spantree}{A minimum spanning tree object from \pkg{vegan}
    \code{\link[vegan]{spantree}}.}
  \item{cluster}{Result of hierarchic cluster analysis, such as
    \code{\link{hclust}} or \code{\link[cluster]{agnes}}.}
  \item{prune}{Number of upper levels hierarchies removed from the
    tree. If \code{prune} > 0, tree will be cut into \code{prune + 1}
    disconnected trees.}
  \item{\dots}{Other parameters passed to graphical functions. }
}
\details{

  Function \code{ordirgl} plots dynamic graphics using OpenGL with
  \code{\link[rgl]{rgl}}.  Function uses most default settings of
  underlying graphical functions, and you must consult their help
  pages for configuration. Texts are plotted with
  \code{\link[rgl]{rgl.texts}} and points with
  \code{\link[rgl]{rgl.spheres}} which both have their own
  configuration switches and also can be modified with
  \code{\link[rgl]{rgl.material}}.  The point size is directly
  defined by \code{radius} argument in \code{\link[rgl]{rgl.spheres}}
  in the units of ordination scores, but \code{ordirgl} determines a
  default size which can be further modiefied by \code{cex}.

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
  wheel or touchpad gestures. Function \code{ordirgl} uses default
  settings, and you should consult \pkg{rgl} documentation for
  configuration, in particular see \code{\link[rgl]{rgl.material}}.
  Function \code{ordirgl} always cleans its graphic window before
  drawing.

  Function \code{orglpoints} adds points and \code{orgltext} adds text
  to existing \code{ordirgl} windows.  In addition, function
  \code{orglsegments} combines points within \code{"groups"} with line
  segments similarly as \code{\link[vegan]{ordisegments}}. Function
  \code{orglspider} works similarly as
  \code{\link[vegan]{ordispider}}: it connects points to their
  weighted centroid within \code{"groups"}, and in constrained
  ordination it can connect \code{"wa"} or weighted averages scores to
  corresponding \code{"lc"} or linear combination scores if
  \code{"groups"} is missing.  Function \code{orglellipse} works
  similarly as \code{\link[vegan]{ordiellipse}} and will draw ellipses
  of confidence regions for \code{"groups"}. Function
  \code{orglspantree} adds a minimum spanning tree from
  \code{\link[vegan]{spantree}}. This a 3D equivalent of
  \code{\link[vegan]{lines.spantree}}.  Function \code{orglcluster}
  adds a hierarchic cluster tree from \code{\link{hclust}} or related
  functions. This is a 3D equivalent of
  \code{\link[vegan]{ordicluster}}.

  Basic \code{rgl} functions \code{\link[rgl]{rgl.points}},
  \code{\link[rgl]{rgl.texts}}, \code{\link[rgl]{rgl.lines}},
  \code{\link[rgl]{bbox3d}} and many others can be used.

}
 
\value{

  Function \code{ordirgl} returns nothing.

}

\author{Jari Oksanen }

\section{Warning}{
  Function \code{ordirgl} uses OpenGL package \code{\link[rgl]{rgl}}
  which may not be functional in all platforms, and can crash R in
  some: use \code{\link{save.image}} before trying \code{ordirgl}. It
  seems that \code{\link[rgl]{rgl.texts}} does not always position the
  text like supposed, and it may be safe to verify text location with
  corresponding points.
}

\seealso{
  \code{\link[rgl]{rgl}}, \code{\link[rgl]{rgl.points}},
  \code{\link[rgl]{rgl.texts}}, \code{\link[rgl]{rgl.viewpoint}},
  \code{\link[vegan]{envfit}}. These are 3D dynamic variants of
  \pkg{vegan} functions \code{\link[vegan]{ordiplot}},
  \code{\link[vegan]{ordispider}} and \code{\link[vegan]{ordiellipse}}.
}

\examples{

if (interactive() && require(rgl, quietly = TRUE)) {
data(mite, mite.env)
ord <- rda(decostand(mite, "hellinger"))
ordirgl(ord, size=4, col = "yellow")
orgltext(ord, display = "species")
## show groups of Shrub abundance
## ordirgl: col by points
with(mite.env, ordirgl(ord, col = as.numeric(Shrub), scaling = 1))
## orglspider & orglellipse: col by groups
with(mite.env, orglspider(ord, Shrub, col = 1:3, scaling = 1))
with(mite.env, orglellipse(ord, Shrub, col = 1:3, kind = "se", conf = 0.95,
    scaling = 1))
}
}
\keyword{ hplot }
\keyword{ dynamic }
