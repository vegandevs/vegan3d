`ordirgl` <-
    function (object, display = "sites", choices = 1:3, type = "p",
              col = "black", ax.col = "red", arr.col = "yellow", radius,
              text, envfit, ...)
{
    x <- scores(object, display = display, choices = choices,
                ...)
    if (ncol(x) < 3)
        stop("3D display needs three dimensions...")
    ## clear window and set isometric aspect ratio
    clear3d()
    op <- aspect3d("iso")
    if (!all(op$scale == 1))
        warning("set isometric aspect ratio, previously was ",
                paste(round(op$scale, 3), collapse=", "))
    ## colors to a vector, factors to numeric
    if (is.factor(col))
        col <- as.numeric(col)
    col <- rep(col, length = nrow(x))
    ## on.exit(aspect3d(op)) # Fails on.exit: rgl plot is still open
    if (type == "p")  {
        ## default radius
        if (missing(radius))
            radius <- max(apply(x, 2, function(z) diff(range(z))))/100
        ## users may expect cex to work (I would)
        cex <- eval(match.call(expand.dots = FALSE)$...$cex)
        if (!is.null(cex))
            radius <- cex * radius
        spheres3d(x, radius = radius, col = col,  ...)
    }
    else if (type == "t") {
        if (missing(text))
            text <- rownames(x)
        text3d(x[, 1], x[, 2], x[, 3], text, adj = 0.5, col = col,  ...)
    }
    segments3d(range(x[, 1]), c(0, 0), c(0, 0), col = ax.col)
    segments3d(c(0, 0), range(x[, 2]), c(0, 0), col = ax.col)
    segments3d(c(0, 0), c(0, 0), range(x[, 3]), col = ax.col)
    text3d(1.1 * max(x[, 1]), 0, 0, colnames(x)[1], col = ax.col,
              adj = 0.5)
    text3d(0, 1.1 * max(x[, 2]), 0, colnames(x)[2], col = ax.col,
              adj = 0.5)
    text3d(0, 0, 1.1 * max(x[, 3]), colnames(x)[3], col = ax.col,
              adj = 0.5)
    if (!missing(envfit) ||
        (is.list(object) && !is.null(object$CCA) && object$CCA$rank > 0)) {
        if (!missing(envfit))
            object <- envfit
        ## user can set envfit=NA to suppress display of biplot &
        ## centroids in constrained ordination
        if (!missing(envfit) && all(is.na(envfit)))
            return(invisible())
        bp <- scores(object, dis = "bp", choices = choices)
        cn <- scores(object, dis = "cn", choices = choices)
        if (!is.null(cn) && !any(is.na(cn))) {
            bp <- bp[!(rownames(bp) %in% rownames(cn)), , drop = FALSE]
            text3d(cn[, 1], cn[, 2], cn[, 3], rownames(cn),
                      col = arr.col, adj = 0.5)
            points3d(cn[, 1], cn[, 2], cn[, 3], size = 5, col = arr.col)
        }
        if (!is.null(bp) && nrow(bp) > 0) {
            mul <- c(range(x[, 1]), range(x[, 2]),
                     range(x[, 3]))/c(range(bp[, 1]), range(bp[, 2]),
                                      range(bp[, 3]))
            mul <- mul[is.finite(mul) & mul > 0]
            mul <- min(mul)
            bp <- bp * mul
            for (i in 1:nrow(bp)) {
                segments3d(c(0, bp[i, 1]), c(0, bp[i, 2]),
                           c(0, bp[i, 3]), col = arr.col)
                text3d(1.1 * bp[i, 1], 1.1 * bp[i, 2], 1.1 *
                          bp[i, 3], rownames(bp)[i], col = arr.col,
                          adj = 0.5)
            }
        }
    }
    invisible()
}
