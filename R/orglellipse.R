`orglellipse` <-
    function(object, groups, display = "sites", kind = c("sd", "se"),
             conf, choices = 1:3, alpha = 0.3, col = 2, ...)
{
    x <- scores(object, display = display, choices = choices, ...)
    groups <- as.factor(groups)
    ## covariance and centres as lists
    Cov <- list()
    for (g in levels(groups))
        Cov[[g]] <- cov(x[groups == g,, drop = FALSE])
    Cnt <- list()
    for (g in levels(groups))
        Cnt[[g]] <- colMeans(x[groups == g,, drop = FALSE])
    ## counts in groups
    count <- table(groups)
    if (kind == "se")
        for(i in seq_along(count))
            Cov[[i]] <- Cov[[i]]/count[i]
    ## recycle colours
    col <- rep(col, length = length(Cov))
    ## rgl::ellipse3d defaults to confidence envelopes, but we want to
    ## default to sd/se and only use confidence ellipses if conf is
    ## given
    if (missing(conf))
        t <- 1
    else
        t <- sqrt(qchisq(conf, 3))
    ## graph
    for(i in seq_len(length(Cov)))
        plot3d(ellipse3d(Cov[[i]], centre = Cnt[[i]], t = t),
               add = TRUE, alpha = alpha, col = col[i], ...)
}
