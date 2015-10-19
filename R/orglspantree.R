`orglspantree` <-
    function(object, spantree, display = "sites", choices = 1:3, col = 1,
             ...)
{
    if (!inherits(spantree, "spantree"))
        stop("'spantree' must be a result of vegan::spantree() function")
    x <- scores(object, display = display, choices = choices, ...)
    ## get kids
    k <- spantree$kid
    ## change colors to rgb in 0..1 and recycle if needed
    col <- rep(col, length = nrow(x))
    if (is.factor(col))
        col <- as.numeric(col)
    col <- col2rgb(col)/255
    ## lines
    for (i in 1:length(k)) {
        one <- x[i+1,]
        two <- x[k[i],]
        lcol <- rgb(t(col[, i+1] + col[,k[i]])/2)
        rgl.lines(rbind(one, two), col = lcol, ...)
    }
}
