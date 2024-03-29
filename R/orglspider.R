`orglspider` <-
    function (object, groups, display = "sites",
              w = weights(object, display), choices = 1:3, col = "black", ...)
{
    weights.default <- function(object, ...) NULL
    if (inherits(object, "cca") && missing(groups)) {
        lc <- scores(object, display = "lc", choices = choices, ...)
        wa <- scores(object, display = "wa", choices = choices, ...)
        if (length(lc) == 0 || length(wa) == 0)
            stop("needs constrained ordination with WA and LC scores when 'groups' is missing")
        for (i in 1:nrow(lc)) segments3d(c(lc[i, 1], wa[i, 1]), 
                                        c(lc[i, 2], wa[i, 2]),
                                        c(lc[i, 3], wa[i, 3]),
                                        color = col, ...)
    }
    else {
        pts <- scores(object, display = display, choices = choices,  ...)
        out <- seq(along = groups)
        w <- eval(w)
        if (length(w) == 1) 
            w <- rep(1, nrow(pts))
        if (is.null(w)) 
            w <- rep(1, nrow(pts))
        inds <- names(table(groups))
        if (is.factor(col))
            col <- as.numeric(col)
        col <- rep(col, length = length(inds))
        names(col) <- inds
        for (is in inds) {
            gr <- out[groups == is]
            if (length(gr) > 1) {
                X <- pts[gr, ]
                W <- w[gr]
                ave <- apply(X, 2, weighted.mean, w = W)
                for (i in 1:length(gr))
                    segments3d(c(ave[1], X[i,1]), c(ave[2], X[i, 2]),
                              c(ave[3], X[i, 3]),  col = col[is], ...)
            }
        }
    }
    invisible()
}
