`ordiplot3d` <-
    function (object, display = "sites", choices = c(1,3,2), col = "black",
              ax.col = "red", arr.len = 0.1, arr.col = "blue", envfit,
              xlab, ylab, zlab, ...)
{
    ordiArgAbsorber <- function(..., shrink, origin, scaling, triangular,
                              display, choices, const, truemean, FUN)
        { match.fun(FUN)(...) }
    x <- scores(object, display = display, choices = choices, ...)
    if (missing(xlab)) xlab <- colnames(x)[1]
    if (missing(ylab)) ylab <- colnames(x)[2]
    if (missing(zlab)) zlab <- colnames(x)[3]
    if (is.factor(col))
        col = as.numeric(col)
    col <- rep(col, length = nrow(x))
    ## need scatterplot3d (>= 0.3-39) to set aspect ration; earlier we
    ## had a kluge here
    pl <- ordiArgAbsorber(x[, 1], x[, 2], x[, 3],
                          color = col,
                          xlab = xlab, ylab = ylab, zlab = zlab,
                          asp = 1,
                          FUN = "scatterplot3d", ...)
    pl$points3d(range(x[, 1]), c(0, 0), c(0, 0), type = "l",
                col = ax.col)
    pl$points3d(c(0, 0), range(x[, 2]), c(0, 0), type = "l",
                col = ax.col)
    pl$points3d(c(0, 0), c(0, 0), range(x[, 3]), type = "l",
                col = ax.col)
    if (!missing(envfit) ||
        (inherits(object, "cca") && !is.null(object$CCA) && object$CCA$rank > 0)) {
        if (!missing(envfit))
            object <- envfit
        bp <- scores(object, dis = "bp", choices = choices, ...)
        cn <- scores(object, dis = "cn", choices = choices, ...)
        if (!is.null(cn) && !any(is.na(cn))) {
            bp <- bp[!(rownames(bp) %in% rownames(cn)), , drop = FALSE]
            cn.xyz <- pl$xyz.convert(cn)
            points(cn.xyz, pch = "+", cex = 2, col = arr.col)
        }
        if (!is.null(bp) && nrow(bp) > 0) {
            tmp <- pl$xyz.convert(bp)
            mul <- ordiArrowMul(cbind(tmp$x, tmp$y), fill=1)
            bp.xyz <- pl$xyz.convert(bp * mul)
            orig <- pl$xyz.convert(0, 0, 0)
            arrows(orig$x, orig$y, bp.xyz$x, bp.xyz$y, length = arr.len,
                   col = arr.col)
        }
    }
    ## save the location of the origin
    pl$origin <- matrix(unlist(pl$xyz.convert(0, 0, 0)), nrow=1)
    ## Add function that flattens 3d envfit object so that it can be
    ## projected on the created 3d graph
    xyz2xy <- pl$xyz.convert
    envfit.convert <- function(object) {
        if (!is.null(object$vectors)) {
            rn <- rownames(object$vectors$arrows)
            arr <- object$vectors$arrows[, choices, drop = FALSE]
            arr <- sapply(xyz2xy(arr), cbind)
            if (!is.matrix(arr))
                arr <- matrix(arr, ncol = 2)
            arr <- sweep(arr, 2, pl$origin)
            rownames(arr) <- rn
            object$vectors$arrows <- arr
        }
        if (!is.null(object$factors)) {
            rn <- rownames(object$factors$centroids)
            object$factors$centroids <-
                object$factors$centroids[ ,choices, drop = FALSE]
            object$factors$centroids <-
                sapply(xyz2xy(object$factors$centroids), cbind)
            if (!is.matrix(object$factors$centroids))
                object$factors$centroids <-
                    matrix(object$factors$centroids, ncol = 2)
            rownames(object$factors$centroids) <- rn
        }
        object
    }
    pl$envfit.convert <- envfit.convert
    ## save projected coordinates of points
    tmp <- pl$xyz.convert(x)
    pl$points <- cbind(tmp$x, tmp$y)
    rownames(pl$points) <- rownames(x)
    if (exists("bp.xyz")) {
        pl$arrows <- cbind(bp.xyz$x, bp.xyz$y)
        rownames(pl$arrows) <- rownames(bp)
    }
    if (exists("cn.xyz")) {
        pl$centroids <- cbind(cn.xyz$x, cn.xyz$y)
        rownames(pl$centroids) <- rownames(cn)
    }
    class(pl) <- c("ordiplot3d", "ordiplot")
    invisible(pl)
}
