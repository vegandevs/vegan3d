`orglellipse` <-
    function(object, groups, display = "sites", choices = 1:3, ...)
{
    x <- scores(object, display = display, choices = choices, ...)
    groups <- as.factor(groups)
    Cov <- list()
    for (g in levels(groups))
        Cov[[g]] <- cov(x[groups == g,, drop = FALSE])
    Cnt <- list()
    for (g in levels(groups))
        Cnt[[g]] <- colMeans(x[groups == g,, drop = FALSE])
    count <- table(groups)
    for(i in seq_len(length(Cov)))
        plot3d(ellipse3d(Cov[[i]], centre = Cnt[[i]]),
               add = TRUE, alpha = 0.3, col = i)
}
