`orglpoints` <-
    function (object, display = "sites", choices = 1:3, radius, ...) 
{
    x <- scores(object, display = display, choices = choices, ...)
    if (missing(radius))
        radius <- max(apply(x, 2, function(z) diff(range(z))))/100
    rgl.points(x, radius = radius, ...)
    invisible()
}

