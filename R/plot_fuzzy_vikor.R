#' Bubble plot for fuzzy VIKOR results
#'
#' @param x object of class fuzzy_vikor_res
#' @param ... passed to plot
#' @export
plot.fuzzy_vikor_res <- function(x, ...) {
  df <- x$results

  plot(
    df$TotalLoss, df$MaxLoss,
    cex = sqrt(pmax(df$Compromise, 0)) + 0.5,
    pch = 19,
    xlab = "TotalLoss",
    ylab = "MaxLoss",
    ...
  )

  text(df$Def_S, df$Def_R, labels = df$Alternative, pos = 3, cex = 0.8)
}
