#' Helper function to load data into memory
#'
#' @param path character: Path to .parquet file
#'
#' @return data.frame
#' @export
#'
get_data <- function(path) {
  out <- arrow::read_parquet(path)

  return(out)
}
