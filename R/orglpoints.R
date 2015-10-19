`orglpoints` <-
    function (object, display = "sites", choices = 1:3, radius, ...) 
{
    x <- scores(object, display = display, choices = choices, ...)
    ## default radius
    if (missing(radius))
        radius <- max(apply(x, 2, function(z) diff(range(z))))/100
    ## honor cex
    cex <- match.call(expand.dots = FALSE)$...$cex
    if (!is.null(cex))
        radius <- cex * radius
    rgl.points(x, radius = radius, ...)
    invisible()
}

