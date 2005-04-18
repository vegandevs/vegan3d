"orgltext" <-
    function (object, text, display = "sites", choices = 1:3, justify = "center", ...) 
{
    x <- scores(object, display = display, choices = choices, ...)
    if (missing(text))
        text <- rownames(x)
    rgl.texts(x[,1],x[,2],x[,3], text, justify = justify, ...)
    invisible()
}

