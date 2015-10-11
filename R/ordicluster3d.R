`ordicluster3d` <-
    function(ord, cluster, display = "sites", choices = c(1,2), pcol = 1,
             col = 1, type = "p", ...)
{
    ## ordination scores in 2d: leaves
    ord <- scores(ord, choices = choices, display = display, ...)
    ## pad z-axis to zeros
    if (ncol(ord) != 2)
        stop(gettextf("needs plane in 2d, got %d", ncol(ord)))
    ord <- cbind(ord, 0)
    ## get coordinates of internal nodes with vegan:::reorder.hclust
    x <- reorder(cluster, ord[,1], agglo.FUN = "mean")$value
    y <- reorder(cluster, ord[,2], agglo.FUN = "mean")$value
    xyz <- cbind(x, y, "height" = cluster$height)
    ## set up frame
    pl <- scatterplot3d(rbind(ord, xyz), type = "n")
    if (type == "p")
        pl$points3d(ord, col = pcol, ...)
    else if (type == "t")
        text(pl$xyz.convert(ord), rownames(ord), col = pcol, ...)
    ## project leaves and nodes to 2d
    leaf <- pl$xyz.convert(ord)
    node <- pl$xyz.convert(xyz)
    ## two lines from each node down, either to a leaf or to an
    ## internal node
    merge <- cluster$merge
    for (i in seq_len(nrow(merge)))
         for (j in 1:2)
             if (merge[i,j] < 0)
                 segments(node$x[i], node$y[i],
                          leaf$x[-merge[i,j]], leaf$y[-merge[i,j]],
                          col = col, ...)
             else
                 segments(node$x[i], node$y[i],
                          node$x[merge[i,j]], node$y[merge[i,j]],
                          col = col, ...)

    pl$nodes <- node
    pl$leaves <- leaf
    invisible(pl)
}

`orglcluster` <-
    function(ord, cluster, display = "sites", choices = c(1, 2),
             pcol = "red", col = "blue", type = "p", ...)
{
    p <- cbind(scores(ord, choices = choices, display = display, ...), 0)
    if (ncol(p) != 3)
        stop(gettextf("needs 2D ordination plane, but got %d", ncol(p)-1))
    x <- reorder(cluster, p[,1], agglo.FUN = "mean")$value
    y <- reorder(cluster, p[,2], agglo.FUN = "mean")$value
    z <- cluster$height
    merge <- cluster$merge
    ## adjust height
    z <- mean(c(diff(range(x)), diff(range(y))))/diff(range(z)) * z
    ## plot
    rgl.clear()
    if (type == "p")
        rgl.points(p, col = pcol, ...)
    else if (type == "t")
        rgl.texts(p, text = rownames(p), col = pcol, ...)
    for (i in seq_len(nrow(merge)))
        for(j in 1:2)
            if (merge[i,j] < 0)
                rgl.lines(c(x[i], p[-merge[i,j],1]),
                          c(y[i], p[-merge[i,j],2]),
                          c(z[i], 0), col=col)
            else
                rgl.lines(c(x[i], x[merge[i,j]]),
                          c(y[i], y[merge[i,j]]),
                          c(z[i], z[merge[i,j]]), col=col)
}
