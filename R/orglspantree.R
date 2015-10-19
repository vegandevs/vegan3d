`orglspantree` <-
    function(object, spantree, display = "sites", choices = 1:3, col = 1,
             ...)
{
    if (!inherits(spantree, "spantree"))
        stop("'spantree' must be a result of vegan::spantree() function")
    x <- scores(object, display = display, choices = choices, ...)
    ## get kids
    k <- spantree$kid
    ## lines
    for (i in 1:length(k)) {
        one <- x[i+1,]
        two <- x[k[i],]
        rgl.lines(rbind(one, two), col = col, ...)
    }
}
