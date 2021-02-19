#' Compute the mean of the column in a data.frame
#'
#' @param column_name character: Column name for which the mean is to be
#' computed
#' @param path character: Path to the data file
#' @param filetype character: filetype to be read
#' @return numeric
#' @export
#'
compute_mean <- function(column_name,
                         path,
                         filetype = c("rds",
                                      "fst",
                                      "qs",
                                      "parquet")) {

  df <- get_data(path, filetype = filetype)
  out <- mean(df[[column_name]], na.rm = TRUE)

  return(out)
}

#' Returns a histogram
#'
#' @param path character: Path to microdata file
#'
#' @return png
#' @export
#'

plot_data <- function(path) {
  df <- get_data(path)
  png("plot.png")
  out <- ggplot2::ggplot(df, ggplot2::aes(x = df[["welfare"]])) +
    ggplot2::geom_histogram()
  print(out)
  dev.off()
}
