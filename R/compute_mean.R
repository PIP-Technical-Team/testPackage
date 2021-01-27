#' Compute the mean of the column in a data.frame
#'
#' @param column_name character: Column name for which the mean is to be
#' computed
#' @param path character: Path to the data file
#'
#' @return numeric
#' @export
#'
compute_mean <- function(column_name,
                         path) {

  df <- get_data(path)
  out <- mean(df[[column_name]], na.rm = TRUE)

  return(out)
}
