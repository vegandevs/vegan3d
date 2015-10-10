`ordicluster3d` <-
    function(ord, cluster, choices = c(1,2), display = "sites", ...)
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
    pl$points3d(ord, ...)
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
                          leaf$x[-merge[i,j]], leaf$y[-merge[i,j]], ...)
             else
                 segments(node$x[i], node$y[i],
                          node$x[merge[i,j]], node$y[merge[i,j]], ...)

    pl$nodes <- node
    pl$leaves <- leaf
    invisible(pl)
}
