`plot.orditkplot` <-
    function(x, ...)
{
    op <- par(x$par)
    on.exit(par(op))
    plot(x$points, pch = 21, cex = x$args$pcex, col = x$args$pcol,
         bg = x$args$pbg, xlim = x$args$xlim, ylim = x$args$ylim, asp=1)
    text(x$labels, rownames(x$labels), cex = x$args$tcex)
    invisible(x)
}
