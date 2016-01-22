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
  Function \code{ordirgl} displays three-dimensional dynamic
  ordination graphs which can be rotated and zoomed. This function
  works with all ordination results from \code{vegan} and all
  ordination results known by the \code{\link{scores}} function. The
  \code{orgl}-prefixed functions add elements to the \code{ordirgl}
  graph similarly as \code{ordi}-prefixed functions in \CRANpkg{vegan}.
}

\usage{
ordirgl(object, display = "sites", choices = 1:3, type = "p", col = "black",
    ax.col = "red", arr.col = "yellow", radius, text, envfit, ...)
orglpoints(object, display = "sites", choices = 1:3, radius, col = "black", ...)
orgltext(object, text, display = "sites", choices = 1:3, adj = 0.5,
    col = "black", ...)
orglsegments(object, groups, order.by, display = "sites", choices = 1:3,
    col = "black", ...)
orglspider(object, groups, display = "sites", w = weights(object, display),
    choices = 1:3, col = "black", ...)
orglellipse(object, groups, display = "sites", w = weights(object, display),
    kind = c("sd", "se"), conf, choices = 1:3, alpha = 0.3, col = "red", ...)
orglspantree(object, spantree, display = "sites", choices = 1:3,
    col = "black", ...)
orglcluster(object, cluster, prune = 0, display = "sites", choices = 1:3,
    col = "black", ...)
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
    displayed in the graph. Use \code{envfit = NA} to suppress display
    of environmental variables in constrained ordination.}
  \item{adj}{Text justification passed to \code{\link[rgl]{rgl.texts}}.}
  \item{groups}{Factor giving the groups for which the graphical item is
    drawn.}
  \item{order.by}{Order points by this variable within \code{groups}.}
  \item{w}{Weights used to find the average within group. Weights are
    used automatically for \code{\link{cca}}
    and \code{\link{decorana}} results, unless undone by the
    user. \code{w=NULL} sets equal weights to all points. }
  \item{kind}{Whether standard deviations of points (\code{"sd"}) or
    standard deviations of their averages (\code{"se"}) are used.}
  \item{conf}{Confidence limit for ellipses, e.g., 0.95. If not given,
    sd or se ellipses are drawn.}
  \item{col}{Colour of items. This can be a vector and factors are
    interpreted as their internal numerical values. If the function
    has a \code{groups} argument, vector \code{col} is used for each
    of these, and for other functions it is matched to points in
    \code{ordirgl} (see Details below).}
\item{alpha}{Transparency of colour between 0.0 (fully transparent)
    and 1.0 (non-transparent).}
  \item{spantree}{A minimum spanning tree object from \CRANpkg{vegan}
    \code{\link[vegan]{spantree}}.}
  \item{cluster}{Result of hierarchic cluster analysis, such as
    \code{\link{hclust}} or \code{\link[cluster]{agnes}}.}
  \item{prune}{Number of upper levels hierarchies removed from the
    tree. If \code{prune} > 0, tree will be cut into \code{prune + 1}
    disconnected trees.}
  \item{\dots}{Other parameters passed to graphical functions. }
}
\details{

  Function \code{ordirgl} plots dynamic graphics using OpenGL with the
  \code{\link[rgl]{rgl}} package. It clears the graphics device and
  starts a new plot. The function was designed for ordination methods
  in the \CRANpkg{vegan} package, but it can handle any method known to
  \CRANpkg{vegan} \code{\link[vegan]{scores}} function, or to any three
  column matrix. The \code{orgl}-prefixed functions add items to the
  opened \CRANpkg{rgl} graphics device.

  Function \code{ordirgl} uses most default settings of underlying
  graphical functions in \code{rgl}. It plots only one set of points,
  but functions \code{orglpoints} and \code{orgltext} can add new
  items to an existing plot. The points are plotted using
  \code{\link[rgl]{rgl.spheres}} and the text using
  \code{\link[rgl]{rgl.texts}} which both have their own configuration
  switches and their general look and feel can be modified with
  \code{\link[rgl]{rgl.material}}. The point size is directly defined
  by \code{radius} argument in the units of ordination scores in
  \code{\link[rgl]{rgl.spheres}}, but \code{ordirgl} uses a default
  size of 1\% of the length of the longest axis, and this can be
  further modified by the \code{cex} multiplier.

  In constrained ordination (\code{\link[vegan]{cca}},
  \code{\link[vegan]{rda}}, \code{\link[vegan]{capscale}}), biplot
  arrows and centroids are always displayed similarly as in
  two-dimensional plotting function \code{\link[vegan]{plot.cca}}.
  Alternatively, it is possible to display fitted environmental
  vectors or class centroids from \code{\link[vegan]{envfit}} in both
  graphs.  These are displayed similarly as the results of constrained
  ordination, and they can be shown only for non-constrained
  ordination. The user must remember to specify at least three axes in
  \code{\link[vegan]{envfit}} if the results are used with these
  functions.

  Function \code{orglsegments} is similar to \CRANpkg{vegan}
  \code{\link[vegan]{ordisegments}} and connects points by line
  segments. This can be useful for regular transects. The colour of
  segments can be a vector which corresponds to the \code{groups} and
  will be recycled.

  Function \code{orglspider} is similar as \CRANpkg{vegan}
  \code{\link[vegan]{ordispider}}: it connects points to their
  weighted centroid within \code{"groups"}, and in constrained
  ordination it can connect \code{"wa"} or weighted averages scores to
  corresponding \code{"lc"} or linear combination scores if
  \code{"groups"} is missing.  Function \code{orglellipse} is similar
  as \CRANpkg{vegan} \code{\link[vegan]{ordiellipse}} and draws ellipsoids
  of standard deviance, standard error or confidence regions for
  \code{groups}. At least four points are needed to define an
  ellipsoid in 3D, and even these will fail if all points are strictly
  on 2D. The \code{col} argument for both of these functions can be a
  vector corresponding to the \code{groups}.

  Function \code{orglspantree} adds a minimum spanning tree from
  \CRANpkg{vegan} \code{\link[vegan]{spantree}}. This a 3D equivalent of
  \code{\link[vegan]{lines.spantree}}.  Function \code{orglcluster}
  adds a hierarchic cluster tree from \code{\link{hclust}} or related
  functions. This is a 3D equivalent of
  \code{\link[vegan]{ordicluster}}. The \code{col} argument for both
  of these functions can be a vector corresponding to the connected
  points. In \code{orglspantree} the line colour is a mixture of
  colours of joined points, and in \code{orglcluster} it is a mixture
  of all points in the cluster.

}
 
\value{

  Function \code{ordirgl} returns nothing.

}

\author{Jari Oksanen }

\section{Warning}{
  Function \code{ordirgl} uses OpenGL package \code{\link[rgl]{rgl}}
  which may not be functional in all platforms.
}

\seealso{

  \code{\link[rgl]{rgl}}, \code{\link[rgl]{rgl.spheres}},
  \code{\link[rgl]{rgl.texts}}, \code{\link[rgl]{rgl.viewpoint}},
  \code{\link[vegan]{envfit}}. These are 3D dynamic variants of
  \CRANpkg{vegan} functions \code{\link[vegan]{ordiplot}},
  \code{\link[vegan]{ordisegments}}, \code{\link[vegan]{ordispider}}
  and \code{\link[vegan]{ordiellipse}},
  \code{\link[vegan]{ordicluster}} and
  \code{\link[vegan]{lines.spantree}}.

}

\examples{

if (interactive() && require(rgl, quietly = TRUE)) {
data(mite, mite.env)
ord <- rda(decostand(mite, "hellinger"))
ordirgl(ord, size=4, col = "yellow")
orgltext(ord, display = "species")
## show groups of Shrub abundance
## ordirgl: col by points
with(mite.env, ordirgl(ord, col = as.numeric(Shrub), scaling = "sites"))
## orglspider & orglellipse: col by groups
with(mite.env, orglspider(ord, Shrub, col = 1:3, scaling = "sites"))
with(mite.env, orglellipse(ord, Shrub, col = 1:3, kind = "se", conf = 0.95,
    scaling = "sites"))
}
}
\keyword{ hplot }
\keyword{ dynamic }
